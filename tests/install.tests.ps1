#requires -Version 5.1
param([string]$TestRoot = (Join-Path ([IO.Path]::GetTempPath()) ('frame-skill-check-' + [Guid]::NewGuid().ToString('N'))))
$ErrorActionPreference = 'Stop'
$taskPackage = Split-Path $PSScriptRoot -Parent
$taskInstaller = Join-Path $taskPackage 'install.ps1'
$taskRoot = [IO.Path]::GetFullPath($TestRoot)
if (Test-Path -LiteralPath $taskRoot) { throw 'Choose an unused TestRoot. This check preserves its artifacts.' }
$taskChecks = [Collections.Generic.List[string]]::new()
function Assert-Check([bool]$Condition, [string]$Message) {
    if (!$Condition) { throw "FAIL: $Message" }
    $taskChecks.Add($Message)
}

$taskPreviewRoot = Join-Path $taskRoot 'preview only\skills'
& $taskInstaller -DestinationRoot $taskPreviewRoot -WhatIf
Assert-Check (!(Test-Path -LiteralPath $taskRoot)) 'Preview does not create files'

$taskInstallRoot = Join-Path $taskRoot 'profile with spaces\skills'
$taskInstalled = @(& $taskInstaller -DestinationRoot $taskInstallRoot)[-1]
$taskSkillPath = Join-Path $taskInstallRoot 'cognitive-perspective-check'
Assert-Check (Test-Path -LiteralPath (Join-Path $taskSkillPath 'SKILL.md')) 'Fresh install works with spaces'
Assert-Check (Test-Path -LiteralPath (Join-Path $taskSkillPath 'references\deepen.md')) 'Referenced continuation resource is installed'
Assert-Check (Test-Path -LiteralPath (Join-Path $taskSkillPath 'LICENSE')) 'MIT license travels with the skill'

$taskOriginalHash = (Get-FileHash -LiteralPath (Join-Path $taskSkillPath 'SKILL.md')).Hash
$taskAgain = @(& $taskInstaller -DestinationRoot $taskInstallRoot)[-1]
Assert-Check ($taskAgain.Status -eq 'Already installed') 'Identical installation is idempotent'

$taskLocalNote = Join-Path $taskSkillPath 'local-note.txt'
[IO.File]::WriteAllText($taskLocalNote, 'local modification')
$taskRefused = $false
try { & $taskInstaller -DestinationRoot $taskInstallRoot | Out-Null } catch { $taskRefused = $true }
Assert-Check ($taskRefused -and (Test-Path -LiteralPath $taskLocalNote)) 'Different installation is refused without losing local content'
Assert-Check (((Get-FileHash -LiteralPath (Join-Path $taskSkillPath 'SKILL.md')).Hash) -eq $taskOriginalHash) 'Refusal preserves original skill'

$taskUpdated = @(& $taskInstaller -DestinationRoot $taskInstallRoot -ReplaceExisting)[-1]
Assert-Check ($taskUpdated.Status -eq 'Installed' -and (Test-Path -LiteralPath (Join-Path $taskUpdated.Backup 'local-note.txt'))) 'Explicit update backs up local changes'
Assert-Check (!$taskUpdated.Backup.StartsWith($taskInstallRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) 'Backup stays outside discovery directory'
Assert-Check (!(Test-Path -LiteralPath $taskLocalNote)) 'New installation uses the packaged version'
Assert-Check (@(Get-ChildItem -LiteralPath $taskInstallRoot -Recurse -Filter SKILL.md -File -Force).Count -eq 1) 'Only one skill is discoverable after update'

$taskCollisionRoot = Join-Path $taskRoot 'collision\skills'
New-Item -ItemType Directory -Path $taskCollisionRoot -Force | Out-Null
[IO.File]::WriteAllText((Join-Path $taskCollisionRoot 'cognitive-perspective-check'), 'keep me')
$taskCollisionRefused = $false
try { & $taskInstaller -DestinationRoot $taskCollisionRoot | Out-Null } catch { $taskCollisionRefused = $true }
Assert-Check ($taskCollisionRefused -and ([IO.File]::ReadAllText((Join-Path $taskCollisionRoot 'cognitive-perspective-check')) -eq 'keep me')) 'File collision is refused and preserved'

[PSCustomObject]@{ Passed = $taskChecks.Count; Checks = $taskChecks.ToArray(); Artifacts = $taskRoot } | ConvertTo-Json -Depth 3

#requires -Version 5.1
[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [ValidateSet('Copilot', 'Shared')][string]$Target = 'Copilot',
    [string]$DestinationRoot,
    [switch]$ReplaceExisting
)

$ErrorActionPreference = 'Stop'
$taskSkillName = 'cognitive-perspective-check'
$taskSource = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot ('skills\' + $taskSkillName)))

function Assert-PlainPath([string]$Path) {
    $taskCurrent = [IO.Path]::GetFullPath($Path)
    while ($taskCurrent) {
        if (Test-Path -LiteralPath $taskCurrent) {
            $taskItem = Get-Item -LiteralPath $taskCurrent -Force
            if (($taskItem.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
                throw "Linked paths are not supported by this installer: $taskCurrent. Use manual installation."
            }
        }
        $taskParent = [IO.Path]::GetDirectoryName($taskCurrent.TrimEnd([char[]]'\/'))
        if (!$taskParent -or $taskParent -eq $taskCurrent) { break }
        $taskCurrent = $taskParent
    }
}

function Assert-ChildPath([string]$Path, [string]$Root) {
    $taskFull = [IO.Path]::GetFullPath($Path)
    $taskPrefix = [IO.Path]::GetFullPath($Root).TrimEnd([char[]]'\/') + [IO.Path]::DirectorySeparatorChar
    if (!$taskFull.StartsWith($taskPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        throw "Path is outside the intended directory: $taskFull"
    }
    Assert-PlainPath $taskFull
}

function Get-ContentMap([string]$Path) {
    $taskBase = [IO.Path]::GetFullPath($Path).TrimEnd([char[]]'\/')
    Assert-PlainPath $taskBase
    $taskEntries = @(Get-ChildItem -LiteralPath $taskBase -Recurse -Force)
    foreach ($taskEntry in $taskEntries) {
        if (($taskEntry.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) {
            throw "Linked files are not supported: $($taskEntry.FullName)"
        }
    }
    $taskMap = foreach ($taskFile in ($taskEntries | Where-Object { !$_.PSIsContainer } | Sort-Object FullName)) {
        $taskRelative = $taskFile.FullName.Substring($taskBase.Length + 1)
        $taskHash = (Get-FileHash -LiteralPath $taskFile.FullName -Algorithm SHA256).Hash
        "$taskRelative=$taskHash"
    }
    return ($taskMap -join "`n")
}

Assert-PlainPath $taskSource
$taskManifest = Join-Path $taskSource 'SKILL.md'
if (!(Test-Path -LiteralPath $taskManifest -PathType Leaf)) { throw 'Package is incomplete: skills/cognitive-perspective-check/SKILL.md is missing.' }
$taskText = [IO.File]::ReadAllText($taskManifest)
if ($taskText -notmatch '(?m)^name: cognitive-perspective-check\r?$') { throw 'Skill name does not match this package.' }
$taskSourceMap = Get-ContentMap $taskSource

if (!$DestinationRoot) {
    $taskUserDirectory = [Environment]::GetFolderPath('UserProfile')
    if (!$taskUserDirectory) { throw 'Cannot locate the user profile. Use -DestinationRoot or manual installation.' }
    $taskRelativeRoot = if ($Target -eq 'Copilot') { '.copilot\skills' } else { '.agents\skills' }
    $DestinationRoot = Join-Path $taskUserDirectory $taskRelativeRoot
}
$taskRoot = [IO.Path]::GetFullPath($DestinationRoot)
$taskParentRoot = [IO.Path]::GetDirectoryName($taskRoot.TrimEnd([char[]]'\/'))
if (!$taskParentRoot) { throw 'Choose a skills directory below a parent directory, not a drive root.' }
$taskDestination = Join-Path $taskRoot $taskSkillName
Assert-PlainPath $taskRoot
Assert-ChildPath $taskDestination $taskRoot
if ((Test-Path -LiteralPath $taskRoot) -and !(Test-Path -LiteralPath $taskRoot -PathType Container)) { throw 'The destination root is not a directory.' }

if (Test-Path -LiteralPath $taskDestination) {
    if (!(Test-Path -LiteralPath $taskDestination -PathType Container)) { throw 'A file already occupies the skill destination.' }
    if ((Get-ContentMap $taskDestination) -ceq $taskSourceMap) {
        Write-Host "Already installed: $taskDestination"
        [PSCustomObject]@{ Status = 'Already installed'; Path = $taskDestination; Backup = $null }
        return
    }
    if (!$ReplaceExisting) { throw "An existing skill differs. It was preserved. To back it up and update, rerun with -ReplaceExisting. Path: $taskDestination" }
}

if (!$PSCmdlet.ShouldProcess($taskDestination, 'Install local skill (back up an existing different version)')) { return }

New-Item -ItemType Directory -Path $taskRoot -Force | Out-Null
$taskStageRoot = Join-Path $taskParentRoot 'skill-install-staging'
Assert-PlainPath $taskStageRoot
New-Item -ItemType Directory -Path $taskStageRoot -Force | Out-Null
$taskStage = Join-Path $taskStageRoot ($taskSkillName + '-' + [Guid]::NewGuid().ToString('N'))
Assert-ChildPath $taskStage $taskStageRoot
Copy-Item -LiteralPath $taskSource -Destination $taskStage -Recurse
if ((Get-ContentMap $taskStage) -cne $taskSourceMap) { throw "Copy verification failed. Original preserved. Staging directory: $taskStage" }

$taskBackup = $null
if (Test-Path -LiteralPath $taskDestination) {
    # Keep backups outside skills discovery to avoid duplicate skill names.
    $taskBackupRoot = Join-Path $taskParentRoot 'skill-backups'
    Assert-PlainPath $taskBackupRoot
    New-Item -ItemType Directory -Path $taskBackupRoot -Force | Out-Null
    $taskBackup = Join-Path $taskBackupRoot ($taskSkillName + '-' + [DateTime]::UtcNow.ToString('yyyyMMddTHHmmssZ') + '-' + [Guid]::NewGuid().ToString('N'))
    Assert-ChildPath $taskDestination $taskRoot
    Assert-ChildPath $taskBackup $taskBackupRoot
    Move-Item -LiteralPath $taskDestination -Destination $taskBackup
}

try {
    Assert-ChildPath $taskStage $taskStageRoot
    Assert-ChildPath $taskDestination $taskRoot
    Move-Item -LiteralPath $taskStage -Destination $taskDestination
} catch {
    if ($taskBackup -and !(Test-Path -LiteralPath $taskDestination)) {
        Assert-ChildPath $taskBackup $taskBackupRoot
        Assert-ChildPath $taskDestination $taskRoot
        Move-Item -LiteralPath $taskBackup -Destination $taskDestination
    }
    throw
}

[PSCustomObject]@{ Status = 'Installed'; Path = $taskDestination; Backup = $taskBackup }
Write-Host "Installed path: $taskDestination"
if ($taskBackup) { Write-Host "Backup path: $taskBackup" }
Write-Host 'Open a new chat or restart the client if needed. Explicitly name cognitive-perspective-check for the first check.'

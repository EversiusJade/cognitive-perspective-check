@echo off
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1" -Target Shared
set "TASK_SKILL_EXIT=%errorlevel%"
if not "%TASK_SKILL_EXIT%"=="0" echo Installation failed. See INSTALL.md for manual installation.
pause
exit /b %TASK_SKILL_EXIT%

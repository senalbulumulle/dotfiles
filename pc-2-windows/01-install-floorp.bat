@echo off
setlocal

echo Installing Floorp browser...

where winget >nul 2>nul
if %errorlevel% neq 0 (
    echo winget was not found on this system.
    echo Install "App Installer" from the Microsoft Store, then re-run this script.
    pause
    exit /b 1
)

winget install --id=Floorp.Floorp -e --accept-source-agreements --accept-package-agreements

if %errorlevel% neq 0 (
    echo Floorp installation failed.
    pause
    exit /b 1
)

echo Floorp installation complete.
pause
endlocal

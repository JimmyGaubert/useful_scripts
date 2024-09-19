@echo off
powershell -Command "(New-Object -ComObject Shell.Application).minimizeall()"
node -v > nul 2> nul
if %errorlevel% neq 0 (
    start /wait winget install OpenJS.NodeJS.LTS --accept-source-agreements > nul 2> nul
    set "PATH=%PATH%;C:\Program Files\nodejs"
    ::node -v
    ::pause
    exit /b 0
) else (
    ::node -v
    ::pause
    exit /b 0
)
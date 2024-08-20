@echo off
powershell -Command "(New-Object -ComObject Shell.Application).minimizeall()"
node -v > nul 2> nul
if %errorlevel% neq 0 (
    start /wait winget install OpenJS.NodeJS.LTS --accept-source-agreements > nul 2> nul
    set "PATH=%PATH%;C:\Program Files\nodejs"
    > nul 2> nul call npm i pm2 -g
    > nul 2> nul call npm i pm2-windows-startup -g
    > nul 2> nul call pm2-startup install
    exit /b 0
) else (
    exit /b 0
)
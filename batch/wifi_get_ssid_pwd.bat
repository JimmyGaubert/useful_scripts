@echo off
setlocal EnableDelayedExpansion
for /f "tokens=2 delims=: " %%A in ('netsh wlan show interfaces ^| findstr "SSID"') do ( set "ssid=%%A" )
if "%ssid%"=="" (
    echo No network interface found!
    pause
    exit /b 0
) else (
    for /f "tokens=2 delims=:" %%A in ('netsh wlan show profiles ^| findstr /i /c:"%ssid%"') do (
        set "profile=%%A"
        set "profile=!profile:~1!"
        if "!profile!"=="" (
            rem lulz
        ) else (
            cls
            call netsh wlan show profiles name="!profile!" key=clear | findstr /i "interface Wi-Fi"
            call netsh wlan show profiles name="!profile!" key=clear | findstr /i "Contenu" | for /f "tokens=1* delims=:" %%B in ('findstr /r /c:"Contenu"') do @echo %%C
        )
    )
    pause >nul
    exit /b 0
)
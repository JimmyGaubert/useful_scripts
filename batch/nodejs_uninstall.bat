@echo off
powershell -Command "(New-Object -ComObject Shell.Application).minimizeall()"
start /B winget uninstall OpenJS.NodeJS.LTS --accept-source-agreements
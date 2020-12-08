@echo off
title openOCD

echo Get IP-address && echo.

for /F "tokens=2 delims=:" %%i in ('"ipconfig | findstr IP | findstr 192."') do SET MY_IP_ADDRESS=%%i
echo Local IP-address:%MY_IP_ADDRESS%
echo This address must match with the ip-address configurated in the .vscode/launch.json file! && echo. && echo.

echo Starting openOCD.. && echo.

set PATH_TO_OPENOCD=C:\Users\frda\Workspace\xpack-openocd-0.10.0-15
%PATH_TO_OPENOCD%\bin\openocd -f %PATH_TO_OPENOCD%\scripts\interface\stlink.cfg -f %PATH_TO_OPENOCD%\scripts\board\stm32l4discovery.cfg -c "gdb_port 3333" -c "telnet_port 4444" -c "bindto %MY_IP_ADDRESS%"

echo. && echo Exit..
pause
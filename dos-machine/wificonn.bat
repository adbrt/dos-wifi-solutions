@echo off
set argssid=%1
set argkey=%2

echo Wireless connection setup
echo: 

IF [%1] == [] GOTO :Usage
IF [%2] == [] GOTO :OpenNetwork

echo Connecting to %argssid% with password
htget -quiet "http://192.168.1.1/cgi-bin/luci/command/cfg099944/connect_wpa2%%20%%22%argssid%%%22%%20%%22%argkey%%%22
GOTO :End

:OpenNetwork
echo Connecting to %argssid% with no password
htget -quiet "http://192.168.1.1/cgi-bin/luci/command/cfg099944/connect_open%%20%%22%argssid%%%22
GOTO :End

:Usage
echo To connect use command: wificonn ssid password (optional)
echo eg. wificonn MyNetwork myPassword
echo note: substitute spaces with %%20 eg. wificonn My%%20Network myPassword
echo:


:End

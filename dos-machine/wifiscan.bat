@echo off
echo:
echo Scanning wireless networks
echo:
htget -quiet http://192.168.1.1/cgi-bin/luci/command/cfg0b9944
echo:
echo To connect use command: wificonn ssid password (optional)
echo eg. wificonn MyNetwork myPassword
rem echo Note: substitute spaces with %%20 eg. wificonn My%%20Network myPassword
echo: 

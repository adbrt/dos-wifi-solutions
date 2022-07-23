# dos-wifi-solutions

# WIP - still cleaning things up, preparing instructions

Ways of getting DOS machines on wireless network (hardware &amp; software)

This repository contains scripts that helped me get a 1991 laptop - Toshiba T3200SXC onto wireless network (details: https://hackaday.io/project/186447-toshiba-t3200sxc-fixupgrade-new-psu-lcd-wifi).
They may be adapted to be used with different machines.

Steps on OpenWRT router:
1. Install luci-app-commands package https://openwrt.org/packages/pkgdata/luci-app-commands
This package will allow executing commands on the router via simply opening URLs on the DOS machine (not the safest thing to do, but it works)
2. Put the following scripts on the OpenWRT router: https://github.com/adbrt/dos-wifi-solutions/tree/main/openwrt-router
3. Configure luci-app-commands as such:
*-Command line to execute: /root/setwifi.sh; 	Allow the user to provide additional command line arguments: YES; Allow executing the command and downloading its output without prior authentication: YES;
-Command line to execute: /root/wifilist.sh; 	Allow the user to provide additional command line arguments: NO; Allow executing the command and downloading its output without prior authentication: YES;*
4. Copy the command URLs from luci-app-commands control panel.

Steps on MS-DOS machine:
1. Install a packet driver
2. Install mTCP https://www.brutman.com/mTCP/mTCP.html
3. Configure autoexec.bat as such: https://github.com/adbrt/dos-wifi-solutions/blob/main/dos-machine/autoexec.bat
4. Copy wificonn.bat file and adjust the IP address and command URLs to match the OpenWRT router: https://github.com/adbrt/dos-wifi-solutions/blob/main/dos-machine/wificonn.bat
5. Do the same with wifiscan.bat file: https://github.com/adbrt/dos-wifi-solutions/blob/main/dos-machine/wifiscan.bat

Scan wireless networks on DOS machine using wifiscan.bat, and connect to them using wificonn.bat NetworkName NetworkPassword.

After the network setup is ready, a web browser, such as Links for DOS can be used: http://links.twibright.com/download.php

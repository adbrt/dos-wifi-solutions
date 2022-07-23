#!/bin/sh
# This script will return a list of wireless networks (run it without any arguments)

echo -n 'Saved target SSID: '
uci get wireless.@wifi-iface[0].ssid
echo -n 'Currently connected to: '
iwconfig wlan0 2> /dev/null | awk -F\" '{print $2}' | sed ':a;N;$!ba;s/\n//g'

echo
echo Available wireless networks:

iwlist wlan0 scanning | grep 'SSID\|Signal level\|Cell\|Encryption' |
 sed 's/Encryption key:on/\Encrypted/g' | # simplify encryption info
 sed 's/Encryption key:off/\Open/g' | # simplify encryption info
 sed 's/Signal level=//g' | # simplify signal info
 sed 's/         Cell/\nCell/g' | # move the header to the left
 sed 's/                   //g' | # move details to de left, leave one extra space
 sed ':a;N;$!ba;s/ \n//g' | # remove newlines between results
 sed "s/Cell.*/\*/" | # replace header of each result with just an asterisk symbol
 sed ':a;N;$!ba;s/\n / /g' | # combine each result into single line
 sed '/ESSID:""/d' # remove results with no ESSID
 #sed ':a;N;$!ba;s/\n/\n\n/g' # add extra newlines

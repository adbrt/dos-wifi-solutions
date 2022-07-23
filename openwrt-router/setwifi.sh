#!/bin/sh
#This script will connect to a wireless network used as follows:
# for encrypted networks:
# ./setwifi.sh connect_wpa2 WifiName WifiPassword
# for unencrypted networks:
# ./setwifi.sh connect_open WifiName

if [ $1 = "connect_wpa2" ]; then
  uci set wireless.@wifi-iface[0].ssid="$2"
  uci set wireless.@wifi-iface[0].key="$3"
  uci delete wireless.@wifi-iface[0].bssid
  uci set wireless.@wifi-iface[0].encryption=psk2
  uci set wireless.@wifi-iface[0].mode=sta
  uci set wireless.@wifi-iface[0].network=wwan
  uci commit
  wifi
  echo SSID set to \"$2\"
  echo Key was set to \"$3\"
  echo WPA2 mode
fi

if [ $1 = "connect_open" ]; then
  uci delete wireless.@wifi-iface[0].bssid
  uci set wireless.@wifi-iface[0].ssid="$2"
  uci delete wireless.@wifi-iface[0].key
  uci set wireless.@wifi-iface[0].encryption=none
  uci commit
  wifi
  echo SSID set to \"$2\"
  echo Open mode
fi

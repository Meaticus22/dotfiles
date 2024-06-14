#!/bin/bash

output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
airport=$(echo "$output" | grep 'AirPort' | awk -F': ' '{print $2}')

if [ "$airport" = "Off" ]; then
  echo "Offline"
else
  ssid=$(echo "$output" | grep ' SSID' | awk -F': ' '{print $2}')
  tx_rate=$(echo "$output" | grep 'lastTxRate' | awk -F': ' '{print $2}')
  
  # Remove the "SSID: " prefix using sed
  ssid_cleaned=$(echo "$ssid" | sed 's/SSID: //')
  
  echo "$ssid_cleaned" "$tx_rate" Mb/s
fi


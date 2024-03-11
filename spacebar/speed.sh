#!/bin/bash

output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
airport=$(echo "$output" | grep 'AirPort' | awk -F': ' '{print $2}')

if [ "$airport" = "Off" ]; then
  echo "Offline"
else
  ssid=$(echo "$output" | grep ' SSID' | awk -F': ' '{print $2}')
  rssi=$(echo "$output" | grep 'agrCtlRSSI' | awk -F': ' '{print $2}')
  rate=$(echo "$output" | grep 'lastTxRate' | awk -F': ' '{print $2}')

  # Calculate signal strength category based on RSSI
  case $(( (-rssi +  100) *  10  )) in
    (0..10) speed="extremely fast";;
    (11..20) speed="very fast";;
    (21..30) speed="fast";;
    (31..40) speed="average";;
    (41..50) speed="below average";;
    (51..60) speed="slow";;
    (*) speed="very slow";;
  esac

  echo "SSID: ${ssid} ${speed} (${rate} Mb/s)"
fi


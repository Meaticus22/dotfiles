#!/bin/bash

API_KEY="a6f5937d2bc884a4827f8e2179b94daf" # Replace with your actual OpenWeatherMap API key
LATITUDE="37.82532"
LONGITUDE="-79.59565"

# Fetch weather data from OpenWeatherMap
data=$(curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$LATITUDE&lon=$LONGITUDE&appid=$API_KEY&units=imperial")

if [[ $? -eq 0 ]]; then
    condition_id=$(echo $data | jq -r '.weather[0].id')
    high_temp=$(echo $data | jq -r '.main.temp_max')
    low_temp=$(echo $data | jq -r '.main.temp_min')
    feelslike=$(echo $data | jq -r '.main.feels_like')

    # Round temperatures to the nearest whole number
    high_temp=$(printf "%.0f\n" "$high_temp")
    low_temp=$(printf "%.0f\n" "$low_temp")
    feelslike=$(printf "%.0f\n" "$feelslike")

    # Map condition ID to icon code for Sketchybar
    case $condition_id in
        800) icon=" ";;
        801) icon="⛅";;
        802) icon="⛱";;
        803) icon="󰖐 ";;
        804) icon="☔";;
        *) icon="❓";; # Default icon if condition ID is unknown
    esac

    # Format the label to show high, low, and feels-like temperatures
    label="h: ${high_temp}°F / l: ${low_temp}°F / t: ${feelslike}°F"

    # Update Sketchybar with the new label
    sketchybar -m \
        --set weather \
            icon="$icon" \
            label="$label"
else
    echo "Failed to retrieve weather data."
fi


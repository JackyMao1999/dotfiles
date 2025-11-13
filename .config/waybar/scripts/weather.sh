#!/bin/sh
# weather information for location based on seen WiFi BSSIDs or IP as fallback

LOC="suzhou"
# get weather information
text="$(curl -s "https://wttr.in/$LOC?format=1")"

# output for Waybar
if ! echo "$text" | grep -q "Unknown location"; then
    echo "{\"text\": \"$text\", \"class\": \"weather\"}"
fi

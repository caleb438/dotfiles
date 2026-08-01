#!/usr/bin/env bash

BATTERY=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | head -n1)

if [[ ! -d "$BATTERY" ]]; then
    echo "#[fg=#667580󰂑"
    exit 0
fi

capacity=$(cat "$BATTERY/capacity")
status=$(cat "$BATTERY/status")

# Pick an icon based on battery percentage.
if (( capacity >= 90 )); then
    icon="󰁹"
elif (( capacity >= 70 )); then
    icon="󰂁"
elif (( capacity >= 50 )); then
    icon="󰁿"
elif (( capacity >= 30 )); then
    icon="󰁾"
elif (( capacity >= 10 )); then
    icon="󰁽"
else
    icon="󰁺"
fi

# Colors from the Petrol palette
if [[ "$status" == "Charging" ]]; then
    color="#63C7D8"      # cyan
elif (( capacity >= 60 )); then
    color="#86B97E"      # green
elif (( capacity >= 30 )); then
    color="#C9A86A"      # yellow
else
    color="#C56E74"      # red
fi

echo "#[fg=${color}]$icon ${capacity}%"


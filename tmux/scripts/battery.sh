#!/usr/bin/env bash

BATTERY=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' | head -n1)

if [[ ! -d "$BATTERY" ]]; then
    echo "󰂑"
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

# Show charging icon when actively charging.
if [[ "$status" == "Charging" ]]; then
    icon="󰂄"
fi

echo "$icon ${capacity}%"


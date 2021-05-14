#!/bin/bash
percent=$(system_profiler SPPowerDataType | grep "State of Charge (%)" | awk '{print $5}')
charging=$(system_profiler SPPowerDataType | grep -m 1 "Charging:" | awk '{print $2}')
echo "Battery Level $percent | Charging? $charging"

if [[ $percent > 74 ]] && [[ $charging == "Yes" ]]
then
    osascript -e "display notification \"Battery Level $percent\" with title \"Battery Overcharged\""
elif [[ $percent < 26 ]] && [[ $charging == "No" ]] 
then
    osascript -e "display notification \"Battery Level $percent\" with title \"Battery Undercharged\""
fi


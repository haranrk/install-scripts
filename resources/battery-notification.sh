#!/bin/bash
percent=$(system_profiler SPPowerDataType | grep "State of Charge (%)" | awk '{print $5}')

if [[ $percent > 75 ]] 
then
    osascript -e "display notification \"Battery Level $percent\" with title \"Battery Overcharged\""
elif [[ $percent < 25 ]] 
then
    osascript -e "display notification \"Battery Level $percent\" with title \"Battery Undercharged\""
fi


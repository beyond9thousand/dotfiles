#!/usr/bin/env zsh

case "$1" in
    -t | --temp)
        echo $(($(cat /sys/devices/virtual/thermal/thermal_zone1/hwmon4/temp1_input)/1000)) \
            | awk '{print}'
        ;;
esac

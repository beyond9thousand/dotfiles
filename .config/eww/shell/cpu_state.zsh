#!/usr/bin/env zsh

DEVICE=$(for i in /sys/class/hwmon/hwmon*/temp*_input; \
        do echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null \
        || echo $(basename ${i%_*})) $(readlink -f $i)"; done \
    | grep -w "pch_cannonlake" | awk -F 'temp1 ' '{print$2}')

cpu_temp(){
    while true; do
        awk '{print($1/1000)}' $DEVICE
        sleep 15
    done
}

case "$1" in
    -t | --temp)
        cpu_temp
        ;;
esac

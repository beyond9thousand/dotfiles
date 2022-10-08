#!/usr/bin/env zsh

monitor="/sys/class/backlight/intel_backlight/actual_brightness"

_watchdog(){
    inotifywait -q -m -e modify "$monitor" --format "%e"
}

nit_current=$(<"$monitor")

nit_percent(){
    echo $((nit_current * 100 / 120000))
}

nit_percent

_watchdog | while read -r _; do
    nit_current=$(<"$monitor")
    nit_percent
done

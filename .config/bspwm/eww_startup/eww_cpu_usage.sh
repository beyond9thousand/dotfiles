#!/bin/bash

loadavg() {
	awk '/cpu /{
    print $2" "$4" "$5
    }' /proc/stat
}

_calculate() {
	old="$(loadavg)"
	sleep 0.1
	new="$(loadavg)"
	awk '{
    $1-=$4
    $2-=$5
    $3-=$6
    printf("%.0f\n", 100*($1 + $2) / ($1 + $2 + $3))
}' <<<"$new $old"
	old="$new"
}

while true; do
	result=$(_calculate)
	eww update cpu_load="$result"
	sleep 5
done

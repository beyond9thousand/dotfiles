#!/bin/bash

while true; do
	if [[ $(eww get usage_hover) == "true" ]]; then
		_memory=$(free -h --si | awk '/^Mem:/ {print $3 "B"}')
		eww update mem_load="$_memory"
		sleep 5
	fi
  sleep 0.1
done

#!/bin/bash

while true; do
	_memory=$(free -h --si | awk '/^Mem:/ {print $3 "B"}')
	eww update mem_load="$_memory"
  sleep 5
done

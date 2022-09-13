#!/usr/bin/env zsh

if [[ $(eww get usage_hover) == "true" ]]; then
    _memory=$(free -h --si | awk '/^Mem:/ {print $3 "B"}')
    eww update mem_load="$_memory"
fi

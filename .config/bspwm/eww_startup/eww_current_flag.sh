#!/bin/bash

current_flag() {
	bspc subscribe node_flag | while read -r _ _ _ _ nature state; do
		if [[ $nature == "sticky" && $state == "on" ]]; then
			eww update sticky_var=""
			eww update sticky_hover=true
		elif [[ $nature == "sticky" && $state == "off" ]]; then
			eww update sticky_hover=false
		fi
	done
}

current_flag

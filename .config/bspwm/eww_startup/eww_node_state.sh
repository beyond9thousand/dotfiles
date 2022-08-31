#!/bin/bash

node_state() {
	bspc subscribe node_state | while read -r _ _ _ _ screen state; do
		if [[ $screen == "fullscreen" && $state == "on" ]]; then
      xdo lower -N Plank
			xdo lower -N eww-taskbar
		elif [[ $screen == "fullscreen" && $state == "off" ]]; then
      xdo raise -N Plank
			xdo raise -N eww-taskbar
		fi
		if [[ $screen == "pseudo_tiled" && $state == "on" ]]; then
			eww update layout_var=""
			eww update layout_hover=true
		elif [[ $screen == "floating" && $state == "on" ]]; then
			eww update layout_var=""
			eww update layout_hover=true
		else
			eww update layout_hover=false
		fi
	done
}

node_state

#!/bin/bash

query_instance() {
	if [[ $(bspc query -N -n focused.sticky) ]]; then
		eww update sticky_var="ﵯ"
		eww update sticky_hover=true
	else
		eww update sticky_hover=false
	fi
}

query_state() {
	if [[ $(bspc query -N -n focused.floating) ]]; then
		eww update layout_var="כּ"
		eww update layout_hover=true
	elif [[ $(bspc query -N -n focused.pseudo_tiled) ]]; then
		eww update layout_var="䀹"
		eww update layout_hover=true
	else
		eww update layout_hover=false
	fi
}

query_screen() {
	if [[ ! $(bspc query -N -n focused.fullscreen) ]]; then
		xdo raise -N eww-taskbar
		xdo raise -N Plank
	else
		xdo lower -N eww-taskbar
		xdo lower -N Plank
	fi
}

focus_switch() {
	bspc subscribe node_focus | while read -r _; do
		query_instance
		query_state
		query_screen
	done
}

focus_switch

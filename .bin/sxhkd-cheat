#!/usr/bin/env bash
# Credits due to this reddit post:
# https://www.reddit.com/r/bspwm/comments/aejyze/tip_show_sxhkd_keybindings_with_fuzzy_search/

_rofi() {
	rofi -dmenu -i -p "" -no-show-icons -l 10 \
		-config ~/.config/rofi/cheatsheet.rasi \
		-mesg " super |  control |  alt |  shift" \
		"$@"
}

cat "$HOME"/.config/sxhkd/sxhkdrc |
	awk '/^[a-z]/ && last {print $0," --> ",last} {last=""} /^#/{last=$0}' |
	sed "s/super//g" | sed "s/alt//g" | sed "s/ctrl//g" | sed "s/shift//g" |
	column -t -s "" |
	_rofi "$@"

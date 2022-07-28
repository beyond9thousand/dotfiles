#!/bin/bash

declare -a loop=(xbanish plank flameshot touchegg dunst)
for i in "${loop[@]}"; do
	pgrep -x "$i" | xargs kill
  $i &
done

if [[ ! $(pidof stalonetray) ]]; then
  stalonetray &
  xdo hide -n stalonetray
  polybar-msg action "#systray.hook.1"
  touch "/tmp/syshide.lock"
fi

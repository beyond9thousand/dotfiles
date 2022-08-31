#!/bin/bash

#                     _____                        __  _           
#   _________  ____  / __(_)___ ___  ___________ _/ /_(_)___  ____ 
#  / ___/ __ \/ __ \/ /_/ / __ `/ / / / ___/ __ `/ __/ / __ \/ __ \
# / /__/ /_/ / / / / __/ / /_/ / /_/ / /  / /_/ / /_/ / /_/ / / / /
# \___/\____/_/ /_/_/ /_/\__, /\__,_/_/   \__,_/\__/_/\____/_/ /_/ 
#                       /____/                                     
#

workspaces() {
  name=1
  for monitor in $(bspc query -M); do
    # bspc monitor "${monitor}" -n "$name" -d '' '' '' '' '' '' ''
    bspc monitor "${monitor}" -n "$name" -d '1' '2' '3' '4' '5' '6' '7'
    ((name++))
  done
}
workspaces

bspc config border_width 3
bspc config window_gap 10
bspc config split_ratio 0.50

# Colors
bspc config focused_border_color "#7bc5e4"
bspc config normal_border_color "#32344a"
bspc config active_border_color "#444b6a"

bspc config borderless_monocle true
bspc config gapless_monocle true
# bspc config paddingless_monocle true
bspc config single_monocle false
bspc config focus_follows_pointer true

# MOD key control
bspc config pointer_modifier mod4
bspc config pointer_action1 move
bspc config pointer_action2 resize_corner

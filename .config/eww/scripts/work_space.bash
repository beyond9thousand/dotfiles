#!/bin/bash

work_space_function() {
	workspaces=(1 2 3 4 5 6 7)
	STRING_LIT="(box :vexpand true :class \"workspace_box\" "
	for val in "${workspaces[@]}"; do
		# Workspace is focused
		if bspc query -D -d focused --names | grep -q "$val"; then
			STRING_LIT+="(eventbox :cursor \"pointer\" :onclick \"bspc desktop -f $val\" (label :class \"focused_workspace glyph_light\" :text \"\"))"
		# Workspace is occupied
		elif bspc query -D -d .occupied --names | grep -q "$val"; then
			STRING_LIT+="(eventbox :cursor \"pointer\" :onclick \"bspc desktop -f $val\" (label :class \"occupied_workspace glyph_light\" :text \"\"))"
		# Workspace is empty
		else
			STRING_LIT+="(eventbox :cursor \"pointer\" :onclick \"bspc desktop -f $val\" (label :class \"empty_workspace glyph\" :text \"\"))"
		fi
	done

	echo "$STRING_LIT)" | awk '{print}'
}

work_space_function
bspc subscribe desktop node_transfer | while read -r _; do
	work_space_function
done

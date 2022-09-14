#!/usr/bin/env zsh

wrap() {
    local onclick="\"onclick\":\"$1\""
    local label="\"text\":\"$2\""
    local class="\"class\":\"$3\""
    echo "{$onclick,$label,$class}"
}

pack() {
    workspaces=(1 2 3 4 5 6 7)
    buffer="["
    for val in "${workspaces[@]}"; do
        if bspc query -D -d focused --names | grep -q "$val"; then
            buffer+="$(wrap "bspc desktop -f $val" "" "focused_workspace"),"
        elif bspc query -D -d .occupied --names | grep -q "$val"; then
            buffer+="$(wrap "bspc desktop -f $val" "" "occupied_workspace glyph"),"
        else
            buffer+="$(wrap "bspc desktop -f $val" "" "empty_workspace glyph"),"
        fi
    done

    buffer="${buffer::-1}]" # strip the trailing comma and terminate
    echo "$buffer" | awk '{print}'
}

pack
bspc subscribe desktop node_transfer | while read -r _; do
    pack
done


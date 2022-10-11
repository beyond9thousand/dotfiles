#!/usr/bin/env zsh

source $XDG_CONFIG_HOME/eww/init.zsh

# Find and store total number of workspaces in an array
_workspaces=($(bspc query -D --names))

# Create a structure function to store values in json format
wrap() {
    local onclick="\"onclick\":\"$1\""
    local text="\"text\":\"$2\""
    local class="\"class\":\"$3\""
    echo "{$onclick,$text,$class}"
}

_query() {
    bspc query -D -d $1 --names | grep -q "$index"
}

# Pack current values into the structure with json format
_pack() {
    buffer="["
    seq ${#_workspaces} | while read -r index; do
        if _query ".focused"; then
            buffer+="$(wrap "bspc desktop -f $index" "" "focused_workspace"),"
        elif _query ".occupied"; then
            buffer+="$(wrap "bspc desktop -f $index" "" "occupied_workspace phosphor"),"
        else
            buffer+="$(wrap "bspc desktop -f $index" "" "empty_workspace phosphor"),"
        fi
    done

    buffer="${buffer::-1}]" # strip the trailing comma and terminate
    echo "$buffer" | awk '{print}'
}

# Run once on startup and then follow changes
_pack
bspc subscribe desktop node_transfer | while read -r _; do
    _pack
    _quit &
done

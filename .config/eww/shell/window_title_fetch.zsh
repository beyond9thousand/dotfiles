#!/usr/bin/env zsh

lower_eww(){
    local widgets=($(eww windows | grep -i '*' | tr -d '*'))
    seq ${#widgets} | while read -r index; do
        xdo lower -N eww-"${widgets[$index]}"
    done
}

raise_eww(){
    local widgets=($(eww windows | grep -i '*' | tr -d '*'))
    seq ${#widgets} | while read -r index; do
        xdo raise -N eww-"${widgets[$index]}"
    done
}

current_state() {
    bspc subscribe node_state | while read -r _ _ _ _ screen state; do
        if [[ $screen == "pseudo_tiled" && $state == "on" ]]; then
            eww update layout_var="䀹"
            eww update layout_hover=true
        elif [[ $screen == "floating" && $state == "on" ]]; then
            eww update layout_var="כּ"
            eww update layout_hover=true
        elif [[ $screen == "fullscreen" && $state == "on" ]]; then
            xdo lower -N Plank
            lower_eww
        elif [[ $screen == "fullscreen" && $state == "off" ]]; then
            xdo raise -N Plank
            raise_eww
        else
            eww update layout_hover=false
        fi
    done
}

current_flag() {
    bspc subscribe node_flag | while read -r _ _ _ _ nature state; do
        if [[ $nature == "sticky" && $state == "on" ]]; then
            eww update sticky_var="ﵯ"
            eww update sticky_hover=true
        elif [[ $nature == "sticky" && $state == "off" ]]; then
            eww update sticky_hover=false
        fi
    done
}

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
        xdo raise -N Plank
        raise_eww
    else
        xdo lower -N Plank
        lower_eww
    fi
}

focus_switch() {
    bspc subscribe node_focus | while read -r _; do
        query_instance 2>/dev/null
        query_state 2>/dev/null
        query_screen
    done
}

current_state &
current_flag &
focus_switch &

xtitle -s | stdbuf -oL -eL uniq | cat

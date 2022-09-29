#!/usr/bin/env zsh

alias _update='eww update'

eww_act(){
    local widgets=($(eww windows | grep -i '*' | tr -d '*'))
    seq ${#widgets} | while read -r index; do
        xdo $1 -N eww-"${widgets[$index]}"
    done
}

current_state() {
    bspc subscribe node_state | while read -r _ _ _ _ screen state; do
        if [[ $screen == "pseudo_tiled" && $state == "on" ]]; then
            _update layout_var="䀹"
            _update layout_hover=true
        elif [[ $screen == "floating" && $state == "on" ]]; then
            _update layout_var="כּ"
            _update layout_hover=true
        else
            _update layout_hover=false
        fi
        if [[ $screen == "fullscreen" && $state == "on" ]]; then
            xdo lower -N Plank
            eww_act "lower"
        elif [[ $screen == "fullscreen" && $state == "off" ]]; then
            xdo raise -N Plank
            eww_act "raise"
        fi
    done
}

current_flag() {
    bspc subscribe node_flag | while read -r _ _ _ _ nature state; do
        if [[ $nature == "sticky" && $state == "on" ]]; then
            _update sticky_var="ﵯ"
            _update sticky_hover=true
        elif [[ $nature == "sticky" && $state == "off" ]]; then
            _update sticky_hover=false
        fi
    done
}

query_instance() {
    if [[ $(bspc query -N -n focused.sticky) ]]; then
        _update sticky_var="ﵯ"
        _update sticky_hover=true
    else
        _update sticky_hover=false
    fi
}

query_state() {
    if [[ $(bspc query -N -n focused.floating) ]]; then
        _update layout_var="כּ"
        _update layout_hover=true
    elif [[ $(bspc query -N -n focused.pseudo_tiled) ]]; then
        _update layout_var="䀹"
        _update layout_hover=true
    else
        _update layout_hover=false
    fi
}

query_screen() {
    if [[ ! $(bspc query -N -n focused.fullscreen) ]]; then
        xdo raise -N Plank
        eww_act "raise"
    else
        xdo lower -N Plank
        eww_act "lower"
    fi
}

focus_switch() {
    bspc subscribe node_focus | while read -r _; do
        query_instance
        query_state 
        query_screen
    done
}

current_state &
current_flag &
focus_switch &

unalias _update

xtitle -s | stdbuf -oL -eL uniq | cat

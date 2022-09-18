#!/usr/bin/env zsh

switch (){
    if [[ $(dunstctl is-paused | grep true) ]]; then
        dunstctl set-paused false &>/dev/null
        eww update notif_initial=""
        dunstify --replace 659 -i bell "Notifications" "DND mode deactivated"
    else
        dunstify -C 659
        dunstctl set-paused true &>/dev/null
        eww update notif_initial=""
    fi
}

check (){
    if [[ $(dunstctl is-paused | grep true) ]]; then
        echo "" | awk '{print}'
    else
        echo "" | awk '{print}'
    fi
}

case "$1" in
    -s|--switch)
        switch
        ;;
    -c|--check)
        check
        ;;
esac

#!/usr/bin/env zsh

source $XDG_CONFIG_HOME/eww/init.zsh

calendar_close(){
    if [[ $(eww windows | grep "*$var") ]]; then
        eww update calendar_check=false
        xdo hide -N eww-calendar_win
        sleep 0.2
        eww close calendar_win
    fi
}

calendar_day(){
    echo $(date "+%A")
}

calendar_date(){
    echo $(date "+%d %B,%Y")
}

case "$1" in
    -t | --toggle)
        _pop "calendar_win"
        ;;
    -close)
        _quit "calendar_win"
        ;;
    -day)
        calendar_day
        ;;
    -date)
        calendar_date
        ;;
esac

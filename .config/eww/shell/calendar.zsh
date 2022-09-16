#!/usr/bin/env zsh

calendar_toggle() {
    if [[ $(eww windows | grep "*calendar_win") ]]; then
        eww update calendar_check=false
        xdo hide -N eww-calendar_win
        sleep 0.2
        eww close calendar_win
    else
        eww open calendar_win
        eww update calendar_check=true
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
        calendar_toggle
        ;;
    -day)
        calendar_day
        ;;
    -date)
        calendar_date
        ;;
esac

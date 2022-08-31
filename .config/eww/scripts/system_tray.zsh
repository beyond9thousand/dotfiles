#!/bin/bash

hidden=/tmp/syshide.lock

case "$1" in
    -t | --toggle)
        tray_toggle() {
            if [[ $(pidof stalonetray) ]]; then
                if [[ ! -e $hidden ]]; then
                    eww update tray_initial=""
                    xdo hide -N stalonetray
                    touch "$hidden"
                else
                    eww update tray_initial=""
                    xdo show -N stalonetray
                    xdo raise -N stalonetray
                    rm "$hidden"
                fi
            else
                stalonetray &
            fi
        }
        tray_toggle
        ;;
    -c|--check)
        tray_state(){
            if [[ -e $hidden ]]; then
                eww update tray_initial=""
            else
                eww update tray_initial=""
            fi
        }
        tray_state
        ;;
esac

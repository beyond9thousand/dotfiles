#!/usr/bin/env zsh

mic_source=$(pactl info | grep "Default Source" | awk '{print$3}')

case "$1" in
    -v | --volume)
        function volume() {
            pamixer --get-volume
            pactl subscribe |
            grep --line-buffered "Event 'change' on sink " |
            while read -r _; do
                pamixer --get-volume | cut -d " " -f1
            done
        }
        volume | stdbuf -oL -eL uniq | cat
        ;;
    -s | --state)
        function state() {
            pamixer --get-mute
            pactl subscribe |
            grep --line-buffered "Event 'change' on sink " |
            while read -r _; do
                pamixer --get-mute
            done
        }
        state | stdbuf -oL -eL uniq | cat
        ;;
    -mc|--mic_check)
        function mic_state(){
            if [[ $(amixer get Capture | grep -i "\[on]") ]]; then
                echo "" | awk '{print}'
            else
                echo "" | awk '{print}'
            fi
        }
        mic_state
        ;;
    -mt|--mic_toggle)
        function mic_toggle() {
            if [[ $(amixer get Capture | grep -i "\[on]") ]]; then
                eww update mic_initial=""
                pactl set-source-mute @DEFAULT_SOURCE@ true
            else
                eww update mic_initial=""
                pactl set-source-mute @DEFAULT_SOURCE@ false
            fi
        }
        mic_toggle
        ;;
    -mic_up)
        pamixer --source $mic_source -i 5
        ;;
    -mic_down)
        pamixer --source $mic_source -d 5
        ;;
    -mic_vol)
        function mic_volume (){
            pamixer --source $mic_source --get-volume
            pactl subscribe |
            grep --line-buffered "Event 'change' on source " |
            while read -r _; do
                pamixer --source $mic_source --get-volume
            done
        }
        mic_volume | stdbuf -oL -eL uniq | cat
        ;;
esac

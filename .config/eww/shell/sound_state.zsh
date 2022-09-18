#!/usr/bin/env zsh

mic_source=$(pactl info | grep "Default Source" | awk '{print$3}')

vol_master(){
    pamixer ${1}
    pactl subscribe |
    grep --line-buffered "Event 'change' on ${2} " |
    while read -r _; do
        pamixer ${1} | cut -d " " -f1
    done
}

mic_state(){
    if [[ $(amixer get Capture | grep -i "\[on]") ]]; then
        echo "false" | awk '{print}'
    else
        echo "true" | awk '{print}'
    fi
}

mic_toggle() {
    if [[ $(amixer get Capture | grep -i "\[on]") ]]; then
        eww update mic_initial="true"
        pactl set-source-mute @DEFAULT_SOURCE@ true
    else
        eww update mic_initial="false"
        pactl set-source-mute @DEFAULT_SOURCE@ false
    fi
}

mic_volume (){
    pamixer --source $mic_source --get-volume
    pactl subscribe |
    grep --line-buffered "Event 'change' on source " |
    while read -r _; do
        pamixer --source $mic_source --get-volume
    done
}

case "$1" in
    -v | --volume)
        vol_master "--get-volume" "sink" | \
            stdbuf -oL -eL uniq | cat
        ;;
    -s | --state)
        vol_master "--get-mute" "sink" | \
            stdbuf -oL -eL uniq | cat
        ;;
    -mc|--mic_check)
        mic_state
        ;;
    -mt|--mic_toggle)
        mic_toggle
        ;;
    -mic_up)
        pamixer --source $mic_source -i 5
        ;;
    -mic_down)
        pamixer --source $mic_source -d 5
        ;;
    -mic_vol)
        mic_volume | stdbuf -oL -eL uniq | cat
        ;;
esac

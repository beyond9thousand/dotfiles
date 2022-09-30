#!/usr/bin/env zsh

alias _update="eww update"
alias _close="eww close"
alias _open="eww open"

_quit(){
    local widgets=($(eww windows | grep -i '*' | tr -d '*'))
    seq ${#widgets} | while read -r index; do
        _window=${widgets[$index]}
        if [[ $_window != "taskbar" ]]; then
            _update "${_window}_check"=false
            xdo hide -N eww-$_window
            sleep 0.2
            _close $_window
        fi
    done
}

_pop(){
    if [[ $(eww windows | grep "*$1") ]]; then
        _update "${1}_check"=false
        xdo hide -N eww-$1
        sleep 0.2
        _close $1
    else
        _open $1
        _update "${1}_check"=true
    fi
}

unalias _update; unalias _close; unalias _open

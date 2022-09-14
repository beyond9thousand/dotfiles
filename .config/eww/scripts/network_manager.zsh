#!/usr/bin/env zsh

config_connection (){
    if [[ $(nmcli | grep -i "connected to" | awk '{print$NF}') ]]; then
        net_config=($(nmcli device | grep -w connected | awk '{print$1" "$NF}'))
        seq ${#net_config} | while read -r index; do
            device=$(print "${net_config[1]}")
            ssid=$(print "${net_config[2]}")
        done

        echo "true"
        eww update ssid=$ssid
    else
        echo "false"
    fi
}

monitor_net (){
    nmcli monitor | while read -r line; do
        if [[ $line == "Connectivity is now 'full'" ]]; then
            echo "true"
            config_connection
            eww update ssid=$ssid
        elif [[ $line == "Connectivity is now 'none'" ]]; then
            echo "false"
        fi
    done
}

config_connection
monitor_net

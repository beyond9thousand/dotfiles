#!/usr/bin/env zsh

alias _update='eww update'

DEVICE=$(eww get net_device)
device_path="/sys/class/net/$DEVICE/statistics/"

current_speed (){
    rx1=$(cat ${device_path}rx_bytes)
    tx1=$(cat ${device_path}tx_bytes)
    sleep 1
    rx2=$(cat ${device_path}rx_bytes)
    tx2=$(cat ${device_path}tx_bytes)

    d_speed=$(((rx2 - rx1) / 1024))
    u_speed=$(((tx2 - tx1) / 1024))

    d_unit="KB/s"
    u_unit="KB/s"

    if [[ $d_speed -gt 1024 ]]; then
        d_speed=$(((d_speed) / 1024))
        d_unit="MB/s"
    fi
    if [[ $u_speed -gt 1024 ]]; then
        u_speed=$(((u_speed) / 1024))
        u_unit="MB/s"
    fi

    _update u_speed="$u_speed$u_unit"
    _update d_speed="$d_speed$d_unit"
}

config_connection (){
    if [[ $(nmcli | grep -i "connected to" | awk '{print$NF}') ]]; then
        net_config=($(nmcli device | grep -w connected | awk '{print$1" "$NF}'))
        seq ${#net_config} | while read -r index; do
            DEVICE=$(print "${net_config[1]}")
            SSID=$(print "${net_config[2]}")
        done

        echo "true"
        _update ssid=$SSID; _update net_device=$DEVICE
    else
        echo "false"
    fi
}

monitor_net (){
    nmcli monitor | while read -r line; do
        if [[ $line == "Connectivity is now 'full'" ]]; then
            echo "true"
            config_connection
            _update ssid=$SSID
        elif [[ $line == "Connectivity is now 'none'" ]]; then
            echo "false"
        fi
    done
}

case "$@" in
    --monitor|-m)
        config_connection
        monitor_net
        ;;
    --speed|-ns)
        current_speed
        ;;
esac

unalias _update

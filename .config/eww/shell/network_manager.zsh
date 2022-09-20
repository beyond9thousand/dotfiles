#!/usr/bin/env zsh

device=$(eww get net_device)
device_path="/sys/class/net/$device/statistics/"

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

    eww update u_speed="$u_speed$u_unit"
    eww update d_speed="$d_speed$d_unit"
}

config_connection (){
    if [[ $(nmcli | grep -i "connected to" | awk '{print$NF}') ]]; then
        net_config=($(nmcli device | grep -w connected | awk '{print$1" "$NF}'))
        seq ${#net_config} | while read -r index; do
            device=$(print "${net_config[1]}")
            ssid=$(print "${net_config[2]}")
        done

        echo "true"
        eww update ssid=$ssid; eww update net_device=$device
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

case "$@" in
    --monitor|-m)
        config_connection
        monitor_net
        ;;
    --speed|-ns)
        current_speed
        ;;
esac

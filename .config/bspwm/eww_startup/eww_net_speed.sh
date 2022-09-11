#!/bin/bash

while true; do
  sleep 0.2
	if [[ $(eww get net_hover) == "false" ]]; then
		rx1=$(cat /sys/class/net/wlo1/statistics/rx_bytes)
		tx1=$(cat /sys/class/net/wlo1/statistics/tx_bytes)
		sleep 1
		rx2=$(cat /sys/class/net/wlo1/statistics/rx_bytes)
		tx2=$(cat /sys/class/net/wlo1/statistics/tx_bytes)

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
	fi
done

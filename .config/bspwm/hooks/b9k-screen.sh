#!/bin/bash

#Script starts running
notify-send "Screensaver" "Script is running now"

while true; do
    sleep 15
    ss=Paused #Initial state provided is 'Paused'
    smeta=Null
    ss=$(playerctl status) #Playerctl status is fed
    smeta=$(playerctl metadata album) #Playerctl metadata album info is fed
      if [[ $ss = Playing && $smeta = "" ]]; then
        xdg-screensaver reset
      fi
done

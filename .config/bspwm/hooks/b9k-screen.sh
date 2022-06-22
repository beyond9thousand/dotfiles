#!/bin/bash

#Script starts running
# dunstify -i text-x-script "Screensaver activated"

while true; do
    sleep 15
    ss=Paused #Initial state provided is 'Paused'
    smeta=Null
    vc=Null
    ss=$(playerctl status) #Playerctl status is fed
    smeta=$(playerctl metadata album) #Playerctl metadata album info is fed
    vc=$(fuser /dev/video0)
      if [[ $ss = Playing && $smeta = "" ]]; then
        xdg-screensaver reset
      elif [[ $vc != "" ]]; then
        xdg-screensaver reset
      fi
done

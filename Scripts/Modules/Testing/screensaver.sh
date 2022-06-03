#!/bin/bash

#Script starts running
echo "Script is running now"

while true; do
    sleep 1
    ss=Paused #Initial state provided is 'Paused'
    smeta=Null
    ss=$(playerctl status) #Playerctl status is fed
    smeta=$(playerctl metadata album) #Playerctl metadata album info is fed
    echo $smeta
      if [[ $ss = Playing && $smeta = "" ]]; then
       echo "Video is playing"
       #echo "Screensaver has been reset"
      else
      echo "Video is not playing"
      fi
done

#!/bin/sh

pactl load-module module-null-sink sink_name=V1 sink_properties=device.description=mic+app
pactl load-module module-null-sink sink_name=V2 sink_properties=device.description=app
pactl load-module module-loopback source=@DEFAULT_SOURCE@ sink=V1
pactl load-module module-loopback source=V2.monitor sink=V1
pactl load-module module-loopback source=V2.monitor sink=@DEFAULT_SINK@

#!/bin/bash

#                __         
#    _______  __/ /__  _____
#   / ___/ / / / / _ \/ ___/
#  / /  / /_/ / /  __(__  ) 
# /_/   \__,_/_/\___/____/  
#                           

#
# Workspace specific conditions
#

# workspace 1 (Chat)
declare -a terminal=(discord Brave-browser)
for i in "${terminal[@]}"; do
	bspc rule -a "$i" desktop='^1' follow=on focus=on
done

# workspace 2 (Internet Browser)
declare -a web=(firefox)
for i in "${web[@]}"; do
	bspc rule -a "$i" desktop='^2' follow=on focus=on
done

# workspace 3 (File Managers)
declare -a filem=(Pcmanfm qBittorrent)
for i in "${filem[@]}"; do
	bspc rule -a "$i" desktop='^3' follow=on focus=on
done

# workspace 4 (Text Editor)
declare -a work=(Blender "*:soffice")
for i in "${work[@]}"; do
	bspc rule -a "$i" desktop='^4' follow=on focus=on
done

# workspace 5 (Media)
declare -a media=(vlc obs instagram-live-streamer mplayer
	lxmusic Gimp Gimp-2.10 "VirtualBox Manager")
for i in "${media[@]}"; do
	bspc rule -a "$i" desktop='^5' follow=on focus=on
done

# workspace 7 (Settings)
declare -a settings=(Lxappearance Lxtask Lxrandr Arandr
	Xfce4-settings-manager Xfce4-power-manager-settings
	octopi)
for i in "${settings[@]}"; do
	bspc rule -a "$i" desktop='^7' follow=on focus=on
done

#                         ___ __  _                   __
#   _________  ____  ____/ (_) /_(_)___  ____  ____ _/ /
#  / ___/ __ \/ __ \/ __  / / __/ / __ \/ __ \/ __ `/ / 
# / /__/ /_/ / / / / /_/ / / /_/ / /_/ / / / / /_/ / /  
# \___/\____/_/ /_/\__,_/_/\__/_/\____/_/ /_/\__,_/_/   
# Conditional                                                     

# Force floating mode
declare -a floats=(Alafloat Lxappearance Arandr
	Viewnior Nm-connection-editor Matplotlib
	Yad Gnome-disks SimpleScreenRecorder PureRef
	Font-manager Gnome-system-monitor Thunar
	Gcolor3 flameshot Blueberry.py Pavucontrol
	jamesdsp Nvidia-settings Nitrogen Peazip
	Xfce4-appearance-settings Xfce4-mouse-settings
	parsecd Galculator com.github.joseexposito.touche
	XVkbd usbguard-applet-qt instagram-live-streamer
	Mumble qimgv Peek)
for i in "${floats[@]}"; do
	bspc rule -a "$i" manage=on state=floating follow=on focus=on center=true
done

# Force tile windows
declare -a tiled=(Zathura)
for i in "${tiled[@]}"; do
	bspc rule -a "$i" manage=on state=tiled
done

# Force full screen windows
declare -a fullscreen=(mpv)
for i in "${fullscreen[@]}"; do
	bspc rule -a "$i" manage=on state=fullscreen
done

#                   __           _          
#   ___  _  _______/ /_  _______(_)   _____ 
#  / _ \| |/_/ ___/ / / / / ___/ / | / / _ \
# /  __/>  </ /__/ / /_/ (__  ) /| |/ /  __/
# \___/_/|_|\___/_/\__,_/____/_/ |___/\___/ 
# Exclusive                                      

# Keep plank above all windows
bspc rule -a Plank manage=off locked=on border=off state=floating focus=off

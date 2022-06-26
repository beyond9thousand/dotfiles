# workspace 1 (Terminals)
declare -a terminal=(discord)
for i in ${terminal[@]}; do
    bspc rule -a $i desktop='^1' follow=on focus=on; done

# workspace 2 (Internet Browser)
declare -a web=(firefox)
for i in "${web[@]}"; do
    bspc rule -a $i desktop='^2' follow=on focus=on; done

# workspace 3 (Files)
declare -a filem=(Pcmanfm qBittorrent)
for i in "${filem[@]}"; do
    bspc rule -a $i desktop='^3' follow=on focus=on; done

# workspace 4 (Text Editor)
declare -a office=(Code Geany Blender)
for i in "${office[@]}"; do
    bspc rule -a $i desktop='^4' follow=on focus=on; done

# workspace 5 (Media)
declare -a media=(vlc obs mplayer \
lxmusic Gimp Gimp-2.10 "VirtualBox Manager")
for i in "${media[@]}"; do
    bspc rule -a $i desktop='^5' follow=on focus=on; done

# workspace 7 (Settings)
declare -a settings=(Lxappearance Lxtask Lxrandr Arandr \
Xfce4-settings-manager Xfce4-power-manager-settings \
octopi)
for i in "${settings[@]}"; do
    bspc rule -a $i desktop='^7' follow=on focus=on; done

# floating windows
declare -a floats=(Alafloat Lxappearance Arandr \
Viewnior feh Nm-connection-editor Matplotlib \
Yad Gnome-disks SimpleScreenRecorder \
Font-manager Gnome-system-monitor OpenTabletDriver.UX.Gtk \
Thunar PureRef Gcolor3 flameshot Xarchiver Blueberry.py \
Pavucontrol)
for i in "${floats[@]}"; do
  bspc rule -a $i manage=on state=floating follow=on focus=on centre=true; done

# Keep plank above all windows 
bspc rule -a Plank manage=on locked=on border=off state=floating focus=off
bspc rule -a Plank manage=off locked=on border=off state=floating focus=off

# Force tile windows
declare -a tiled=(Zathura)
for i in "${tiled[@]}"; do
    bspc rule -a $i manage=on state=tiled; done

# Force full screen windows
declare -a fullscreen=(mpv)
for i in "${fullscreen[@]}"; do
    bspc rule -a $i manage=on state=fullscreen; done


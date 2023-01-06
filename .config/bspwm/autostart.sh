#!/bin/bash

#                __             __             __
#   ____ ___  __/ /_____  _____/ /_____ ______/ /_
#  / __ `/ / / / __/ __ \/ ___/ __/ __ `/ ___/ __/
# / /_/ / /_/ / /_/ /_/ (__  ) /_/ /_/ / /  / /_
# \__,_/\__,_/\__/\____/____/\__/\__,_/_/   \__/
#

# Restart default apps
declare -a restart=(xfce4-power-manager picom sxhkd xbanish
	copyq playerctld plank flameshot touchegg dunst)
for i in "${restart[@]}"; do
	pgrep -x "$i" | xargs kill
	sleep 0.5
	eval "$i" &
done

# Exclusive apps
if [[ ! $(pidof stalonetray) ]]; then
	stalonetray &
	sleep 0.5
	xdo hide -N stalonetray
	touch "/tmp/syshide.lock"
fi

# Unlock keepass database
if [[ $(pgrep --exact keepassxc) ]]; then
	sleep 0.5

	_unlock_db() {
		tmp_passwd=$(secret-tool lookup keepass Passwords)
		database="$HOME/Documents/Sync/Backup_Database/application settings files/Password/Passwords.kdbx"
		dbus-send --print-reply --dest=org.keepassxc.KeePassXC.MainWindow /keepassxc org.keepassxc.KeePassXC.MainWindow.openDatabase string:"$database" string:"$tmp_passwd" >/dev/null 2>&1
	}

	_unlock_db &
fi

pgrep -x "eww" | xargs kill
control_box -ewwopen

dunstify -i window_list "BSPWM" "Completed autostarting all apps"

#!/bin/bash

dbus-send --print-reply --dest=org.keepassxc.KeePassXC.MainWindow /keepassxc org.keepassxc.KeePassXC.MainWindow.lockAllDatabases
sleep 3
pgrep --exact keepassxc | xargs kill

if [[ ! $(keepassxc) ]]; then
	nohup keepassxc &
	disown
fi

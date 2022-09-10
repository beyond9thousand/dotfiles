#!/bin/bash

#                       _____ __   
#     ____  _________  / __(_) /__ 
#    / __ \/ ___/ __ \/ /_/ / / _ \
#   / /_/ / /  / /_/ / __/ / /  __/
#  / .___/_/   \____/_/ /_/_/\___/ 
# /_/                              
#

# Establish error file location
export ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"

# Override QT apps theme
export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_FONT_DPI=116 Roboto

export XCURSOR_SIZE=32

# Disable telemetry for dotnet apps
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

# XDG Directory declarations
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# zsh directories
export ZDOTDIR="$HOME"/.config/zsh

# bash directories
export HISTFILE="${XDG_STATE_HOME}"/bash/history

# miscellaneous
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GOPATH="$XDG_DATA_HOME"/go
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export MYPY_CACHE_DIR="$XDG_CACHE_HOME"/mypy
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# Set default mime types
export TERMINAL="alacritty"
export BROWSER="firefox"

# Very niche variables go below this
export torrents_b9k="/tmp/torrent-stream"
export recordings_b9k="/tmp/Recordings"
export screenshots_b9k="/tmp/Screenshots"

# Create temp directories
mkdir $torrents_b9k
mkdir $recordings_b9k
mkdir $screenshots_b9k

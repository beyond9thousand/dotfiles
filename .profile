#!/bin/bash

# Disable steelseries keyboard LED
# msi-perkeyrgb -d

# Override QT apps theme
export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_FONT_DPI=116 Roboto

export XCURSOR_SIZE=32

# Disable telemetry for dotnet apps
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# replace neovim colorscheme
sed -i "s/theme =.*$/theme = \"tokyonight\",/g" "$HOME"/.config/nvim/lua/custom/chadrc.lua

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.bin" ]; then
  PATH="$HOME/.bin:$PATH"
fi

mkdir /tmp/torrent-stream
mkdir /tmp/Recordings
mkdir /tmp/Screenshots

# Directory declarations
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# zsh directories
export ZDOTDIR="$HOME"/.config/zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export ZPLUG_HOME="$XDG_DATA_HOME/zplug"

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

# Set default terminal
export TERMINAL="alacritty"

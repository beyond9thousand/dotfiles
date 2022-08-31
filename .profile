#!/bin/bash

#                       _____ __   
#     ____  _________  / __(_) /__ 
#    / __ \/ ___/ __ \/ /_/ / / _ \
#   / /_/ / /  / /_/ / __/ / /  __/
#  / .___/_/   \____/_/ /_/_/\___/ 
# /_/                              
#

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
export HISTFILE="$XDG_STATE_HOME"/zsh/history

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

# Temporary additions
export PATH=$PATH:~/.spoof-dpi/bin

# Set default mime types
export TERMINAL="alacritty"
export BROWSER="firefox"

# Very niche variables go below this
export b9ktorrents="/tmp/torrent-stream"
export b9krecordings="/tmp/Recordings"
export b9kscreenshots="/tmp/Screenshots"

# Create temp directories
mkdir $b9ktorrents
mkdir $b9krecordings
mkdir $b9kscreenshots

#                    _                                       __
#   ___  ____ _   __(_)________  ____  ____ ___  ___  ____  / /_
#  / _ \/ __ \ | / / / ___/ __ \/ __ \/ __ `__ \/ _ \/ __ \/ __/
# /  __/ / / / |/ / / /  / /_/ / / / / / / / / /  __/ / / / /_
# \___/_/ /_/|___/_/_/   \____/_/ /_/_/ /_/ /_/\___/_/ /_/\__/
#

# Default editor declarations
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Terminal autonotify config
export AUTO_NOTIFY_THRESHOLD=60
export AUTO_NOTIFY_EXPIRE_TIME=10000

export MANPATH="/usr/local/man:$MANPATH"

# FZF colorscheme
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=fg:#d0d0d0,bg:#1a1b26,hl:#5f87af
--color=fg+:#7aa2f7,bg+:#1a1b26,hl+:#7bc5e4
--color=info:#afaf87,prompt:#d7005f,pointer:#7aa2f7
--color=marker:#caaa6a,spinner:#af5fff,header:#659b82'

#                    _                                       __
#   ___  ____ _   __(_)________  ____  ____ ___  ___  ____  / /_
#  / _ \/ __ \ | / / / ___/ __ \/ __ \/ __ `__ \/ _ \/ __ \/ __/
# /  __/ / / / |/ / / /  / /_/ / / / / / / / / /  __/ / / / /_
# \___/_/ /_/|___/_/_/   \____/_/ /_/_/ /_/ /_/\___/_/ /_/\__/
#

export HISTFILE="$XDG_STATE_HOME"/zsh/history

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

if [ -d "$HOME/.local/share/yarn/global/node_modules/retypeapp/platforms/linux-x64" ]; then
  export PATH="$PATH:$HOME/.local/share/yarn/global/node_modules/retypeapp/platforms/linux-x64"
fi

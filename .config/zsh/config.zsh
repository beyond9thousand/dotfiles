#                     _____      
#   _________  ____  / __(_)___ _
#  / ___/ __ \/ __ \/ /_/ / __ `/
# / /__/ /_/ / / / / __/ / /_/ / 
# \___/\____/_/ /_/_/ /_/\__, /  
#                       /____/   
#

fpath=(~/.zsh $fpath)

# History defaults
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=500
SAVEHIST=500
HIST_STAMPS="dd/mm/yyyy"

# Sourcing broot file manager
source /home/beyond9thousand/.config/broot/launcher/bash/br

# Loading aliases
[[ -f ~/.config/zsh/zshrc-personal ]] && . ~/.config/zsh/zshrc-personal

# User configuration
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{white}+%f"
INSERT_MODE_INDICATOR="%F{yellow}+%f"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# fzf-tab configuration
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

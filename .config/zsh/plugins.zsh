#            __            _
#     ____  / /_  ______ _(_)___  _____
#    / __ \/ / / / / __ `/ / __ \/ ___/
#   / /_/ / / /_/ / /_/ / / / / (__  )
#  / .___/_/\__,_/\__, /_/_/ /_/____/
# /_/            /____/
#

zinit for \
    light-mode \
    romkatv/powerlevel10k \
    Aloxaf/fzf-tab \
    hlissner/zsh-autopair \
    zsh-users/zsh-completions \
    zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting \
    MichaelAquilina/zsh-you-should-use \
    MichaelAquilina/zsh-auto-notify \
    OMZP::git \
    OMZP::vi-mode

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
_comp_options+=(globdots) # lets you tab complete hidden files by default

zinit cdreplay -q

#
# ~/.bashrc
#

export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto -rthla'
PS1='[\u@\h \W]\$ '

source /home/beyond9thousand/.config/broot/launcher/bash/br

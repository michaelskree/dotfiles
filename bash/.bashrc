# This file is sourced by interactive non-login shells

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set prompt
PS1='\[\e[1;32m\]\u@\H\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

# Configure bash history
shopt -s histappend
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'

# Set editor
export EDITOR=vim

# Set pager
export PAGER='less -S'

# Set LS_COLORS
hash dircolors 2> /dev/null && eval "$(dircolors)"

# Enable bash completion
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# Source aliases
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Source local config
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

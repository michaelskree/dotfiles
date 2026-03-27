# This file is sourced by interactive non-login shells

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function set_prompt() {
    [[ -r ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

    local blue="\[$(tput setaf 4)\]"
    local cyan="\[$(tput setaf 6)\]"
    local green="\[$(tput setaf 2)\]"
    local reset="\[$(tput sgr0)\]"

    PS1="${green}\u${reset}@${cyan}\H${reset}:${blue}\w${reset}"

    if declare -f __git_ps1 > /dev/null 2>&1; then
        GIT_PS1_SHOWCOLORHINTS=1
        GIT_PS1_SHOWDIRTYSTATE=1
        GIT_PS1_SHOWUNTRACKEDFILES=1
        GIT_PS1_SHOWUPSTREAM=verbose
        PS1+='$(__git_ps1)'
    fi

    PS1+="\n\$ "
}

set_prompt
unset set_prompt

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

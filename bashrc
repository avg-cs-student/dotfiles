#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "

# use vi navigation rather than emacs
set -o vi
EDITOR=nvim
VISUAL=nvim

export XDG_CONFIG_HOME=~/.config

if [ -L ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Colorized man pages and help messages
if command -v batcat &> /dev/null; then 
	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif command -v bat &> /dev/null; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# History
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTIGNORE="clear:bg:fg:cd:cd ..:exit:pwd:* --help:ls:l:ll:lll:* --version"
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

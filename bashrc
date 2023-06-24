#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

ATTRIBUTE_BOLD='\[\e[1m\]'
ATTRIBUTE_RESET='\[\e[0m\]'
COLOR_DEFAULT='\[\e[39m\]'
COLOR_RED='\[\e[31m\]'
COLOR_GREEN='\[\e[32m\]'
COLOR_YELLOW='\[\e[33m\]'
COLOR_BLUE='\[\e[34m\]'
COLOR_MAGENTA='\[\e[35m\]'
COLOR_CYAN='\[\e[36m\]'
COLOR_GRAY='\e[38;5;246m'

# use vi navigation rather than emacs
set -o vi
EDITOR=nvim
VISUAL=nvim

# add git to prompt
parse_git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT_DIRTRIM=3
PROMPT_COMMAND=__prompt_command

__prompt_command () {
	local EXIT="$?"
	PS1=""
	PS1+="\n${COLOR_BLUE}\$ ${COLOR_GREEN}\u ${COLOR_BLUE}at"
	PS1+="${COLOR_DEFAULT} \$(hostname) ${COLOR_BLUE}in ${COLOR_YELLOW}\w"
	PS1+="      "
	PS1+="${COLOR_RED}\$(parse_git_branch)\n"

	if [ $EXIT -ne 0 ]; then 
		PS1+="${COLOR_RED}! ${COLOR_DEFAULT}"
	else
		PS1+="${COLOR_BLUE}> ${COLOR_DEFAULT}"	
	fi
}

PS2="${COLOR_BLUE}>${COLOR_DEFAULT} "


if [ -L ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# Colorized man pages and help messages
if command -v batcat &> /dev/null; then 
	export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif command -v bat &> /dev/null; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

# MSP430 compiler and debugger at home
if [[ "$(hostname)" == "sys76" ]]; then
	PATH="$HOME/Development/PERSIST/toolchain/ti/msp430-gcc/bin:$PATH";
	PATH="$HOME/Development/PERSIST/toolchain/mspdebug:$PATH";
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias luamake=/home/justincromer/tools/lua-language-server/3rd/luamake/luamake

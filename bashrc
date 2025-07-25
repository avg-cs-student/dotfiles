#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

add_to_path() {
	if ! echo "$PATH" | grep -q ":$1:"; then
		export PATH="$PATH:$1"
	fi
}


source ~/.config/git/prompt.sh

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# use vi navigation rather than emacs
set -o vi
EDITOR=nvim
VISUAL=nvim

export XDG_CONFIG_HOME=~/.config

# Some distros do not include this directory by default.
add_to_path ~/.local/bin

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
. "$HOME/.cargo/env"


# Pyenv so we can compile stupid shit that needs python2
#
# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# Restart your shell for the changes to take effect.

# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"

[ -f "/home/justincromer/.ghcup/env" ] && . "/home/justincromer/.ghcup/env" # ghcup-envsource ~/.bash_completion/alacritty

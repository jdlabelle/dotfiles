#!/bin/bash

# default ls aliases, might update
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -CF'

# sometimes you mistype
alias dc='cd'

# activate a python virtual env
alias ve='source .venv/bin/activate'

# use ripgrep instead of grep if installed
if [[ $(which rg) ]]; then
    alias grep='rg'
fi

alias t='tree'

# git
alias g='git'

# shortcut to notes
alias oo='nvim ~/wiki/index.md'

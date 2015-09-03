#!/bin/zsh

# Role-based customizations
export ROLE=$(grep ${HOST} ${HOME}/.home/roles/* | head -n1 | cut -d: -f1 | rev | cut -d/ -f1 | rev)

# Theme
export ZSH_THEME="ohmytheme"

if [ -f ${HOME}/.home/zsh/${ROLE}.zsh ]; then
    source ${HOME}/.home/zsh/${ROLE}.zsh
fi

plugins=($plugins docker fabric virtualenvwrapper)

# Oh my ZSH
if [ -d ${HOME}/.oh-my-zsh ]; then
    ZSH=${HOME}/.oh-my-zsh
    DISABLE_LS_COLORS="true"

    source ${ZSH}/oh-my-zsh.sh
fi

fpath=(${HOME}/.home/zsh/functions $fpath)

autoload -Uz compinit \
             extendedglob autopushd pushdminus \
             pushdtohome colors \
             up-line-or-beginning-search down-line-or-beginning-search

compinit

autoload -Uz ${HOME}/.home/zsh/functions/*(:t)

# Vi key bindings!!!
bindkey -v

# Up/Down history moves cursor to EOL
zle -N up-line-or-beginning-search up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

zle -N down-line-or-beginning-search down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Buffer stack
bindkey "\eq" push-line-or-edit

# Tab completion stuff
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'

# Turn off the correct all stuff from oh-my-zsh
unsetopt correct_all

# History options
setopt incappendhistory
setopt histignoredups       # Only add once
setopt histignorespace
setopt sharehistory         # Share history between terms!
setopt nobeep
setopt autocd
setopt completealiases

# Set up history
export HISTFILE=$HOME/.zhistory
export HISTSIZE=5000
export SAVEHIST=5000

# Go path
export GOPATH="$HOME/go"

# Add custom path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.bin:$HOME/bin:/sbin:/usr/sbin:$GOPATH"

# Pager
export PAGER=$(command -v less)

# Default editor
if [ ${#$(command -v vim)} != 0 ]; then
    export EDITOR=$(command -v vim)
else
    export EDITOR=$(command -v vi)
fi

# Aliases and shorthands
alias h='history'
alias m='$PAGER' # Less is more
alias num='grep -c ^'
alias pd="pushd"
alias po="popd"
alias grep="egrep"

alias -g homeserver="straylight.home.kg"

if [ -d "/Applications/Sublime Text.app" ]; then
    alias subl="open -a \"Sublime Text\""
fi

function oneline {
    tr "\\n" $1
}

function ff {
    fab -f ${HOME}/.home/fabfile $@
}

function unicodehex {
    echo $1 | hexdump | awk '{print "\\x"toupper(substr($2,3,4)) "\\x"toupper(substr($2,0,2)) "\\x"toupper(substr($3,3,4))}' | head -1
}

function branch_match {
    git branch | grep $1 | cut -f1
}

# VirtualBox functions and helpers
if [ ${#$(command -v VBoxManage)} != 0 ]; then
    source ${HOME}/.home/zsh/include/virtualbox.zsh
fi

# Virtualenvwrapper settings
if [ ${#$(command -v virtualenvwrapper.sh)} != 0 ]; then
    export VIRTUALENV_USE_DISTRIBUTE=1
    export WORKON_HOME=${HOME}/.virtualenvs

    source $(command -v virtualenvwrapper.sh)

    export PIP_VIRTUALENV_BASE=${WORKON_HOME}
    export PIP_RESPECT_VIRTUALENV=true
fi
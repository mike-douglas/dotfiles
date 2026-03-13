#!/bin/zsh

autoload -Uz compinit \
             extendedglob autopushd pushdminus \
             pushdtohome colors \
             up-line-or-beginning-search down-line-or-beginning-search

compinit

# Vi key bindings!!!
bindkey -v

# Up/Down history moves cursor to EOL
zle -N up-line-or-beginning-search up-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search

zle -N down-line-or-beginning-search down-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Buffer stack
bindkey "\eq" push-line-or-edit

# History search with pattern
bindkey '^R' history-incremental-pattern-search-backward

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

# Turn off cowsay in ansible
export ANSIBLE_NOCOWS=1

# Add custom path
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:$HOME/.bin:$HOME/bin:/sbin:/usr/sbin:${HOME}/go/bin:$(python3 -c 'import site; print(site.USER_BASE)')/bin:./node_modules/.bin"

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
alias grep="egrep"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

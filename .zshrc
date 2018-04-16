# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="gentoo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#  COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime npm node brew jsontools zsh-syntax-highlighting)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor line pattern root)

source $ZSH/oh-my-zsh.sh

RPROMPT="<- $(date '+%H:%M %d/%m/%y')"

# Customize to your needs...
ssh-add ~/.ssh/id_rsa
HOMEBREW=/usr/local/bin:/usr/local/sbin
NODE_MODULES=./node_modules/.bin
LOCAL_BIN=$HOME/local/bin
PLATFORM=$(uname)

if [[ "$PLATFORM" == "Darwin" ]]; then
    source `brew --prefix`/etc/profile.d/z.sh
    export PATH=$HOMEBREW:$PATH
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
elif [[ "$PLATFORM" == "Linux" ]]; then
    source ~/Repos/z/z.sh
else
    echo Unknown platform $PLATFORM
fi

export PATH=$NODE_MODULES:$LOCAL_BIN:$PATH

function new-tmux-from-dir-name {
    tmux new-session -As `basename $PWD | sed s/\\\\./_/g`
}

export EDITOR="vim"

alias tl="tmux ls"
alias tn="new-tmux-from-dir-name"
alias ta="tmux attach -d"

bindkey "^Q" push-input

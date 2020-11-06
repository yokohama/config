# Path to your oh-my-zsh installation.
export ZSH=/Users/yokohama/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
ZSH_THEME="candy"
#ZSH_THEME='agnoster'
#ZSH_THEME="awesomepanda"
#ZSH_THEME="dpoggi"
#ZSH_THEME="gallois"
#ZSH_THEME="gianu"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby osx bundler brew rails emoji-clock)

# User configuration



export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
#export PATH="/usr/local/Cellar/openssl/1.0.2n/bin:$PATH"
export PATH="/usr/local/Cellar/openssl@1.1/1.1.1g/bin/:$PATH"
export PATH="/Users/yokohama/go/bin:$PATH"
export PATH="/usr/local/Cellar/mysql@5.7/5.7.29/bin:$PATH"

export PATH=$HOME/.nodebrew/current/bin:$PATH

#export PYENV_ROOT=${HOME}/.pyenv
#if [ -d "${PYENV_ROOT}" ]; then
#    export PATH=${PYENV_ROOT}/bin:$PATH
#    eval "$(pyenv init - zsh)"
#    eval "$(pyenv virtualenv-init - zsh)"
#fi

eval "$(rbenv init - zsh)"

# Android SDK
export ANDROID_HOME=/Users/yokohama/Library/Android/sdk

#jEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

#golang
export GOPATH='/Users/yokohama/go'

# 色を使用出来るようにする
autoload -Uz colors
colors

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# keybind and vimbind
set -o vi
bindkey "jj" vi-cmd-mode

# alias
alias be="bundle exec"
alias bi="bundle install --without production --path vendor/bundle"
alias brr="be rake routes"
alias brs="be rails s"
alias hrs="heroku run rails s"
alias hrdm="heroku run rake db:migrate VERSION=0; heroku run rake db:migrate"
alias bcap="be cap production deploy --trace"
alias bspec="RAILS_ENV=test be rspec"
alias brdb="be rails db"

alias vi="/usr/local/bin/vim"

alias pwgen='openssl rand -base64 15'

alias ns='npm start'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yokohama/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yokohama/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yokohama/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yokohama/opt/anaconda3/bin:$PATH"
   fi
fi
unset __conda_setup

conda deactivate
# <<< conda initialize <<<

alias yokohama='ssh yokohama-develop'

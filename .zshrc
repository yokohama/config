export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="candy"
export LANG=en_US.UTF-8

plugins=(git ruby osx bundler brew rails emoji-clock)

export PATH="$HOME/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/Cellar/openssl@1.1/1.1.1g/bin/:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/Cellar/mysql@5.7/5.7.29/bin:$PATH"

# Node
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Ruby
#eval "$(rbenv init - zsh)"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk

# golang
export GOPATH=$HOME/go

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

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
alias bcap="be cap production deploy --trace"
alias bspec="RAILS_ENV=test be rspec"
alias brdb="be rails db"
alias hrs="heroku run rails s"
alias hrdm="heroku run rake db:migrate VERSION=0; heroku run rake db:migrate"
alias ns='npm start'

alias pwgen='openssl rand -base64 15'

alias doc='UID=$UID GID=$GID docker-compose'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "~/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

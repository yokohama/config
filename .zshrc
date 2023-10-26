export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

plugins=(git)

# before install powerlevel10k.
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source .p10k.zsh

autoload -U compinit && compinit -u

export PATH="$HOME/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/Cellar/openssl@1.1/1.1.1g/bin/:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/Cellar/mysql@5.7/5.7.29/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/google/chrome:$PATH"
export PATH=$PATH:./node_modules/.bin

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# 色を使用出来るようにする
# autoload -Uz colors
# colors

setopt share_history                                # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_dups                             # 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_space                            # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks                           # ヒストリに保存するときに余分なスペースを削除する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完で小文字でも大文字にマッチさせる

# keybind and vimbind
set -o vi
bindkey "jj" vi-cmd-mode

# alias
alias pwgen='openssl rand -base64 15'
alias memo="vim ~/Desktop/`date "+%Y-%m-%d_%H-%M-%S"`.txt"
alias vi='nvim'
alias vim='nvim'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="$HOME/.local/bin:$PATH"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Ruby
eval "$(rbenv init - zsh)"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk

# golang
export GOPATH=$HOME/go

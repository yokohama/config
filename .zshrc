# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

plugins=(git)

# before install powerlevel10k.
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit -u

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/opt/google/chrome:$PATH"
export PATH="$HOME/bin:$PATH"

export EDITOR='vim'

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
alias vi="nvim"
alias vim="nvim"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# C++
export CPLUS_INCLUDE_PATH=/usr/include/c++/11:/usr/include/x86_64-linux-gnu/c++/11

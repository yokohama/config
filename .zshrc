export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

ZSH_THEME="candy"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='blue'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f $ "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(ip)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uf073 %m/%d}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON='\uf015'
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON='\uf74a'
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=false
POWERLEVEL9K_OS_ICON_FOREGROUND='black'
POWERLEVEL9K_OS_ICON_BACKGROUND='202'

plugins=(git)

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

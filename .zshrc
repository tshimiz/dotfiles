[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"

[[ -d $HOME/.rvm/bin ]] && export PATH="$PATH:$HOME/.rvm/bin"
[[ -d $HOME/.rbenv ]] && export RBENV_ROOT="$HOME/.rbenv" && eval "$(rbenv init -)"

# プロンプト
PROMPT='%F{magenta}%B%n%b%f@%F{green}%U%m%u%f%# '
RPROMPT='[%~]'

PATH=~/bin:$PATH

# シンプルな zshrc
# License : MIT
# http://mollifier.mit-license.org/

# 環境変数
export LANG=ja_JP.UTF-8

# 補完機能を有効にする
autoload -Uz compinit
compinit

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# エイリアス
alias ll='ls -l'
alias la='ls -a'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g W='| wc -l'
alias -g X='| xargs'
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# emacs 風キーバインドにする
bindkey -e


# 日本語ファイル名を表示可能にする
setopt print_eight_bit
 
# beep を無効にする
setopt no_beep
 
# フローコントロールを無効にする
setopt no_flow_control
 
# Ctrl+Dでzshを終了しない
#setopt ignore_eof
 
# '#' 以降をコメントとして扱う
setopt interactive_comments

# vim:set ft=zsh :
:

#################################################
#
#  Start-up Setting
#

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export EDITOR=vim
#################################################
#
#  PATH setting
#
#
eval "$(/opt/homebrew/bin/brew shellenv)"

#  Default
export USR_LOCAL_HOME="/usr/local"

#  for tmux (openssl@1.1)
export TMUX_ROOT="/usr/local/opt/ncurses"

# for openssl
#export OPENSSL="/usr/local/opt/openssl@1.1"
export OPENSSL="$(brew --prefix openssl)"

#  for git
export GIT_ROOT="/usr/local/opt/gettext"

#  for curl
export CURL_ROOT="/usr/local/opt/curl"

#  for SQLite to using Python3
export SQLITE_ROOT="/usr/local/opt/sqlite"

# for pyenv
export PYENV_ROOT="${HOME}/.anyenv/envs/pyenv"

# for poetry
export POETRY_ROOT="${HOME}/.poetry"

# for asdf - node plugins
export GAWK_ROOT="/opt/homebrew/opt/gawk"

# /usr/bin/python3 -- system Python
# brew --prefix python -v -- Homebrew Python
# /Users/yuta/.anyenv/envs/pyenv/shims/python3 -- pyenv Python

path=(
  "$OPENSSL/bin"(N-/)
  "$TMUX_ROOT/bin"(N-/)
  "$GIT_ROOT/bin"(N-/)
  "$CURL_ROOT/bin"(N-/)
  "$SQLITE_ROOT/bin"(N-/)
  "$USR_LOCAL_HOME/bin"(N-/)
  "$USR_LOCAL_HOME/sbin"(N-/)
  "$PYENV_ROOT/bin"(N-/)
  "$POETRY_ROOT/bin"(N-/)
  "$GAWK_ROOT/libexec/gnubin"(N-/)
  "$path[@]"
)


# pathの重複排除: ユニーク属性を追加
typeset -U path cdpath fpath manpath

#################################################
#
#  ANYENV setting
#

# ---------------
# pyenv
# ---------------
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(anyenv init -)"

#################################################
#
#  setting COLOR
#

#export LSCOLORS=Gxfxcxdxbxegedabagacad
# export LSCOLORS=exfxcxdxbxegedabagacad(the default)
#a     black
#b     red
#c     green
#d     brown
#e     blue
#f     magenta
#g     cyan
#h     light grey
#A     bold black, usually shows up as dark grey
#B     bold red
#C     bold green
#D     bold brown, usually shows up as yellow
#E     bold blue
#F     bold magenta
#G     bold cyan
#H     bold light grey; looks like bright white
#x     default foreground or background

#1.   directory
#2.   symbolic link
#3.   socket
#4.   pipe
#5.   executable
#6.   block special
#7.   character special
#8.   executable with setuid bit set
#9.   executable with setgid bit set
#10.  directory writable to others, with sticky bit
#11.  directory writable to others, without sticky bit

#export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30'
# https://github.com/sharkdp/vivid
export LS_COLORS="$(vivid generate jellybeans)"

#for theme in $(vivid themes); do
#    echo "Theme: $theme"
#    LS_COLORS=$(vivid generate $theme)
#    ls
#    echo
#done

#文字効果コード
#コード	効果
#00	標準
#01	太字
#04	下線
#05	点滅
#文字色コード
#コード	文字色
#30	黒
#31	赤
#32	緑
#33	黄
#34	青
#35	紫
#36	水色
#37	白
#文字背景色コード
#コード	背景色
#40	黒
#41	赤
#42	緑
#43	黄
#44	青
#45	紫
#46	水色
#47	白

#################################################
#
#  Loading

#  .zshrcを読み込む
if [ -f "${HOME}/.zshrc" ] ; then
  source "${HOME}/.zshrc"
fi
#  .zaliasesを読み込み
if [ -f "${HOME}/.zaliases" ] ; then
  source "${HOME}/.zaliases"
fi

if [ $SHLVL = 1 ]; then
  tmux  # tmux起動
fi

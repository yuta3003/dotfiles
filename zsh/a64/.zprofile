#################################################
#
#  Start-up Setting
#

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export EDITOR=vim

eval "$(/opt/homebrew/bin/brew shellenv)"

#################################################
#
#  PATH setting
#


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
# $(brew --prefix) python -v -- Homebrew Python
# ${HOME}/.anyenv/envs/pyenv/shims/python3 -- pyenv Python

path=(
  "$OPENSSL/bin"(N-/)
  "$TMUX_ROOT/bin"(N-/)
  "$GIT_ROOT/bin"(N-/)
  "$CURL_ROOT/bin"(N-/)
  "$SQLITE_ROOT/bin"(N-/)
  "$USR_LOCAL_HOME/bin"
  "$USR_LOCAL_HOME/sbin"
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

# https://github.com/sharkdp/vivid
echo "test"
export LS_COLORS="$(vivid generate dracula)"

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

#################################################
#
#  Start-up Setting
#

if [ $SHLVL = 1 ]; then
  tmux
fi

#  .bashrcを読み込む
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

#  .bash_aliasesを読み込み
if [ -f "${HOME}/.bash_aliases" ] ; then
  source "${HOME}/.bash_aliases"
fi

#################################################
#
#  LANG Setting
#

#export LANG=ja_JP.UTF-8
#export LESSCHARSET=utf-8

#################################################
#
#  PATH setting
#

# for starship
export PATH="$HOME/.cargo/bin:$PATH"
eval "$(starship init bash)"

# for pyenv via anyenv
# export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#################################################
#
#  Start-up Setting
#

if [ $SHLVL = 1 ]; then
  tmux new-session -A -s local-session
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

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

#################################################
#
#  PATH setting
#

export XDG_CONFIG_HOME="$HOME/.config"

if type vivid >/dev/null 2>&1; then
  # https://github.com/sharkdp/vivid
  export LS_COLORS="$(vivid generate snazzy)"
fi

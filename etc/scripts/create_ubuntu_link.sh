#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}/bash
ln -sf ubuntu/.bash_aliases .bash_aliases && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating bash/.bash_aliases"
ln -sf ubuntu/.bash_profile .bash_profile && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating bash/.bash_profile"
ln -sf ubuntu/.bashrc .bashrc && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating bash/.bashrc"
ln -sf ubuntu/.profile .profile && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating bash/.profile"

cd ${DOT_DIRECTORY}/git
ln -sf ubuntu/.gitconfig .gitconfig && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitconfig"
ln -sf ubuntu/.gitmessage .gitmessage && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitmessage"
ln -sf ubuntu/ignore ignore && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/ignore"

cd ${DOT_DIRECTORY}/neovim
ln -sf ubuntu/init.vim init.vim && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating neovim/init.vim"

cd ${DOT_DIRECTORY}/screen
ln -sf ubuntu/.screenrc .screenrc && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating screen/.screenrc"

cd ${DOT_DIRECTORY}/ssh
ln -sf ubuntu/config config && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating ssh/config"

cd ${DOT_DIRECTORY}/starship
ln -sf ubuntu/starship.toml starship.toml && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating starship/starship.toml"

cd ${DOT_DIRECTORY}/tmux
# .tmuxのシンボリックリンク存在時
#  ln -sf ubuntu/.tmux .tmuxを実行すると
#  ubuntu/.tmuxに.tmuxのリンクが作成されてしまうので
if [ -d ${DOT_DIRECTORY}/tmux/.tmux ]; then
  rm .tmux && \
    echo "$(tput setaf 2)✔︎$(tput sgr0)removing tmux/.tmux"
fi
ln -sf ubuntu/.tmux .tmux && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating tmux/.tmux"
ln -sf ubuntu/.tmux.conf .tmux.conf && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating tmux/.tmux.conf"

cd ${DOT_DIRECTORY}/vim
ln -sf ubuntu/.vimrc .vimrc && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating vim/.vimrc"

cd ${DOT_DIRECTORY}/virtualbox
ln -sf ubuntu/networks.conf networks.conf && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating virtualbox/networks.conf"

cd ${DOT_DIRECTORY}/vscode
ln -sf ubuntu/keybindings.json keybindings.json && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating vscode/keybindings.json"
ln -sf ubuntu/settings.json settings.json && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating vscode/settings.json"

cd ${DOT_DIRECTORY}

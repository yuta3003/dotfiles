#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"

cd ${DOT_DIRECTORY}/git
ln -sf x64/.gitconfig .gitconfig && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitconfig"
ln -sf x64/.gitmessage .gitmessage && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitmessage"
ln -sf x64/ignore ignore && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/ignore"

cd ${DOT_DIRECTORY}/homebrew
ln -sf x64/Brewfile Brewfile && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating homebrew/Brewfile"
ln -sf x64/localhost.homebrew-autoupdate.plist localhost.homebrew-autoupdate.plist && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating homebrew/autoupdate.plist"

cd ${DOT_DIRECTORY}/neovim
ln -sf x64/init.vim init.vim && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating neovim/init.vim"

cd ${DOT_DIRECTORY}/screen
ln -sf x64/.screenrc .screenrc && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating screen/.screenrc"

cd ${DOT_DIRECTORY}/ssh
ln -sf x64/config config && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating ssh/config"

cd ${DOT_DIRECTORY}/starship
ln -sf x64/starship.toml starship.toml && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating starship/starship.toml"

cd ${DOT_DIRECTORY}/tmux
# .tmuxのシンボリックリンク存在時
#  ln -sf x64/.tmux .tmuxを実行すると
#  x64/.tmuxに.tmuxのリンクが作成されてしまうので
if [ -d ${DOT_DIRECTORY}/tmux/.tmux ]; then
  rm .tmux && \
    echo "$(tput setaf 2)✔︎$(tput sgr0)removing tmux/.tmux"
fi
ln -sf x64/.tmux .tmux && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating tmux/.tmux"
ln -sf x64/.tmux.conf .tmux.conf && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating tmux/.tmux.conf"

cd ${DOT_DIRECTORY}/vim
ln -sf x64/.vimrc .vimrc && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating vim/.vimrc"

cd ${DOT_DIRECTORY}/virtualbox
ln -sf x64/networks.conf networks.conf && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating virtualbox/networks.conf"

cd ${DOT_DIRECTORY}/vscode
ln -sf x64/keybindings.json keybindings.json && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating vscode/keybindings.json"
ln -sf x64/settings.json settings.json && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating vscode/settings.json"

cd ${DOT_DIRECTORY}/zsh
ln -sf x64/.zshrc .zshrc && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating zsh/.zshrc"
ln -sf x64/.zprofile .zprofile && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating zsh/.zprofile"
ln -sf x64/.zaliases .zaliases && \
  echo "$(tput setaf 2)✔︎$(tput sgr0)creating zsh/.zaliases"

cd ${DOT_DIRECTORY}

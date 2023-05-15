#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"

echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitconfig"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitignore_global"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating git/.gitmessage"
cd ${DOT_DIRECTORY}/git
ln -sf arm64/.gitconfig .gitconfig
ln -sf arm64/.gitmessage .gitmessage
ln -sf arm64/ignore ignore

echo "$(tput setaf 2)✔︎$(tput sgr0)creating homebrew/Brewfile"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating homebrew/autoupdate.plist"
cd ${DOT_DIRECTORY}/homebrew
ln -sf arm64/Brewfile Brewfile
ln -sf arm64/localhost.homebrew-autoupdate.plist localhost.homebrew-autoupdate.plist

echo "$(tput setaf 2)✔︎$(tput sgr0)creating neovim/init.vim"
cd ${DOT_DIRECTORY}/neovim
ln -sf arm64/init.vim init.vim

echo "$(tput setaf 2)✔︎$(tput sgr0)creating screen/.screenrc"
cd ${DOT_DIRECTORY}/screen
ln -sf arm64/.screenrc .screenrc

echo "$(tput setaf 2)✔︎$(tput sgr0)creating ssh/config"
cd ${DOT_DIRECTORY}/ssh
ln -sf arm64/config config

echo "$(tput setaf 2)✔︎$(tput sgr0)creating starship/starship.toml"
cd ${DOT_DIRECTORY}/starship
ln -sf arm64/starship.toml starship.toml

echo "$(tput setaf 2)✔︎$(tput sgr0)creating tmux/.tmux"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating tmux/.tmux.conf"
cd ${DOT_DIRECTORY}/tmux
# .tmuxのシンボリックリンク存在時
#  ln -sf arm64/.tmux .tmuxを実行すると
#  arm64/.tmuxに.tmuxのリンクが作成されてしまうので
if [ -d ${DOT_DIRECTORY}/tmux/.tmux ]; then
  rm .tmux
fi
ln -sf arm64/.tmux .tmux
ln -sf arm64/.tmux.conf .tmux.conf

echo "$(tput setaf 2)✔︎$(tput sgr0)creating vim/.vimrc"
cd ${DOT_DIRECTORY}/vim
ln -sf arm64/.vimrc .vimrc

echo "$(tput setaf 2)✔︎$(tput sgr0)creating virtualbox/networks.conf"
cd ${DOT_DIRECTORY}/virtualbox
ln -sf arm64/networks.conf networks.conf

echo "$(tput setaf 2)✔︎$(tput sgr0)creating vscode/keybindings.json"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating vscode/settings.json"
cd ${DOT_DIRECTORY}/vscode
ln -sf arm64/keybindings.json keybindings.json
ln -sf arm64/settings.json settings.json

echo "$(tput setaf 2)✔︎$(tput sgr0)creating zsh/.zshrc"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating zsh/.zprofile"
echo "$(tput setaf 2)✔︎$(tput sgr0)creating zsh/.zaliases"
cd ${DOT_DIRECTORY}/zsh
ln -sf arm64/.zshrc .zshrc
ln -sf arm64/.zprofile .zprofile
ln -sf arm64/.zaliases .zaliases

cd ${DOT_DIRECTORY}

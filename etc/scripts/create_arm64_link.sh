#!/bin/bash
set -eu


echo "creating git/.gitconfig"
echo "creating git/.gitignore_global"
echo "creating git/.gitmessage"
cd ${DOT_DIRECTORY}/git
ln -sf arm64/.gitconfig .gitconfig
ln -sf arm64/.gitignore_global .gitignore_global
ln -sf arm64/.gitmessage .gitmessage

echo "creating homebrew/Brewfile"
echo "creating homebrew/autoupdate.plist"
cd ${DOT_DIRECTORY}/homebrew
ln -sf arm64/Brewfile Brewfile
ln -sf arm64/localhost.homebrew-autoupdate.plist localhost.homebrew-autoupdate.plist

echo "creating neovim/init.vim"
cd ${DOT_DIRECTORY}/neovim
ln -sf arm64/init.vim init.vim

echo "creating screen/.screenrc"
cd ${DOT_DIRECTORY}/screen
ln -sf arm64/.screenrc .screenrc

echo "creating ssh/config"
cd ${DOT_DIRECTORY}/ssh
ln -sf arm64/config config

echo "creating starship/starship.toml"
cd ${DOT_DIRECTORY}/starship
ln -sf arm64/starship.toml starship.toml

echo "creating tmux/.tmux"
echo "creating tmux/.tmux.conf"
cd ${DOT_DIRECTORY}/tmux
ln -sf arm64/.tmux .tmux
ln -sf arm64/.tmux.conf .tmux.conf

echo "creating vim/.vimrc"
cd ${DOT_DIRECTORY}/vim
ln -sf arm64/.vimrc .vimrc

echo "creating virtualbox/networks.conf"
cd ${DOT_DIRECTORY}/virtualbox
ln -sf arm64/networks.conf networks.conf

echo "creating vscode/keybindings.json"
echo "creating vscode/settings.json"
cd ${DOT_DIRECTORY}/vscode
ln -sf arm64/keybindings.json keybindings.json
ln -sf arm64/settings.json settings.json

echo "creating zsh/.zshrc"
echo "creating zsh/.zprofile"
echo "creating zsh/.zaliases"
cd ${DOT_DIRECTORY}/zsh
ln -sf arm64/.zshrc .zshrc
ln -sf arm64/.zprofile .zprofile
ln -sf arm64/.zaliases .zaliases

cd ${DOT_DIRECTORY}

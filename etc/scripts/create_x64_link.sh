#!/bin/bash
set -eu

echo "creating git"
cd ${DOT_DIRECTORY}/git
ln -sf x64/.gitconfig .gitconfig
ln -sf x64/.gitmessage .gitmessage
ln -sf x64/ignore ignore

echo "creating homebrew"
cd ${DOT_DIRECTORY}/homebrew
ln -sf x64/Brewfile Brewfile
ln -sf x64/localhost.homebrew-autoupdate.plist localhost.homebrew-autoupdate.plist

echo "creating neovim"
cd ${DOT_DIRECTORY}/neovim
ln -sf x64/init.vim init.vim

echo "creating screen"
cd ${DOT_DIRECTORY}/screen
ln -sf x64/.screenrc .screenrc

echo "creating ssh"
cd ${DOT_DIRECTORY}/ssh
ln -sf x64/config config

echo "creating starship"
cd ${DOT_DIRECTORY}/starship
ln -sf x64/starship.toml starship.toml

echo "creating tmux"
cd ${DOT_DIRECTORY}/tmux
ln -sf x64/.tmux .tmux
ln -sf x64/.tmux.conf .tmux.conf

echo "creating vim"
cd ${DOT_DIRECTORY}/vim
ln -sf x64/.vimrc .vimrc

echo "creating virtualbox"
cd ${DOT_DIRECTORY}/virtualbox
ln -sf x64/networks.conf networks.conf

echo "creating vscode"
cd ${DOT_DIRECTORY}/vscode
ln -sf x64/keybindings.json keybindings.json
ln -sf x64/settings.json ssettings.json

echo "creating zsh"
cd ${DOT_DIRECTORY}/zsh
ln -sf x64/.zshrc .zshrc
ln -sf x64/.zprofile .zprofile
ln -sf x64/.zaliases .zaliases

cd ${DOT_DIRECTORY}

#!/bin/bash

set -eu


cd ../../git
ln -sf arm64/.gitconfig .gitconfig
ln -sf arm64/.gitignore_global .gitignore_global
ln -sf arm64/.gitmessage .gitmessage

cd ../homebrew
ln -sf arm64/Brewfile Brewfile
ln -sf arm64/localhost.homebrew-autoupdate.plist localhost.homebrew-autoupdate.plist

cd ../neovim
ln -sf arm64/init.vim init.vim

cd ../screen
ln -sf arm64/.screenrc .screenrc

cd ../ssh
ln -sf arm64/config config

cd ../starship
ln -sf arm64/starship.toml starship.toml

cd ../tmux
ln -sf arm64/.tmux .tmux
ln -sf arm64/.tmux.conf .tmux.conf

cd ../vim
ln -sf arm64/.vimrc .vimrc

cd ../virtualbox
ln -sf arm64/networks.conf networks.conf

cd ../vscode
ln -sf arm64/keybindings.json keybindings.json
ln -sf arm64/settings.json ssettings.json

cd ../zsh
ln -sf arm64/.zshrc .zshrc
ln -sf arm64/.zprofile .zprofile
ln -sf arm64/.zaliases .zaliases

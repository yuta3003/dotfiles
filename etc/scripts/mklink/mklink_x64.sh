#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"
SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"
MKLINK_SCRIPT_DIR="${SCRIPT_DIR}/mklink"
DEPLOY_LIST_DIR="${DOT_DIRECTORY}/etc/deploylist"

main() {
  source ${MKLINK_SCRIPT_DIR}/rmlink.sh

  cd ${DOT_DIRECTORY}/git
  create_symlink git x64/.gitconfig
  create_symlink git x64/.gitmessage
  create_symlink git x64/ignore

  cd ${DOT_DIRECTORY}/homebrew
  create_symlink homebrew x64/Brewfile
  create_symlink homebrew x64/localhost.homebrew-autoupdate.plist

  cd ${DOT_DIRECTORY}/neovim
  create_symlink neovim x64/init.vim

  cd ${DOT_DIRECTORY}/ssh
  create_symlink ssh x64/config

  cd ${DOT_DIRECTORY}/starship
  create_symlink starship x64/starship.toml

  cd ${DOT_DIRECTORY}/tmux
  create_symlink tmux x64/.tmux
  create_symlink tmux x64/.tmux.conf

  cd ${DOT_DIRECTORY}/vim
  create_symlink vim x64/.vimrc

  cd ${DOT_DIRECTORY}/vscode
  create_symlink vscode x64/keybindings.json
  create_symlink vscode x64/settings.json

  cd ${DOT_DIRECTORY}/zsh
  create_symlink zsh x64/.zshrc
  create_symlink zsh x64/.zprofile
  create_symlink zsh x64/.zaliases

  cd ${DOT_DIRECTORY}
}

create_symlink() {
  ln -sf ${2} ${2##*/} && \
    echo "$(tput setaf 2)✔︎$(tput sgr0) creating ${1}/${2##*/}"
  return 0
}


main

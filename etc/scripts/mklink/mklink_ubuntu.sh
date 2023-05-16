#!/bin/bash
set -eu


CURRENT_DIR=$(cd $(dirname $0); pwd)
DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../../..; pwd)
# DOT_DIRECTORY="./../../.."
SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"
MKLINK_SCRIPT_DIR="${SCRIPT_DIR}/mklink"

main() {
  source ${MKLINK_SCRIPT_DIR}/rmlink.sh

  cd ${DOT_DIRECTORY}/bash
  create_symlink bash ubuntu/.bash_aliases
  create_symlink bash ubuntu/.bash_profile
  create_symlink bash ubuntu/.bashrc
  create_symlink bash ubuntu/.profile

  cd ${DOT_DIRECTORY}/git
  create_symlink git ubuntu/.gitconfig
  create_symlink git ubuntu/.gitmessage
  create_symlink git ubuntu/ignore

  cd ${DOT_DIRECTORY}/neovim
  create_symlink neovim ubuntu/init.vim

  cd ${DOT_DIRECTORY}/ssh
  create_symlink ssh ubuntu/config

  cd ${DOT_DIRECTORY}/starship
  create_symlink starship ubuntu/starship.toml

  cd ${DOT_DIRECTORY}/tmux
  create_symlink tmux ubuntu/.tmux
  create_symlink tmux ubuntu/.tmux.conf

  cd ${DOT_DIRECTORY}/vim
  create_symlink vim ubuntu/.vimrc

  cd ${DOT_DIRECTORY}/vscode
  create_symlink vscode ubuntu/keybindings.json
  create_symlink vscode ubuntu/settings.json

  cd ${DOT_DIRECTORY}
}

create_symlink() {
  ln -sf ${2} ${2##*/} && \
    echo "$(tput setaf 2)✔︎$(tput sgr0) creating ${1}/${2##*/}"
  return 0
}


main

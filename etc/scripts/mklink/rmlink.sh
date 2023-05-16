#!/bin/bash
set -eu


main() {
  echo "${DOT_DIRECTORY}"
  remove_symlink ${DOT_DIRECTORY}/bash/.bash_aliases
  remove_symlink ${DOT_DIRECTORY}/bash/.bash_profile
  remove_symlink ${DOT_DIRECTORY}/bash/.bashrc
  remove_symlink ${DOT_DIRECTORY}/bash/.profile

  remove_symlink ${DOT_DIRECTORY}/git/.gitconfig
  remove_symlink ${DOT_DIRECTORY}/git/.gitmessage
  remove_symlink ${DOT_DIRECTORY}/git/ignore

  remove_symlink ${DOT_DIRECTORY}/homebrew/Brewfile
  remove_symlink ${DOT_DIRECTORY}/homebrew/localhost.homebrew-autoupdate.plist

  remove_symlink ${DOT_DIRECTORY}/neovim/init.vim

  remove_symlink ${DOT_DIRECTORY}/screen/.screenrc

  remove_symlink ${DOT_DIRECTORY}/ssh/config

  remove_symlink ${DOT_DIRECTORY}/starship/starship.toml

  remove_symlink ${DOT_DIRECTORY}/tmux/.tmux
  remove_symlink ${DOT_DIRECTORY}/tmux/.tmux.conf

  remove_symlink ${DOT_DIRECTORY}/vim/.vimrc

  remove_symlink ${DOT_DIRECTORY}/virtualbox/networks.conf

  remove_symlink ${DOT_DIRECTORY}/vscode/keybindings.json
  remove_symlink ${DOT_DIRECTORY}/vscode/settings.json

  remove_symlink ${DOT_DIRECTORY}/zsh/.zprofile
  remove_symlink ${DOT_DIRECTORY}/zsh/.zaliases
  remove_symlink ${DOT_DIRECTORY}/zsh/.zshrc
}

remove_symlink() {
  if [ -f "${1}" ] || [ -d "${1}" ]; then
    rm "${1}" && \
      echo "$(tput setaf 2)✔︎$(tput sgr0) removing ${1}"
  fi
}


main

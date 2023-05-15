#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"

main() {
  source rmlink.sh

  cd ${DOT_DIRECTORY}/git
  create_symlink git arm64/.gitconfig
  create_symlink git arm64/.gitmessage
  create_symlink git arm64/ignore

  cd ${DOT_DIRECTORY}/homebrew
  create_symlink homebrew arm64/Brewfile
  create_symlink homebrew arm64/localhost.homebrew-autoupdate.plist

  cd ${DOT_DIRECTORY}/neovim
  create_symlink neovim arm64/init.vim

  cd ${DOT_DIRECTORY}/ssh
  create_symlink ssh arm64/config

  cd ${DOT_DIRECTORY}/starship
  create_symlink starship arm64/starship.toml

  cd ${DOT_DIRECTORY}/tmux
  create_symlink tmux arm64/.tmux
  create_symlink tmux arm64/.tmux.conf

  cd ${DOT_DIRECTORY}/vim
  create_symlink vim arm64/.vimrc

  cd ${DOT_DIRECTORY}/vscode
  create_symlink vscode arm64/keybindings.json
  create_symlink vscode arm64/settings.json

  cd ${DOT_DIRECTORY}/zsh
  create_symlink zsh arm64/.zshrc
  create_symlink zsh arm64/.zprofile
  create_symlink zsh arm64/.zaliases

  cd ${DOT_DIRECTORY}
}

create_symlink() {
  ln -sf ${2} ${2##*/} && \
    echo "$(tput setaf 2)✔︎$(tput sgr0) creating ${1}/${2##*/}"
  return 0
}


main

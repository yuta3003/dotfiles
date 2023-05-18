#!/bin/bash
set -eu


# CURRENT_DIR=$(cd $(dirname $0); pwd)
# DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../..; pwd)
# SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"
# MKLINK_SCRIPT_DIR="${SCRIPT_DIR}/mklink"
SILENT_MODE=false

while (( $# > 0 ))
do
  case $1 in
    -s)
      SILENT_MODE=true
      ;;
    -*)
      echo "invalid option"
      exit 1
      ;;
  esac
  shift
done

main() {
  if "${SILENT_MODE}"; then
    disable_echo
  fi
  source ${MKLINK_SCRIPT_DIR}/rmlink.sh

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
  if "${SILENT_MODE}"; then
    enable_echo
  fi
}

create_symlink() {
  ln -sf ${2} ${2##*/} && \
    echo "$(tput setaf 2)✔︎$(tput sgr0) creating ${1}/${2##*/}"
  return 0
}

disable_echo() {
  exec 3>&1
  exec 1>/dev/null
}

enable_echo() {
  exec 1>&3
  exec 3>&-
}

# ShellSpec
${__SOURCED__:+return}
main

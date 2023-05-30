#!/bin/bash
set -eu


# CURRENT_DIR=$(cd $(dirname $0); pwd)
# DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../../..; pwd)
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
  source "${MKLINK_SCRIPT_DIR}/rmlink.sh"

  cd "${DOT_DIRECTORY}/config/git"
  create_symlink git a64/config
  create_symlink git a64/message
  create_symlink git a64/ignore

  cd "${DOT_DIRECTORY}/config/homebrew"
  create_symlink homebrew a64/Brewfile
  create_symlink homebrew a64/localhost.homebrew-autoupdate.plist

  cd "${DOT_DIRECTORY}/config/neovim"
  create_symlink neovim a64/init.vim

  cd "${DOT_DIRECTORY}/config/ssh"
  create_symlink ssh a64/config

  cd "${DOT_DIRECTORY}/config/starship"
  create_symlink starship a64/starship.toml

  cd "${DOT_DIRECTORY}/config/tmux"
  create_symlink tmux a64/.tmux
  create_symlink tmux a64/.tmux.conf

  cd "${DOT_DIRECTORY}/config/vim"
  create_symlink vim a64/.vimrc

  cd "${DOT_DIRECTORY}/config/vscode"
  create_symlink vscode a64/keybindings.json
  create_symlink vscode a64/settings.json

  cd "${DOT_DIRECTORY}/config/zsh"
  create_symlink zsh a64/.zshrc
  create_symlink zsh a64/.zshenv
  create_symlink zsh a64/.zprofile
  create_symlink zsh a64/.zaliases

  cd "${DOT_DIRECTORY}"
  if "${SILENT_MODE}"; then
    enable_echo
  fi
}

create_symlink() {
  ln -sf "${2}" "${2##*/}" && \
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

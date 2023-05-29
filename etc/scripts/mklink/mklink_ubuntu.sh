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
  cd "${DOT_DIRECTORY}/bash"
  create_symlink bash ubuntu/.bash_aliases
  create_symlink bash ubuntu/.bash_profile
  create_symlink bash ubuntu/.bashrc
  create_symlink bash ubuntu/.profile

  cd "${DOT_DIRECTORY}/git"
  create_symlink git ubuntu/config
  create_symlink git ubuntu/message
  create_symlink git ubuntu/ignore

  cd "${DOT_DIRECTORY}/neovim"
  create_symlink neovim ubuntu/init.vim

  cd "${DOT_DIRECTORY}/ssh"
  create_symlink ssh ubuntu/config

  cd "${DOT_DIRECTORY}/starship"
  create_symlink starship ubuntu/starship.toml

  cd "${DOT_DIRECTORY}/tmux"
  create_symlink tmux ubuntu/.tmux
  create_symlink tmux ubuntu/.tmux.conf

  cd "${DOT_DIRECTORY}/vim"
  create_symlink vim ubuntu/.vimrc

  cd "${DOT_DIRECTORY}/vscode"
  create_symlink vscode ubuntu/keybindings.json
  create_symlink vscode ubuntu/settings.json

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

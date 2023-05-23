#!/bin/bash
set -eu


# CURRENT_DIR=$(cd $(dirname $0); pwd)
# DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../../..; pwd)
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
  local filepath_array=(
    bash/.bash_aliases
    bash/.bash_profile
    bash/.bashrc
    bash/.profile
    git/.gitconfig
    git/.gitmessage
    git/ignore
    homebrew/Brewfile
    homebrew/localhost.homebrew-autoupdate.plist
    neovim/init.vim
    ssh/config
    starship/starship.toml
    tmux/.tmux
    tmux/.tmux.conf
    vim/.vimrc
    virtualbox/networks.conf
    vscode/keybindings.json
    vscode/settings.json
    zsh/.zprofile
    zsh/.zaliases
    zsh/.zshrc
    zsh/.zshenv
  )

  for i in "${!filepath_array[@]}"; do
    if "${SILENT_MODE}"; then
      disable_echo
      remove_symlink "${DOT_DIRECTORY}/${filepath_array[$i]}"
      enable_echo
    else
      remove_symlink "${DOT_DIRECTORY}/${filepath_array[$i]}"
    fi
  done
}

disable_echo() {
  exec 3>&1
  exec 1>/dev/null
}

enable_echo() {
  exec 1>&3
  exec 3>&-
}

remove_symlink() {
  if [ -f "${1}" ] || [ -d "${1}" ]; then
    rm "${1}" && \
      echo "$(tput setaf 2)✔︎$(tput sgr0) removing ${1}"
  fi
}

# ShellSpec
${__SOURCED__:+return}
main

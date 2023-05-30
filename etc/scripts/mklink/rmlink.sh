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
    config/bash/.bash_aliases
    config/bash/.bash_profile
    config/bash/.bashrc
    config/bash/.profile
    config/git/.gitconfig
    config/git/.gitmessage
    config/git/ignore
    config/homebrew/Brewfile
    config/homebrew/localhost.homebrew-autoupdate.plist
    config/neovim/init.vim
    config/ssh/config
    config/starship/starship.toml
    config/tmux/.tmux
    config/tmux/.tmux.conf
    config/vim/.vimrc
    config/virtualbox/networks.conf
    config/vscode/keybindings.json
    config/vscode/settings.json
    config/zsh/.zprofile
    config/zsh/.zaliases
    config/zsh/.zshrc
    config/zsh/.zshenv
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

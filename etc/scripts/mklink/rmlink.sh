#!/bin/bash
set -eu


# CURRENT_DIR=$(cd $(dirname $0); pwd)
# DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../../..; pwd)


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
  )

  for i in "${!filepath_array[@]}"; do
    remove_symlink "${DOT_DIRECTORY}/${filepath_array[$i]}"
  done
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

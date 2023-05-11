#!/bin/bash

set -eu

main() {
  source ${DOT_DIRECTORY}/etc/scripts/create_arm64_link.sh
  deploy_to_home
  deploy_to_dotconfig
  deploy_neovim_config
  deploy_ssh_config
}

# Deploy to HOME
deploy_to_home() {
  # LIST
  #   - git
  #   - screen
  #   - tmux
  #   - vim
  #   - zsh

  while read -r f; do
    [[ ${f} == */Alfred* ]] && continue
    [[ ${f} == */bash* ]] && continue
    [[ ${f} == */etc* ]] && continue
    # [[ ${f} == */git* ]] && continue
    [[ ${f} == */homebrew* ]] && continue
    [[ ${f} == */Iterm2* ]] && continue
    [[ ${f} == */neovim* ]] && continue
    # [[ ${f} == */screen* ]] && continue
    [[ ${f} == */ssh* ]] && continue
    [[ ${f} == */starship* ]] && continue
    # [[ ${f} == */tmux* ]] && continue
    # [[ ${f} == */vim* ]] && continue
    [[ ${f} == */virtualbox* ]] && continue
    [[ ${f} == */vscode* ]] && continue
    # [[ ${f} == */zsh* ]] && continue
    [[ ${f} == *\.editorconfig ]] && continue
    [[ ${f} == *\.gitignore ]] && continue
    [[ ${f} == *README.md* ]] && continue
    [[ ${f} == *\.git/* ]] && continue
    [[ ${f} == *arm64* ]] && continue
    [[ ${f} == *x64* ]] && continue

    ln -snf ${f} ${HOME}/${f##*/}
    echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/${f##*/}"

  done < <(find ${DOT_DIRECTORY} -mindepth 1 \( -type l -o -type f \))
}

deploy_to_dotconfig() {
  # LIST
  #   - starship

  while read -r f; do
    [[ ${f} == */Alfred* ]] && continue
    [[ ${f} == */bash* ]] && continue
    [[ ${f} == */etc* ]] && continue
    [[ ${f} == */git* ]] && continue
    [[ ${f} == */homebrew* ]] && continue
    [[ ${f} == */Iterm2* ]] && continue
    [[ ${f} == */neovim* ]] && continue
    [[ ${f} == */screen* ]] && continue
    [[ ${f} == */ssh* ]] && continue
    # [[ ${f} == */starship* ]] && continue
    [[ ${f} == */tmux* ]] && continue
    [[ ${f} == */vim* ]] && continue
    [[ ${f} == */virtualbox* ]] && continue
    [[ ${f} == */vscode* ]] && continue
    [[ ${f} == */zsh* ]] && continue
    [[ ${f} == *\.editorconfig ]] && continue
    [[ ${f} == *\.gitignore ]] && continue
    [[ ${f} == *README.md* ]] && continue
    [[ ${f} == *\.git/* ]] && continue
    [[ ${f} == *arm64* ]] && continue
    [[ ${f} == *x64* ]] && continue

    ln -snf ${f} ${HOME}/.config/${f##*/}
    echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/.config/${f##*/}"

  done < <(find ${DOT_DIRECTORY} -mindepth 1 \( -type l -o -type f \))
}

deploy_neovim_config() {
  if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
  fi
  ln -snf \
    ${DOT_DIRECTORY}/neovim/init.vim \
    ~/.config/nvim/init.vim

  echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/.config/nvim/init.vim"
}

deploy_ssh_config() {
  if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
  fi
  ln -snf \
    ${DOT_DIRECTORY}/ssh/config \
    ~/.ssh/config

  echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/.ssh/config"
}

deploy_homebrew_autoupdate_config() {
  ln -snf \
    ${DOT_DIRECTORY}/homebrew/localhost.homebrew-autoupdate.plist \
    ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
  echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/Library/LaunchAgents/localhost.homebrew-autoupdate.plist"
}

deploy_vscode_config() {
  if [ ! -d ~/Library/Application\ Support/Code/User ]; then
    mkdir -p ~/Library/Application\ Support/Code/User
  fi
  ln -snf \
    ~/dotfiles/vscode/settings.json \
    ~/Library/Application\ Support/Code/User/settings.json
  ln -snf \
    ~/dotfiles/vscode/keybindings.json \
    ~/Library/Application\ Support/Code/User/keybindings.json
  echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/~/Library/Application\ Support/Code/User/settings.json"
  echo "$(tput setaf 2)✔︎$(tput sgr0)${HOME}/~/Library/Application\ Support/Code/User/keybindings.json"
}


main

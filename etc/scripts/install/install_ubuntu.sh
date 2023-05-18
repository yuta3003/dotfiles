#!/bin/bash
set -eu


main() {
  apt-get update && \
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully apt-get update"
  apt-get upgrade && \
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully apt-get upgrade"
  apt-get cleanup && \
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully apt-get autoclean"
  install_git
  clone_my_dotfiles
  create_dotconfig_directory
  install_tpm
  install_vim_plug

  #make deploy
  source ${SCRIPT_DIR}/deploy.sh

  if ask_yes_no "再起動しますか？"; then
    echo 'Rebooting to reflect settings'
    sudo shutdown -r now
  else
    echo "再起動をスキップしました。"
  fi
  return 0
}

install_git() {
  case "${OS_TYPE}" in
    "OSX(x64)")
      if [ ! type git >/dev/null 2>&1 ];then
        echo "Installing git..."
        brew install git && \
          echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed git."
      else
        echo "git already installed."
      fi
      ;;
    "OSX(arm64)")
      if [ ! type git >/dev/null 2>&1 ];then
        echo "Installing git..."
        brew install git && \
          echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed git."
      else
        echo "git already installed."
      fi
      ;;
    "Ubuntu")
      if [ ! type git >/dev/null 2>&1 ];then
        echo "Installing git..."
        apt-get install git && \
          echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed git."
      else
        echo "git already installed."
      fi
      ;;
    "ArchLinux")
      ;;
    *)
      echo "Unsupported OS type"
      exit
      ;;
  esac
  return 0
}

clone_my_dotfiles() {
  if [ ! -d ~/dotfiles ]; then
    if [ ! -f ~/.ssh/github.pub ]; then
      cd ~/.ssh
      ssh-keygen -t rsa -f github -N ""
    fi
    cat ~/.ssh/github.pub | pbcopy
    echo "github.pubをクリップボードにコピーしました。"
    if ask_yes_no "公開鍵をGitHubに登録しましたか？"; then
      echo "Cloning dotfiles..."
      git clone git@github.com:yuta3003/dotfiles.git
      echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed dotfiles"
    else
      exit 0
    fi
  else
    echo "dotfiles already exists."
  fi
  return 0
}

ask_yes_no() {
  while true; do
    echo -n "$* [y/n]: "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      [Nn]*)
        return 1
        ;;
      *)
        echo "yまたはnを入力してください"
        ;;
    esac
  done
}

clone_my_dotfiles() {
  if [ ! -d ~/dotfiles ]; then
    if [ ! -f ~/.ssh/github.pub ]; then
      cd ~/.ssh
      ssh-keygen -t rsa -f github -N ""
    fi
    cat ~/.ssh/github.pub | pbcopy
    echo "github.pubをクリップボードにコピーしました。"
    if ask_yes_no "公開鍵をGitHubに登録しましたか？"; then
      echo "Cloning dotfiles..."
      git clone git@github.com:yuta3003/dotfiles.git
      echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed dotfiles"
    else
      exit 0
    fi
  else
    echo "dotfiles already exists."
  fi
  return 0
}

create_dotconfig_directory() {
  if [ ! -d ~/.config ]; then
    echo "Creating ~/.config directory..."
    mkdir ~/.config
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully created ~/.config"
  else
    echo ".config directory already exists."
  fi
  return 0
}


install_tpm() {
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed Tmux Plugin Manager..."
  fi
  return 0
}

install_vim_plug() {
  echo "Installing vim-plug..."
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed vim-plug"
  return 0
}


main

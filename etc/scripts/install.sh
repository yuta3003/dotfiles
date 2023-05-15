#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"
SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"

main() {

  if ! is_m1_mac; then
    echo "Installing stoped."
    exit 1
  fi

  if ask_yes_no "XCodeをインストールしますか？"; then
    install_xcode
  else
    echo "XCodeのインストールをスキップしました。"
  fi

  install_homebrew
  install_git
  clone_my_dotfiles

  if ask_yes_no "Brewfileをインストールしますか？"; then
    install_brews
  else
    echo "brewsのインストールをスキップしました。"
  fi

  create_dotconfig_directory
  install_tpm
  install_vim_plug


  #make deploy
  source ${SCRIPT_DIR}/deploy.sh

  #make init

  # Macの設定を変更
  source ${SCRIPT_DIR}/defaults.sh


  if ask_yes_no "再起動しますか？"; then
    echo 'Rebooting to reflect settings'
    sudo shutdown -r now
  else
    echo "再起動をスキップしました。"
  fi
}

has() {
  type "$1" > /dev/null 2>&1
}

is_m1_mac() {
  if [ ! "$(uname)" == "Darwin" ] ; then
  	echo "Not macOS!"
  	return 1
  else
    if [ "$(uname -m)" == "x86_64" ] ; then
    # intel Mac
      echo "Intel Mac"
      return 1
    elif [ "$(uname -m)" == "arm64" ] ; then
    # M1 Mac
      echo "M1 Mac"
      return 0
    fi
  fi
}

install_xcode() {
  echo "Installing Xcode..."
  xcode-select --install
  echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed XCode."
  return 0
}

install_homebrew() {
  if  [ ! type brew >/dev/null 2>&1 ]; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed Homebrew."
  else
    echo "Homebrew already installed."
  fi
  return 0
}

install_git() {
  if [ ! type git >/dev/null 2>&1 ];then
    echo "Installing git..."
    brew install git
    echo "$(tput setaf 2)✔︎$(tput sgr0)Successfully installed git."
  else
    echo "git already installed."
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
  # Clone my dotfiles
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

install_brews() {
  brew update
  brew upgrade
  brew bundle --file ~/dotfiles/homebrew/Brewfile_arm64_OSX
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

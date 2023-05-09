#!/bin/bash

set -eu

if [ ! "$(uname)" == "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

if [ "$(uname)" == "Darwin" ] ; then
  if [ "$(uname -m)" == "x86_64" ] ; then
  # intel Mac
    echo "Intel Mac"
    exit 1
  elif [ "$(uname -m)" == "arm64" ] ; then
  # M1 Mac
    echo "M1 Mac"
  else
    echo ""
	  exit 1
  fi
fi

cd $HOME

# Install Xcode
echo "Installing Xcode..."
xcode-select --install

# Install Homebrew
if  [! type brew >/dev/null 2>&1 ]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed."
fi

# Install git
if [ ! type git >/dev/null 2>&1 ];then
  echo "Installing git..."
  brew install git
else
  echo "git already installed."
fi

# Clone my dotfiles
if [ ! -d ~/dotfiles ]; then
  cd ~/.ssh
  ssh-keygen -t rsa -f github -N ""
  cat ~/.ssh/github.pub | pbcopy
  echo "github.pubをクリップボードにコピーしました。"
  echo "公開鍵をGitHubに登録しましたか？"
  select yn in "Yes"
    do
      case $yn in
        Yes ) break;;
      esac
    done
    echo "Cloning dotfiles..."
    git clone git@github.com:yuta3003/dotfiles.git
else
  echo "dotfiles already exists."
fi

# Install Brewfile
brew update
brew upgrade
brew bundle --file ~/dotfiles/homebrew/Brewfile_arm64_OSX

# Create .config directory
if [ ! -d ~/.config ]; then
  echo "Creating ~/.config directory..."
  mkdir ~/.config
else
  echo ".config directory already exists."
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo "Installing Tmux Plugin Manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

cd dotfiles

#make deploy

#make init

# Macの設定を変更
#~/dotfiles/etc/scripts/defaults.sh


echo 'Rebooting to reflect settings'
sudo shutdownn -r now

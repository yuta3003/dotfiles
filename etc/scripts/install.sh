#!/bin/bash

set -eu

cd $HOME

# Install Homebrew
if [ ! type brew >/dev/null 2>&1 ]
  then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew already installed."
fi

# Install git
if [ ! type git >/dev/null 2>&1 ]
  then
    echo "Installing git..."
    brew install git
  else
    echo "git already installed."
fi

# Clone my dotfiles
if [ ! -d ~/dotfiles ]
  then
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

# Create .config directory
if [ ! -d ~/.config ]
  then
    echo "Creating ~/.config directory..."
    mkdir ~/.config
  else
    echo ".config directory already exists."
fi

cd dotfiles

#make deploy

#make init

# Macの設定を変更
echo 'Changing MacOS settings...'
defaults write -g InitialKeyRepeat -int 12    # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1    # normal minimum is 2 (30 ms)
defaults write -g AppleShowAllExtensions -bool true       # 全ての拡張子のファイルを表示する
defaults write -g com.apple.mouse.tapBehavior -int 1      # タップ時動作をクリックに変更
defaults write com.apple.CrashReporter DialogType -string "none"    # クラッシュレポートを無効化する
defaults write com.apple.LaunchServices LSQuarantine -bool false    # 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false  # スペルの訂正を無効にする
defaults write com.apple.finder WarnOnEmptyTrash -bool false    # ゴミ箱を空にする前の警告の無効化
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE  # .DS_Storeファイルを作らせない

echo 'Rebooting to reflect settings'
sudo shutdownn -r now

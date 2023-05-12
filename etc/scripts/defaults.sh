#!/bin/bash
set -eu


# Macの設定を変更
echo 'Changing MacOS settings...'
#----------------------------------------------
# Key Setting
#----------------------------------------------
defaults write -g InitialKeyRepeat -int 12    # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1            # normal minimum is 2 (30 ms)

#----------------------------------------------
# Finder Setting
#----------------------------------------------
defaults write -g AppleShowAllExtensions -bool true       # 全ての拡張子のファイルを表示する

#----------------------------------------------
# Trackpad Setting
#----------------------------------------------
defaults write -g com.apple.mouse.tapBehavior -int 1      # タップ時動作をクリックに変更

defaults write com.apple.CrashReporter DialogType -string "none"    # クラッシュレポートを無効化する
defaults write com.apple.LaunchServices LSQuarantine -bool false    # 未確認のアプリケーションを実行する際のダイアログを無効にする
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false  # スペルの訂正を無効にする
defaults write com.apple.finder WarnOnEmptyTrash -bool false        # ゴミ箱を空にする前の警告の無効化
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE  # .DS_Storeファイルを作らせない
defaults write com.apple.dock orientation left
# VSCode vim
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

## 三本指でドラッグ
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true && \
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

## terminalでUTF-8のみを使用する
defaults write com.apple.terminal StringEncodings -array 4

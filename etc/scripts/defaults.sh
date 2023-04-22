
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

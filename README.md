# DotFiles

## Installation
### Mac OS X(Intel)

```sh
brew update
brew upgrade

cd homebrew
brew bundle

cd $HOME
mkdir .config
ln -sf ~/dotfiles/git/gitconfig_x64_OSX ~/.gitconfig
ln -sf ~/dotfiles/git/gitignore_global_x64_OSX ~/.gitignore_global
ln -sf ~/dotfiles/git/gitmessage_x64_OSX ~/.gitmessage
ln -sf ~/dotfiles/homebrew/localhost.homebrew-autoupdate.plist_x64_OSX ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
ln -sf ~/dotfiles/neovim/init.vim_x64_OSX ~/.config/nvim/init.vim
ln -sf ~/dotfiles/starship/starship.toml_x64_OSX ~/.config/starship.toml
ln -sf ~/dotfiles/ssh/config_x64_OSX ~/.ssh/config
ln -sf ~/dotfiles/tmux/tmux_x64_OSX ~/.tmux
ln -sf ~/dotfiles/tmux/tmux.conf_x64_OSX ~/.tmux.conf
ln -sf ~/dotfiles/virtualbox/networks.conf_x64_OSX /etc/vbox/networks.conf
ln -sf ~/dotfiles/vscode/settings.json_x64_OSX ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json_x64_OSX ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/zsh/zaliases_x64_OSX ~/.zaliases
ln -sf ~/dotfiles/zsh/zprofile_x64_OSX ~/.zprofile
ln -sf ~/dotfiles/zsh/zshrc_x64_OSX ~/.zshrc

launchctl load ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
launchctl list | grep home
```

### Mac OS X(M1)
```sh
brew update
brew upgrade

cd homebrew
brew bundle

cd $HOME
mkdir .config
ln -sf ~/dotfiles/git/gitconfig_arm64_OSX ~/.gitconfig
ln -sf ~/dotfiles/git/gitignore_global_arm64_OSX ~/.gitignore_global
ln -sf ~/dotfiles/git/gitmessage_arm64_OSX ~/.gitmessage
ln -sf ~/dotfiles/homebrew/localhost.homebrew-autoupdate.plist_arm64_OSX ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
ln -sf ~/dotfiles/neovim/init.vim_arm64_OSX ~/.config/nvim/init.vim
ln -sf ~/dotfiles/starship/starship.toml_arm64_OSX ~/.config/starship.toml
ln -sf ~/dotfiles/ssh/config_arm64_OSX ~/.ssh/config
ln -sf ~/dotfiles/tmux/tmux_arm64_OSX ~/.tmux
ln -sf ~/dotfiles/tmux/tmux.conf_arm64_OSX ~/.tmux.conf
ln -sf ~/dotfiles/virtualbox/networks.conf_arm64_OSX /etc/vbox/networks.conf
ln -sf ~/dotfiles/vscode/settings.json_arm64_OSX ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json_arm64_OSX ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/zsh/zaliases_arm64_OSX ~/.zaliases
ln -sf ~/dotfiles/zsh/zprofile_arm64_OSX ~/.zprofile
ln -sf ~/dotfiles/zsh/zshrc_arm64_OSX ~/.zshrc

launchctl load ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
launchctl list | grep home
```
### Arch Linux



```
/bin/bash -c "$(curl https://raw.githubusercontent.com/yuta3003/dotfiles/main/etc/scripts/install.sh)"
```

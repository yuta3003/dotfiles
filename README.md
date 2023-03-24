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
ln -sf ~/dotfiles/M1-mac/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/M1-mac/git/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/M1-mac/git/.gitmessage ~/.gitmessage
ln -sf ~/dotfiles/M1-mac/homebrew/localhost.homebrew-autoupdate.plist ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
ln -sf ~/dotfiles/M1-mac/neovim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/M1-mac/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/M1-mac/tmux/.tmux ~/.tmux
ln -sf ~/dotfiles/M1-mac/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/M1-mac/virtualbox/networks.conf /etc/vbox/networks.conf
ln -sf ~/dotfiles/M1-mac/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/M1-mac/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/M1-mac/zsh/.zaliases ~/.zaliases
ln -sf ~/dotfiles/M1-mac/zsh/.zprofile ~/.zprofile
ln -sf ~/dotfiles/M1-mac/zsh/.zshrc ~/.zshrc

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
ln -sf ~/dotfiles/M1-mac/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/M1-mac/git/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/M1-mac/git/.gitmessage ~/.gitmessage
ln -sf ~/dotfiles/M1-mac/homebrew/localhost.homebrew-autoupdate.plist ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
ln -sf ~/dotfiles/M1-mac/neovim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/M1-mac/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/M1-mac/tmux/.tmux ~/.tmux
ln -sf ~/dotfiles/M1-mac/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/M1-mac/virtualbox/networks.conf /etc/vbox/networks.conf
ln -sf ~/dotfiles/M1-mac/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/M1-mac/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/M1-mac/zsh/.zaliases ~/.zaliases
ln -sf ~/dotfiles/M1-mac/zsh/.zprofile ~/.zprofile
ln -sf ~/dotfiles/M1-mac/zsh/.zshrc ~/.zshrc

launchctl load ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
launchctl list | grep home
```
### Arch Linux

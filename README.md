# DotFiles

## Installation
### for OS X

```sh
brew update
brew upgrade

cd homebrew
brew bundle

cd $HOME
mkdir .config
ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/git/.gitmessage ~/.gitmessage
ln -sf ~/dotfiles/hombrew/localhost.homebrew-autoupdate.plist ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
ln -sf ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/tmux/.tmux ~/.tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/virtualbox/networks.conf /etc/vbox/networks.conf
ln -sf ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf ~/dotfiles/zsh/.zaliases ~/.zaliases
ln -sf ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

launchctl load ~/Library/LaunchAgents/localhost.homebrew-autoupdate.plist
launchctl list | grep home
```

# DotFiles

![Author](https://img.shields.io/badge/Author-yuta3003-blue)

## Supported OS
- macOS (Apple Silicon)
- Ubuntu

## Requirements
- [chezmoi](https://www.chezmoi.io/)

## Installation

```sh
brew install chezmoi
git clone https://github.com/yuta3003/dotfiles.git ~/dotfiles
ln -s ~/dotfiles ~/.local/share/chezmoi
chezmoi init --apply
```

## Usage

```sh
# 差分を確認
chezmoi diff

# 設定を適用
chezmoi apply

# デプロイ先の変更をソースに反映
chezmoi re-add
```

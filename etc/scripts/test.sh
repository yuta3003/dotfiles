#!/bin/bash

set -eu

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}


# Deploy to HOME
while read -r f; do

  [[ ${f} == *Alfred* ]] && continue
  [[ ${f} == *bash* ]] && continue
  [[ ${f} == *etc* ]] && continue
  [[ ${f} == *homebrew* ]] && continue
  [[ ${f} == *Iterm2* ]] && continue
  [[ ${f} == *neovim* ]] && continue
  [[ ${f} == *ssh* ]] && continue
  [[ ${f} == *starship* ]] && continue
  [[ ${f} == *virtualbox* ]] && continue
  [[ ${f} == *vscode* ]] && continue
  [[ ${f} == *.editorconfig ]] && continue
  [[ ${f} == *.gitignore ]] && continue
  [[ ${f} == *README.md* ]] && continue
  [[ ${f} == *\.git/* ]] && continue
  [[ ${f} == *arm64* ]] && continue
  [[ ${f} == *x64* ]] && continue


  echo ${f}
  echo ${f##*/}

done < <(find ${DOT_DIRECTORY} -mindepth 1 \( -type l -o -type f \))

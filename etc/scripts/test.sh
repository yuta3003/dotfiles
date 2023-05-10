#!/bin/bash

set -eu

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

while read -r f; do

  [[ ${f} == *README.md* ]] && continue
  [[ ${f} == *\.git/* ]] && continue
  [[ ${f} == *.gitignore ]] && continue
  [[ ${f} == *.editorconfig ]] && continue
  [[ ${f} == *bash* ]] && continue
  [[ ${f} == *arm64* ]] && continue
  [[ ${f} == *x64* ]] && continue
  [[ ${f} == *Iterm2* ]] && continue
  [[ ${f} == *Alfred* ]] && continue
  [[ ${f} == *homebrew* ]] && continue
  [[ ${f} == *virtualbox* ]] && continue
  [[ ${f} == *vscode* ]] && continue
  [[ ${f} == *etc* ]] && continue
  echo "$f"

done < <(find ${DOT_DIRECTORY} -mindepth 1 \( -type l -o -type f \))

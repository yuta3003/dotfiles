#!/bin/bash

set -eu

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

for f in .??*
do
  echo ${f}
  [[ ${f} = "*README.md*" ]] && continue
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  [[ ${f} = ".editorconfig" ]] && continue
  [[ ${f} = "bash" ]] && continue
  [[ ${f} = "arm64" ]] && continue
  [[ ${f} = "x64" ]] && continue
  [[ ${f} = "Iterm2" ]] && continue
  [[ ${f} = "Alfred" ]] && continue
  [[ ${f} = "homebrew" ]] && continue
  [[ ${f} = "virtualbox" ]] && continue
  [[ ${f} = "vscode" ]] && continue
  [[ ${f} = "etc" ]] && continue

  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)

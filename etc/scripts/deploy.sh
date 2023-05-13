#!/bin/bash
set -eu


DOT_DIRECTORY="${HOME}/dotfiles"
SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"
DEPLOY_LIST_DIR="${DOT_DIRECTORY}/etc/deploylist"

main() {
  source ${SCRIPT_DIR}/create_arm64_link.sh
  deploy_to_home
  deploy_by_list
}

deploy_to_home() {
  # LIST
  #   - git
  #   - screen
  #   - tmux
  #   - vim
  #   - zsh

  while read -r f; do
    [[ ${f} == */Alfred* ]] && continue
    [[ ${f} == */bash* ]] && continue
    [[ ${f} == */etc* ]] && continue
    # [[ ${f} == */git* ]] && continue
    [[ ${f} == */git/ignore* ]] && continue
    [[ ${f} == */homebrew* ]] && continue
    [[ ${f} == */Iterm2* ]] && continue
    [[ ${f} == */neovim* ]] && continue
    # [[ ${f} == */screen* ]] && continue
    [[ ${f} == */ssh* ]] && continue
    [[ ${f} == */starship* ]] && continue
    # [[ ${f} == */tmux* ]] && continue
    # [[ ${f} == */vim* ]] && continue
    [[ ${f} == */virtualbox* ]] && continue
    [[ ${f} == */vscode* ]] && continue
    # [[ ${f} == */zsh* ]] && continue
    [[ ${f} == *\.editorconfig ]] && continue
    [[ ${f} == *\.gitignore ]] && continue
    [[ ${f} == *README.md* ]] && continue
    [[ ${f} == *\.git/* ]] && continue
    [[ ${f} == *arm64* ]] && continue
    [[ ${f} == *x64* ]] && continue

    ln -sf ${f} ${HOME}/${f##*/}
    echo "$(tput setaf 2)✔︎$(tput sgr0)~/${f##*/}"

  done < <(find ${DOT_DIRECTORY} -mindepth 1 \( -type l -o -type f \))
}

deploy_by_list() {
  __remove_deploylist_comment() {(
    sed \
      -e 's/\s*#.*//' \
      -e '/^\s*$/d' \
      $1
  )}

  tmp_file=$(mktemp)
  trap 'rm ${tmp_file}' 0

  # deploylist="${DEPLOY_LIST_DIR}/deploylist.Darwin.txt"
  deploylist="${DEPLOY_LIST_DIR}/deploylist.ubuntu.txt"

  if [ -f ${deploylist} ]; then
    __remove_deploylist_comment "${deploylist}" > ${tmp_file}
    while read line; do
      # ~ や環境変数を展開
      src=$(eval echo "$(cut -d ',' -f 1 <<<${line})")
      dst=$(eval echo "$(cut -d ',' -f 2 <<<${line})")

      dst_dir=${dst%/*}
      if [ ! -d ${dst_dir} ]; then
        mkdir -p ${dst_dir}
      fi

      ln -sf ${src} ${dst}
      echo "$(tput setaf 2)✔︎$(tput sgr0)~${dst#${HOME}}"

    done < ${tmp_file}
  else
    echo "No such file"
  fi
  return 0
}

main

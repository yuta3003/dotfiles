#!/bin/bash
set -eu


# DOT_DIRECTORY="${HOME}/dotfiles"
DOT_DIRECTORY="./../../"
SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"
MKLINK_SCRIPT_DIR="${SCRIPT_DIR}/mklink"
DEPLOY_LIST_DIR="${DOT_DIRECTORY}/etc/deploylist"
OS_TYPE=""

main() {
  check_os_type
  create_link
  common_deploy
  feature_deploy
}

check_mac_architecture() {
  if [ "$(uname -m)" == "x86_64" ] ; then
    OS_TYPE="OSX(x64)"
  elif [ "$(uname -m)" == "arm64" ] ; then
    OS_TYPE="OSX(arm64)"
  else
    echo "Unsupported Architecture"
    return 1
  fi
  return 0
}

check_linux_distribution() {
  if command -v apt-get &> /dev/null; then
    OS_TYPE="Ubuntu"
  elif command -v pacman &> /dev/null; then
    OS_TYPE="ArchLinux"
  else
    echo "Unsupported distribution"
    return 1
  fi
  return 0
}

check_os_type() {
  local os=$(uname -s)
  case "${os}" in
    Linux*)
      check_linux_distribution
      ;;
    Darwin*)
      check_mac_architecture
      ;;
    *)
      echo "Command failed."
      return 1
      ;;
  esac
  return 0
}

create_link() {
  case "${OS_TYPE}" in
    "OSX(x64)")
      echo "creating symlink for OSX(x64)"
      source ${MKLINK_SCRIPT_DIR}/mklink_x64.sh
      ;;
    "OSX(arm64)")
      echo "creating symlink for OSX(arm64)"
      source ${MKLINK_SCRIPT_DIR}/mklink_arm64.sh
      ;;
    "Ubuntu")
      echo "creating symlink for ubuntu"
      source ${MKLINK_SCRIPT_DIR}/mklink_ubuntu.sh
      ;;
    "ArchLinux")
      echo "creating symlink for Arch Linux"
      source ${MKLINK_SCRIPT_DIR}/mklink_archlinux.sh
      ;;
    *)
      echo "Unsupported OS type"
      return 1
      ;;
  esac
  return 0
}

common_deploy() {
  COMMON_DEPLOY_LIST="${DEPLOY_LIST_DIR}/deploylist.common.txt"

  __remove_deploylist_comment() {(
    sed \
      -e 's/\s*#.*//' \
      -e '/^\s*$/d' \
      $1
  )}

  tmp_file=$(mktemp)
  trap 'rm ${tmp_file}' 0

  if [ -f ${COMMON_DEPLOY_LIST} ]; then
    __remove_deploylist_comment "${COMMON_DEPLOY_LIST}" > ${tmp_file}
    while read line; do
      # ~ や環境変数を展開
      src=$(eval echo "$(cut -d ',' -f 1 <<<${line})")
      dst=$(eval echo "$(cut -d ',' -f 2 <<<${line})")

      dst_dir="${dst%/*}"
      # 空白を含むディレクトリの対応のためにダブルクウォーテーションを追加
      if [ ! -d "${dst_dir}" ]; then
        mkdir -p "${dst_dir}"
      fi
      if [ -d "${dst}" ] || [ -f "${dst}" ]; then
        rm -rf "${dst}"
      fi

      ln -sf "${src}" "${dst}"
      echo "$(tput setaf 2)✔︎$(tput sgr0)~${dst#${HOME}}"

    done < ${tmp_file}
  else
    echo "No such file"
  fi
  return 0
}

feature_deploy() {
  case "${OS_TYPE}" in
    "OSX(x64)")
      echo "feature deploy for OSX(x64)"
      deploylist="${DEPLOY_LIST_DIR}/deploylist.Darwin.txt"
      ;;
    "OSX(arm64)")
      echo "feature deploy for OSX(arm64)"
      deploylist="${DEPLOY_LIST_DIR}/deploylist.Darwin.txt"
      ;;
    "Ubuntu")
      echo "feature deploy for ubuntu"
      deploylist="${DEPLOY_LIST_DIR}/deploylist.ubuntu.txt"
      ;;
    "ArchLinux")
      echo "feature deploy for ArchLinux"
      deploylist="${DEPLOY_LIST_DIR}/deploylist.ubuntu.txt"
      ;;
    *)
      echo "Unsupported OS type"
      return 1
      ;;
  esac

  __remove_deploylist_comment() {(
    sed \
      -e 's/\s*#.*//' \
      -e '/^\s*$/d' \
      $1
  )}

  tmp_file=$(mktemp)
  trap 'rm ${tmp_file}' 0

  if [ -f ${deploylist} ]; then
    __remove_deploylist_comment "${deploylist}" > ${tmp_file}
    while read line; do
      # ~ や環境変数を展開
      src=$(eval echo "$(cut -d ',' -f 1 <<<${line})")
      dst=$(eval echo "$(cut -d ',' -f 2 <<<${line})")

      dst_dir="${dst%/*}"
      # 空白を含むディレクトリの対応のためにダブル区ウォーテーションを追加
      if [ ! -d "${dst_dir}" ]; then
        mkdir -p "${dst_dir}"
      fi

      if [ -d "${dst}" ] || [ -f "${dst}" ]; then
        rm -rf "${dst}"
      fi
      ln -sf "${src}" "${dst}"
      echo "$(tput setaf 2)✔︎$(tput sgr0)~${dst#${HOME}}"

    done < ${tmp_file}
  else
    echo "No such file"
  fi
  return 0
}

main

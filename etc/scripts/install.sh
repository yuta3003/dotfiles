#!/bin/bash
set -eu

CURRENT_DIR=$(cd $(dirname $0); pwd)
DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../..; pwd)
SCRIPT_DIR="${DOT_DIRECTORY}/etc/scripts"
MKLINK_SCRIPT_DIR="${SCRIPT_DIR}/mklink"
DEPLOY_LIST_DIR="${DOT_DIRECTORY}/etc/deploylist"
OS_TYPE=""

main() {
  check_os_type
  case "${OS_TYPE}" in
    "OSX(x64)")
      source ./install/install_osx_x64.sh
      ;;
    "OSX(arm64)")
      source ./install/install_osx_arm64.sh
      ;;
    "Ubuntu")
      source ./install/install_ubuntu.sh
      ;;
    "ArchLinux")
      ;;
    *)
      echo "Unsupported OS type"
      exit
      ;;
  esac
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

ask_yes_no() {
  while true; do
    echo -n "$* [y/n]: "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      [Nn]*)
        return 1
        ;;
      *)
        echo "yまたはnを入力してください"
        ;;
    esac
  done
}


main

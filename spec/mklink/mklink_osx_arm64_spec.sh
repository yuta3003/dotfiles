DOT_DIRECTORY=${HOME}/dotfiles

Describe "mklink_osx_arm64.sh"
  Include etc/scripts/mklink/mklink_osx_arm64.sh
  Before "setup"
  After "cleanup"

  setup() {
    cd ${DOT_DIRECTORY}/zsh
    DOT_DIRECTORY=${HOME}/dotfiles ${DOT_DIRECTORY}/etc/scripts/mklink/rmlink.sh
  }
  cleanup() {
    ${DOT_DIRECTORY}/etc/scripts/deploy.sh
  }
  It "mklink_osx_arm64"
    When call create_symlink zsh arm64/.zshrc
    The output should equal "$(tput setaf 2)✔︎$(tput sgr0) creating zsh/.zshrc"
  End
End

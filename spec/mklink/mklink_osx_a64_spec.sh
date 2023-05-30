Describe "mklink_osx_a64.sh"
  DOT_DIRECTORY=${HOME}/dotfiles
  Include etc/scripts/mklink/mklink_osx_a64.sh
  Before "setup"
  After "cleanup"

  setup() {
    cd ${DOT_DIRECTORY}/config/zsh
    DOT_DIRECTORY=${HOME}/dotfiles ${DOT_DIRECTORY}/etc/scripts/mklink/rmlink.sh -s
  }
  cleanup() {
    ${DOT_DIRECTORY}/etc/scripts/deploy.sh -s
  }
  It "mklink_osx_a64"
    When call create_symlink zsh a64/.zshrc
    The output should equal "$(tput setaf 2)✔︎$(tput sgr0) creating zsh/.zshrc"
  End
End

DOT_DIRECTORY=${HOME}/dotfiles

Describe "mklink_ubuntu.sh"
  Include etc/scripts/mklink/mklink_ubuntu.sh
  Before "setup"
  After "cleanup"

  setup() {
    cd ${DOT_DIRECTORY}/zsh
    DOT_DIRECTORY=${HOME}/dotfiles ${DOT_DIRECTORY}/etc/scripts/mklink/rmlink.sh
  }
  cleanup() {
    ${DOT_DIRECTORY}/etc/scripts/deploy.sh
  }
  It "mklink_ubuntu"
    When call create_symlink zsh ubuntu/.zshrc
    The output should equal "$(tput setaf 2)✔︎$(tput sgr0) creating zsh/.zshrc"
  End
End

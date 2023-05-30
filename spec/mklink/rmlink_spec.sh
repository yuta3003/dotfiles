Describe "rmlink.sh"
  DOT_DIRECTORY=${HOME}/dotfiles
  Include etc/scripts/mklink/rmlink.sh
  Before "setup"
  After "cleanup"

  setup() {
    ln -sf ${DOT_DIRECTORY}/config/zsh/x64/.zshrc ${DOT_DIRECTORY}/config/zsh/.zshrc
  }
  cleanup() {
    ${DOT_DIRECTORY}/etc/scripts/deploy.sh -s
  }
  It "remove_symlink()"
    When call remove_symlink ${DOT_DIRECTORY}/config/zsh/.zshrc
    The output should equal "$(tput setaf 2)✔︎$(tput sgr0) removing ${DOT_DIRECTORY}/config/zsh/.zshrc"
  End
End

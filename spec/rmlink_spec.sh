
DOT_DIRECTORY=${HOME}/dotfiles

Describe "rmlink.sh"
  Include etc/scripts/mklink/rmlink.sh
  Before "setup"
  After "cleanup"

  setup() {
    ln -sf ${DOT_DIRECTORY}/zsh/x64/.zshrc ${DOT_DIRECTORY}/zsh/.zshrc
  }
  cleanup() {}
  It "remove_symlink()"
    When call remove_symlink ${DOT_DIRECTORY}/zsh/.zshrc
    The output should equal "$(tput setaf 2)✔︎$(tput sgr0) removing ${DOT_DIRECTORY}/zsh/.zshrc"
  End
End

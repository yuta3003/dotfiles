
DOT_DIRECTORY=${HOME}/dotfiles

Describe "rmlink.sh"
  Include etc/scripts/mklink/rmlink.sh
  Before "setup"
  After "cleanup"

  setup() {
    echo "ln -sf ${DOT_DIRECTORY}/zsh/x64/.zshrc ${DOT_DIRECTORY}/zsh/.zshrc"
    ln -sf ${DOT_DIRECTORY}/zsh/x64/.zshrc ${DOT_DIRECTORY}/zsh/.zshrc
  }
  cleanup() {
    # if [ -f "${1}" ] || [ -d "${1}" ]; then
    if [ -f ${DOT_DIRECTORY}/zsh/.zshrc ]; then
      rm "${DOT_DIRECTORY}/zsh/.zshrc" && \
        echo "$(tput setaf 2)✔︎$(tput sgr0) removing ${1}"
    fi
  }
  It "remove_symlink()"
    echo "${DOT_DIRECTORY}/zsh/.zshrc"
    When call remove_symlink ${DOT_DIRECTORY}/zsh/.zshrc
    The output should equal "$(tput setaf 2)✔︎$(tput sgr0) removing ${DOT_DIRECTORY}/zsh/.zshrc"
  End
End

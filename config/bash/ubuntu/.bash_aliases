#################################################
#
#  BASIC Setting
#

#  Python3
alias python="python3"
alias pip="pip3"

#  rm系
#  for security
alias rm="rm -i"

#################################################
#
#  Dockernize Setting
#
#シングルクォーテーションだと実行時に変数展開され、ダブルクォーテーションだとシェルのログイン時に変数展開されるためシングルクォーテーション
alias terraform='docker run --rm -i -v $PWD:/work -w /work -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION hashicorp/terraform'
# alias jupyter='docker run --rm -p 8888:8888 -v $PWD:/work --name JupyterLab yuta0601/jupyter-lab:latest'

if type exa >/dev/null 2>&1; then
  alias e="exa --icons"
  alias ls="e"
  alias lst="exa --icons --tree"

  alias ll="exa -ahl --icons"

  alias ee='exa -aahl --icons'
  alias la=ee

  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
else
  alias la="ls -lhAG"
fi

# cd - ls after cd
alias cd="ls_after_cd"
ls_after_cd(){
  builtin cd $@ && ls;
}

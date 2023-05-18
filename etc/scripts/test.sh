
while (( $# > 0 ))
do
  case $1 in
    "-s" | "--silent")
      echo "silent mode"
      ;;
    -*)
      echo "invalid option"
      exit 1
      ;;
  esac
  shift
done

main() {
  parse_arguments
  echo "done"
}

parse_arguments() {
  while (( $# > 0 ))
  do
    case $1 in
      "-s" | "--silent")
        echo "silent mode"
        ;;
      -*)
        echo "invalid option"
        exit 1
        ;;
    esac
    shift
  done
}


# # echoをオフにする関数
# disable_echo() {
#   # 保存するためのディスクリプタを作成
#   exec 3>&1
#   # 標準出力を一時的に/dev/nullにリダイレクト
#   exec 1>/dev/null
# }

# # echoをオンにする関数
# enable_echo() {
#   # 標準出力を元のディスクリプタにリダイレクト
#   exec 1>&3
#   # ディスクリプタをクローズ
#   exec 3>&-
# }

echo ${1}

main

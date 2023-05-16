CURRENT_DIR=$(cd $(dirname $0); pwd)
DOT_DIRECTORY=$(cd ${CURRENT_DIR};cd ./../../..; pwd)

echo ${DOT_DIRECTORY}

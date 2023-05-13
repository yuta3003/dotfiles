if [ -d ~/Library/Application\ Support/Code/User ]; then
  echo "aru"
else
  mkdir -p ~/Library/Application\ Support/Code/User
  echo "nai"
fi

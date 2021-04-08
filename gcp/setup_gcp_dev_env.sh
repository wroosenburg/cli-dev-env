if [ "$CLOUD_SHELL" = true ] ; then
  mkdir -p $HOME/.cloudshell
  touch $HOME/.cloudshell/no-apt-get-warning

  sudo apt-get update
  sudo apt-get install -y zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

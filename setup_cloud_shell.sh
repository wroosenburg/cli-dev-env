if [ "$CLOUD_SHELL" = true ] ; then
  # we are inside GCP Cloud Shell, surpress empheral messages
  mkdir -p $HOME/.cloudshell
  touch $HOME/.cloudshell/no-apt-get-warning

  sh setup_cli_dev_env.sh
fi

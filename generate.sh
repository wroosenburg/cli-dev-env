#!/bin/bash

# Generates config files for setting up a CLI dev. environment
# Provides:
#  zsh (search/replace, better terminal)
#  oh-my-zsh (zsh improved)
#  vim with plugins (go/python,NERDTree etc.)
# Installation:
#  direct on CLI (Ubuntu / Debian etc.)
#  remote through Curl (Google Cloud Platform Cloud-Shell)

outputfile="${PWD}/cli/setup_cli_dev_env.sh"
gcpfile="${PWD}/gcp/setup_gcp_dev_env.sh"

function generate_cli_script () {
  rm -rf ${PWD}/cli/*
  echo "#!/bin/sh" >> ${outputfile}
  echo "" >> ${outputfile}
  for f in "${PWD}/src/*"
  do
      `cat $f >> ${outputfile}`
  done
  chmod +x ${outputfile}
}

function generate_gcp_script () {
  rm -rf ${PWD}/gcp/*
  echo 'if [ "$CLOUD_SHELL" = true ] ; then' >> ${gcpfile}
  echo '  mkdir -p $HOME/.cloudshell' >> ${gcpfile}
  echo '  touch $HOME/.cloudshell/no-apt-get-warning' >> ${gcpfile}
  echo '' >> ${gcpfile}
  for f in "${PWD}/src/*"
  do
      ff=(${f//"  "/});
      for i in ${ff[@]} 
      do
	src=`cat $i`
	echo "  ${src}" >> $gcpfile
      done
  done 
  echo 'fi' >> ${gcpfile}
  chmod +x ${gcpfile}
}

generate_cli_script
generate_gcp_script

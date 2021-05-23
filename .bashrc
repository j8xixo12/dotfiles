# ex: ts=2 sw=2 et filetype=bash

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LANG="en_US.UTF-8"
export TERM='xterm-256color'

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
. ~/.aliases
. ~/.bash_prompt

# Set PATH priority to Homebrew installation folder

# Terraform bash completion
if [ -x $(command -v terraform) ]; then
  complete -o nospace -C terraform tf
fi

if [ -d ~/.devenv ]; then
  source ~/.devenv/scripts/init
fi

if [[ -e /opt/local/bin/port ]]; then
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  # export DYLD_LIBRARY_PATH=/usr/lib:/opt/local/lib:$DYLD_LIBRARY_PATH
fi

# for intel mkl
if [ -e  /opt/intel ]; then
  export DYLD_LIBRARY_PATH=/opt/intel/oneapi/compiler/2021.1.1/mac/compiler/lib:$DYLD_LIBRARY_PATH
fi

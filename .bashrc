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
alias vim=/usr/local/bin/vim

if [ -d ~/.hack ]; then
  . ~/.hack/etc/init
fi

# for intel mkl 
export DYLD_LIBRARY_PATH=/opt/intel/oneapi/compiler/2021.1.1/mac/compiler/lib:$DYLD_LIBRARY_PATH

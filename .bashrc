# ex: ts=2 sw=2 et filetype=bash

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LANG="en_US.UTF-8"
export GPG_TTY=$(tty)
# export TERM='xterm-256color'
export PATH="$HOME/.local/bin:$PATH"
# Load the shell dotfiles, and then some:
. $HOME/.aliases
. $HOME/.bash_prompt

# Set PATH priority to Homebrew installation folder

# Terraform bash completion
if [ -x $(command -v terraform) ]; then
  complete -o nospace -C terraform tf
fi

if [ -d $HOME/.devenv ]; then
  source $HOME/.devenv/scripts/init
fi

if [[ -e /opt/local/bin/port ]]; then
  export PATH=/opt/local/bin:/opt/local/sbin:$PATH
  export DYLD_FALLBACK_LIBRARY_PATH=/usr/lib:/opt/local/lib:$DYLD_FALLBACK_LIBRARY_PATH
fi

if [[ -e /opt/homebrew ]]; then
  export PATH=/opt/homebrew/bin:/opt/local/sbin:$PATH
  export DYLD_FALLBACK_LIBRARY_PATH=/usr/lib:/opt/homebrew/lib
  # export LDFLAGS="-L/opt/homebrew/lib:$LDFLAGS"
  export CPPFLAGS="-I/opt/homebrew/include"
fi


# for intel mkl
if [ -e /opt/intel ]; then
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/intel/oneapi/compiler/2021.1.1/mac/compiler/lib:$DYLD_LIBRARY_PATH
fi

if [ -d $HOME/.cargo ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# * $HOME/.local_profile can be used for other settings you don’t want to commit.
if [ -f $HOME/.local_profile ]; then
  source $HOME/.local_profile
fi


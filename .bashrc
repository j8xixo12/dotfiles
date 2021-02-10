# ex: ts=2 sw=2 et filetype=bash

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="UTF-8"
export LANG="en_US.UTF-8"
export TERM='xterm-256color'

export PATH=$HOME/.local/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
. ~/.aliases
. ~/.bash_prompt

# Set PATH priority to Homebrew installation folder
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/Applications/ARM/bin:$PATH
export PATH=/opt/riscv/bin:$PATH

export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/Users/laijunxu/.local/bin:$PATH"

# Terraform bash completion
if [ -x $(command -v terraform) ]; then
  complete -o nospace -C terraform tf
fi


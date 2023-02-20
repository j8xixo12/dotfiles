# ex: ts=2 sw=2 et filetype=bash

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# bash-completion

if [ $(uname) == Darwin ]; then
  if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
      . /opt/local/etc/bash_completion
  fi

  if [ -f /opt/local/share/git/contrib/completion/git-completion.bash ]; then
    . /opt/local/share/git/contrib/completion/git-completion.bash
  fi
else
  if [ -f /usr/share/bash-completion/bash_completion ]; then
     . /usr/share/bash-completion/bash_completion
  fi
fi

if [ -f /etc/bashutils.sh ]; then
  source /etc/bashutils.sh
fi

# * $HOME/.local_profile can be used for other settings you don’t want to commit.
if [ -f $HOME/.local_profile ]; then
  source $HOME/.local_profile
fi

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'


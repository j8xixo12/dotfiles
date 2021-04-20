# ex: ts=2 sw=2 et filetype=bash

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
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
  if [ -f /etc/bash_completion ]; then
     . /etc/bash_completion
  fi
fi

if [ -f /etc/bashutils.sh ]; then
  source /etc/bashutils.sh
fi

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'


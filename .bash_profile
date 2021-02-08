# ex: ts=2 sw=2 et filetype=bash

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

if [ -f /etc/bashutils.sh ]; then
  source /etc/bashutils.sh
fi

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'

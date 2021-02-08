#!/usr/bin/env bash
CHROOT=${HOME}/.devenv/

if [ -z "$(type -t namemunge)" ] ; then

# path munge.
namemunge () {
  if ! echo ${!1} | egrep -q "(^|:)$2($|:)" ; then
    if [ -z "${!1}" ] ; then
      eval "$1=$2"
    else
      if [[ "$3" == "-a" || "$3" == "--after" ]] ; then
        eval "$1=\$$1:$2"
      else
        eval "$1=$2:\$$1"
      fi
    fi
  fi
  eval "export $1"
  # echo ${!1}
}
export -f namemunge

fi

# nameremove
if [ -z "$(type -t nameremove)" ] ; then

# see http://stackoverflow.com/a/370192/1805420
nameremove () {
  eval "export $1=$(echo -n ${!1} | awk -v RS=: -v ORS=: -v var="$2" '$0 != var' | sed 's/:*$//')"
}
export -f nameremove

fi # end nameremove

hackon_impl() {
  namemunge PATH $CHROOT/$1/bin
  if [ "$(uname)" == "Darwin" ] ; then
    namemunge DYLD_LIBRARY_PATH $CHROOT/$1/lib
  elif [ "$(uname)" == "Linux" ] ; then
    namemunge LD_LIBRARY_PATH $CHROOT/$1/lib
  fi
}
export -f hackon_impl

hackoff_impl() {
  nameremove PATH $CHROOT/$1/bin
  if [ "$(uname)" == "Darwin" ] ; then
    nameremove DYLD_LIBRARY_PATH $CHROOT/$1/lib
  elif [ "$(uname)" == "Linux" ] ; then
    nameremove LD_LIBRARY_PATH $CHROOT/$1/lib
  fi
}
export -f hackoff_impl

usage() {
  echo "Usage: devenv [command]"
  echo ""
  echo "Commands:"
  echo "  ls  - list available environments"
  echo "  off - deactivate devenv"
  echo "  add - create a new devenv"
  echo "  del - remove devenv"
  echo "  use - select a devenv to use"
}

devenv() {
  if [ "${1}" == "ls" ] ; then
    echo -e "available environment:\n$(ls ${CHROOT})"
    return
  elif [ "$1" == "off" ] ; then
    if [ -z "${DEVENV}" ] ; then
      return
    fi

    echo "devenv '${DEVENV}' to be turned off"
    _hackoff_impl ${DEVENV}
    eval "unset DEVENV"
    eval "unset DEVENV_ROOT"
    return
  elif [ "$1" == "add" ] ; then
    mkdir ${CHROOT}/${2}
  elif [ "$1" == "del" ] ; then
    rm -rf ${CHROOT}/${2}
    eval "unset DEVENV"
    eval "unset DEVENV_ROOT"
  elif [ "$1" == "use" ] ; then
    local devenv_root="${CHROOT}/${2}"

    if [ -d "${devenv_root}" ]; then
      echo "now using devenv '${2}'"
      hackon_impl ${2}
      eval "export DEVENV=${2}"
      eval "export DEVENV_ROOT=${devenv_root}"
    else
      echo "${devenv_root} doesn't exist"
    fi
  else
    usage
  fi
}


# vim: set et nu nobomb fenc=utf8 ft=sh ff=unix sw=2 ts=2:

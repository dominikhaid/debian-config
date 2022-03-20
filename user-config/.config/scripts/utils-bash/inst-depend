#!/bin/bash
#shopt -s nullglob dotglob
#SCRIPT_DEPEND=($(echo $@ | tr " " "\n"))

installDepend() {
for func in "${@}"; do
  if ! command -v $func &>/dev/null; 
  then sudo apt install -y $func;
  fi
done;

}

if ! [ -z $SCRIPT_DEPEND ]; then
installDepend ${SCRIPT_DEPEND[@]}
fi;

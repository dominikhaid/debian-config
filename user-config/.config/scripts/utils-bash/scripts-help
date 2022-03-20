#!/bin/bash
#shopt -s nullglob dotglob
SCRIPT_DEPEND=($(echo $@ | tr " " "\n"))


#NOTE TOOLS
if  [ -z "$__help" ];then
__help=$"NO DOCS"
fi

if [[ "${options[@]}" =~ "--help" ]]; then
    echo "$__help"
    exit
fi


#!/bin/bash
#shopt -s nullglob dotglob
SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
options=($(echo $@ | tr " " "\n"))

#NOTE TOOLS
__help=$"
Usage: $(basename $0) app [OPTIONS]
Options:
  --set                        Set permanent config
  --config                      Set run with config once
"
source $SCRIPTPATH/inst-depend
source $SCRIPTPATH/pick-file
source $SCRIPTPATH/scripts-help

LIST_DIR=~/.config/proxychains
COPY_DIR=/etc/proxychains4.conf
FILE_REGEX="*.conf"
SCRIPT_DEPEND=(proxychains4)
CMD_EXEC=proxychains4
PICKED_FILE=""

if [[ "${options[@]}" == "" ]]; then
    echo "$__help"
    exit
fi

if [[ "${options[@]}" =~ "--set" ]]; then
    installDepend ${SCRIPT_DEPEND[@]}
    LIST_FILES=()
    get_file_selection $LIST_DIR FILE_REGEX
    echo ""
    echo "SET PROXYCAINS CONFIG"
    sudo mv $COPY_DIR "$COPY_DIR.bak"
    sudo cp -r $PICKED_FILE $COPY_DIR 
    exit
fi

if [[ "${options[@]}" =~ "--config" ]]; then
    LIST_FILES=()
    get_file_selection $LIST_DIR FILE_REGEX
    echo ""
    echo "RUN WITH CONFIG"
    echo "$PICKED_FILE"
    TMP=$(echo ${options[@]} | sd '\-\-config' '')
    if [[ "$TMP" == "" ]]; then
        echo "no programm to run sepcified"
        exit
    fi
    $CMD_EXEC  $TMP -f $PICKED_FILE
    exit
fi

if  command -v ${options[@]} &>/dev/null;then 
    echo ""
    echo "RUN PROXYCHAINS4"
    $CMD_EXEC  ${options[@]}
    exit
fi

exit;

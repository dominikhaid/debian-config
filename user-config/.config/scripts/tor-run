#!/bin/bash
#shopt -s nullglob dotglob
SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
options=($(echo $@ | tr " " "\n"))

#curl https://freegeoip.app/xml/
#NOTE TOOLS
__help=$"
Usage: $(basename $0) app [OPTIONS]
Options:
"
source $SCRIPTPATH/inst-depend
source $SCRIPTPATH/pick-file
source $SCRIPTPATH/scripts-help

LIST_DIR=~/.config/proxychains
COPY_DIR=/etc/proxychains4.conf
FILE_REGEX="*.conf"
SCRIPT_DEPEND=(tor torsocks nyx torbrowser-launcher)
CMD_EXEC=torsocks
PICKED_FILE=""

if [[ "${options[@]}" == "--help" ]]; then
    echo "$__help"
    exit
fi

    installDepend ${SCRIPT_DEPEND[@]}

if  command -v ${options[@]} &>/dev/null;then 
    echo ""
    echo "RUN TORSOCKS"
    $CMD_EXEC  ${options[@]}
    exit
fi

exit;

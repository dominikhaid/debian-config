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
source $SCRIPTPATH/../utils-bash/inst-depend
source $SCRIPTPATH/../utils-bash/scripts-help
source $SCRIPTPATH/../utils-bash/get-input
source $SCRIPTPATH/../utils-bash/pip-detect

SCRIPT_DEPEND=(proxychains4 qbittorrent transmission-cli)
TARGETS=()
LIST_FILES=()
PICKED_FILE=""
CMD_EXEC="proxychains transmission-cli"

installDepend ${SCRIPT_DEPEND[@]}

if [[ "${options[@]}" == "--help" ]]; then
    echo "$__help"
    exit
fi

if ! command -v we-get &>/dev/null;then
      $PIP install https://github.com/rachmadaniHaryono/we-get/archive/dev.zip
fi

if  command -v we-get &>/dev/null;then
    TARGETS=($(we-get -G))
    get_input
fi

search_torrents() {
echo ""
echo "Enter a search term:"
read SEARCH_TERM
FILE_NAME=$(echo $SEARCH_TERM | sd '\s+?(\w)' '_$1')
TORRENT_DIR=$HOME/.config/torrents
SEARCH_DIR=$HOME/.config/torrents/$FILE_NAME
SAVED_TORRENTS=($(find $TORRENT_DIR -type d  -printf "%T@ %Tc %p\n" | sort -n))
SAVED_TORRENTS_LENGTH=$(find $TORRENT_DIR -type d | wc -l)
SAVED_TORRENTS_LENGTH=($SAVED_TORRENTS_LENGTH - 1)


declare -i CND=0
declare -i LINE=0
if [ $SAVED_TORRENTS_LENGTH -gt 19 ];then
while [ $CND -le 4 ]; do
    if [ $CND -eq 0 ];then
       LINE=7
    else
    LINE=$((($CND + 1)  * 7 + $CND))
    fi

    if [[ ${SAVED_TORRENTS[@]:$LINE:1} != $TORRENT_DIR ]];then
    rm -rf  ${SAVED_TORRENTS[@]:$LINE:1}
    fi
    CND+=1
done
fi


if ! [ -d "$SEARCH_DIR" ];then
    mkdir -p $SEARCH_DIR
fi

we-get --search "$SEARCH_TERM" --target "$TARGET" -J > $SEARCH_DIR/$FILE_NAME.json
cat $SEARCH_DIR/$FILE_NAME.json | sd '\{' '' | sd ',' '' | sd '\}' '\n' | sd '""' ' ' | sd '"' '' | sd '^\s+?(\w)' '$1' |sd '(.*):\s$' '\nname:\t$1' | sd ':\s' '\t' > $SEARCH_DIR/$FILE_NAME.tor
}

get_torrent_list() {
    TARGETS=()
    TARGETS=($(cat $SEARCH_DIR/$FILE_NAME.tor | sd 'name\t(.*)\n' '_%_$1%_%' | sd 'leeches\t(.*)\n' '' | sd 'link\t(.*)\n' 'LINK $1%_%' | sd 'seeds.*([0-9])\n' 'SEEDS $1%_%' | sd 'target\t(.*)' 'TARGET $1' | sd 'user_status.*' '' | sd '^\n' '' | sd '\s\s\s$' '' | sd '\s' '___' | sd '_%_' ' '))

    get_input
}

run_qbit() {
    $(exec $CMD_EXEC $(echo $TARGET | sd '.*?(magnet.*?)%_%.*' '$1') -w $HOME/Downloads)
}

search_torrents
get_torrent_list
run_qbit
exit;

#!/bin/bash
#shopt -s nullglob dotglob
SCRIPT_DEPEND=($(echo $@ | tr " " "\n"))


LIST_DIR=$1
FILE_REGEX=$2
LIST_FILES=()
declare -i PICKED_FILE_NR=0
PICKED_FILE=""


get_files() {
  for file in $(eval find $1 -type f -name "$FILE_REGEX");
  do
    LIST_FILES+=( $file)
  done;

}

list_files() {
  declare -i cnt=1
  for file in "${@}";
  do
    echo $file | sd '.*/(.*).conf' "( $cnt ) "'$1'
    cnt+=1
  done;
}

get_user_input() {
  echo ""
  echo "Input the number inside the brackets to pick a config"
  read PICKED_FILE_NR
  if [ -n "$PICKED_FILE_NR" ] && [ "$PICKED_FILE_NR" -eq "$PICKED_FILE_NR" ]; then
     PICKED_FILE_NR=$((PICKED_FILE_NR - 1));
     PICKED_FILE=${LIST_FILES[$PICKED_FILE_NR]}
  else
    echo "Something is wrong with your input!";
    exit;
  fi

  if ! [[ -f $PICKED_FILE ]]; then
     echo "File does not exist!";
     exit;
  fi;
}


get_file_selection() {
if [ -z $1 ] ||  [ -z $2 ]; then 
  echo "missing parameters"
  exit
fi;

if ! [ -d $1 ]; then
  echo "Parameter one must be a valid folder"
  exit
fi 
  get_files $LIST_DIR
  list_files ${LIST_FILES[@]}
  get_user_input
}

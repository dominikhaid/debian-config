#!/bin/bash

#sudo mount -t cifs //192.168.178.21/share /mnt credentials=/home/dominik/.smb,uid=0,,rw,nounix,iocharset=utf8,file_mode=0777,dir_mode=0777 0 0
# Read Password
printf "smb ip: "
read IP
printf "mount path: "
read MOUNT
printf "smb user: "
read USER
stty -echo
printf "smb password: "
read PASSWORD
stty echo
printf "\n"

sudo mount -t cifs -o username=${USER},password=${PASSWORD},uid=$(id -u),gid=$(id -g) "//$IP" $MOUNT

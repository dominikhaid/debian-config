#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

theme="slate_bottom"

dir="$HOME/.config/rofi/launchers/slate"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(($RANDOM % 20))]}"

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"

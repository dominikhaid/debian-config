#!/bin/bash

#                    ___ __
# .----.-----.-----.'  _|__|.-----. .--------.-----.-----.--.--.
# |  __|  _  |     |   _|  ||  _  | |        |  -__|     |  |  |
# |____|_____|__|__|__| |__||___  | |__|__|__|_____|__|__|_____|
#                           |_____|

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# Replace nvim with the editor of your choice

MYEDITOR="kitty -e nvim"

declare -A options
options[aliases]="$HOME/.aliases"
options[colors]="$HOME/.Xresources.d/colors"
options[neofetch]="$HOME/.config/neofetch/config.conf"
options[neovim]="$HOME/.config/nvim/init.vim"
options[picom]="$HOME/.config/picom/picom.conf"
options[qtile]="$HOME/.config/qtile/config.py"
options[qtile_autorun]="$HOME/.config/qtile/autostart.sh"
options[rofi]="$HOME/.config/rofi/config.rasi"
options[kitty]="$HOME/.config/kitty/kitty.conf"
options[vifm]="$HOME/.config/vifm/vifmrc"
options[vim]="$HOME/.vimrc"
options[xresources]="$HOME/.Xresources"
options[xterm]="$HOME/.Xresources.d/xterm"
options[zsh]="$HOME/.zshrc"

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -no-show-icons -no-sidebar-mode -line 10 -p "config")

# What to do when/if we choose a file to edit.
if [ "$choice" ]; then
	conf=$(printf '%s\n' "${options["${choice}"]}")
	$MYEDITOR "$conf"

# What to do if we just escape without choosing anything.
else
	echo "Program terminated." && exit 0
fi

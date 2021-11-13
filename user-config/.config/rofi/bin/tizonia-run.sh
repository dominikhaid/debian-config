#!/usr/bin/env bash

play_list() {
	local playlist=$(echo $1 | sed -r "s/\[.*\]\s(.*)/\1/")
	local client=$(echo $1 | sed -r "s/\[(.*)\].*/\1/")

	if [[ $1 == "Play " ]]; then
		kitty -e tizonia-remote play
	elif [[ $1 == "Pause " ]]; then
		kitty -e tizonia-remote pause
	elif [[ $1 == "Kill " ]]; then
		kitty -e tizonia-remote kill
	elif [[ $1 == "Next 怜" ]]; then
		kitty -e tizonia-remote next
	elif [[ $1 == "Prev 玲" ]]; then
		kitty -e tizonia-remote prev
	elif [ -z "$playlist" ] || [ -z "$client" ]; then
		echo "ERROR: No Playlist selected!"
	else
		exec_play=$(cat $HOME/.config/rofi/bin/tizonia-playlist.md | sed -E "s/(.*$playlist.*)|.*/\1/g" | sed "s/\[$client\]\s//")
		echo "$exec_play" | xclip -sel clip
		kitty &
		sleep 1 && xdotool key Super_L+t && xdotool key Control_L+Shift_L+v && xdotool key Return
	fi
}

all_playlists() {
	cat $HOME/.config/rofi/bin/tizonia-playlist.md | sed -r "s/(\[.*\])(\s.*)'UC.{23}(.*)'/\1 \3/" | sed -r "s/(\[.*\])(\s.*)'(.*)'/\1 \3/"
}

rofi_dmenu() {
	rofi -dmenu -matching fuzzy -i -no-custom -p "Select a playlist > " \
		-location 0 -bg "#F8F8FF" -fg "#000000" -hlbg "#ECECEC" -hlfg "#0366d6"
}

main() {
	playlist=$(all_playlists | rofi_dmenu)
	play_list "$playlist"
}

main

exit 0

# cat tunein.md | sed 's/\[YouTube\]//g' | sed 's/\[TuneIn\]//g'
# cat tunein.md | sed 's/\[YouTube\]//g' | sed 's/\[TuneIn\]//g' | head -1
# cat tunein.md | sed 's/\[YouTube\]//g' | sed 's/\[TuneIn\]//g' | shuf -n 1
#cat tunein.md | sed -r "s/(\[._\])(\s._)'UC.{23}(._)'/\3/g" | sed -r "s/(\[._\])(\s._)'(._)'/\3/g"

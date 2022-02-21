#! /bin/bash 

apps=($(find "$HOME/.config/autostart/"))

for app in "${apps[@]}"; do 
    if [[ $app =~ "autostart$" ]]; then 
        continue;
    elif [[ $app =~ ".desktop" ]]; then
        $(grep '^Exec' $app | tail -1 | sed 's/^Exec=//' | sed 's/%.//' \
| sed 's/^"//g' | sed 's/" *$//g') &
    else
        $app &
    fi
done


if [ -f  "$HOME/.cache/wal/colors" ]; then
  wal -R &
fi


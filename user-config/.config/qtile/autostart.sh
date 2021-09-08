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

#lxsession &
#picom --experimental-backend &
#xss-lock -- /home/dominik/.local/bin/screensaver &
#pasystray &
#cmst &
#lxpolkit & 
##nm-applet &
#blueman-applet &
system-config-printer-applet &
#gnome-keyring-daemon --start --components=pkcs11 &
#gnome-keyring-daemon --start --components=secrets &
#gnome-keyring-daemon --start --components=ssh &nome-keyring &
#gnome-settings-daemon & 
#nitrogen --restore &
if [ -f  "$HOME/.cache/wal/colors" ]; then
  wal -R &
fi
#set-wal &
#nextcloud &
#$HOME/.config/.screenlayout/screen-layout.sh &
#sysctl kernel.unprivileged_userns_clone=1q &
#setcap cap_net_bind_service=+ep `readlink -f \`which node\`` 
#systemctl start wpa_supplicant &
#xfce4-power-manager &
#rfkill unblock wlan 
#xclickroot -r xmenu/xmenu.sh &
#v4l2-ctl -v width=1920,height=1080,pixelformat=H264 &


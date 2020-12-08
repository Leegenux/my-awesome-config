#!/usr/bin/env bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep $1); then
     $@&
   fi
}

function run_with {}
   if (command -v $1 && ! pgrep $2); then
     $3
   fi
}

## run (only once) processes which spawn with different name
# if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep polkit-mate-aut) ; then
#     /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# fi

run_with 'gnome-keyring-daemon' 'gnome-keyring-d' 'gnome-keyring-daemon --daemonize --login'
run_with start-pulseaudio-x11 pulseaudio start-pulseaudio-x11
run_with xfce4-power-manager xfce4-power-man xfce4-power-manager 
run_with system-config-printer-applet applet.py system-config-printer-applet

run lxpolkit
run xfsettingsd
run xfce4-screensaver
run xfce4-volumed
run nm-applet
run xcape -e 'Super_L=Super_L|Control_L|Escape'
run thunar --daemon
run pasystray
run compton --shadow-exclude '!focused'
run blueman-applet
# run pa-applet
# run pamac-tray
# run msm_notifier

## The following are not included in minimal edition by default
## but autorun.sh will pick them up if you install them
run utools
run guake
run_with flatpak nextcloud 'flatpak run com.nextcloud.desktopclient.nextcloud'
run_with clash-linux-amd64 clash-linux-amd64 /home/leegenux/Applications/clash-linux-amd64
run_with bd-qimpanel.watchdog.sh bd-qimpanel.watchdog.sh /opt/apps/com.baidu.fcitx-baidupinyin/files/bin/bd-qimpanel.watchdog.sh
#!/usr/bin/env bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep -f $1); then
     $@&
   fi
}

function run_with {
   if (command -v $1 && ! pgrep -f $2); then
     $3
   fi
}

## run (only once) processes which spawn with different name
# if (command -v /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 && ! pgrep -f polkit-mate-aut) ; then
#     /usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
# fi

run_with gnome-keyring-daemon gnome-keyring-d 'gnome-keyring-daemon --daemonize --login'
run_with start-pulseaudio-x11 pulseaudio start-pulseaudio-x11
run_with xfce4-power-manager xfce4-power-man xfce4-power-manager 
run_with system-config-printer-applet applet.py system-config-printer-applet

run lxpolkit
run xfsettingsd
run xfce4-screensaver
run xfce4-volumed
run nm-applet
run xcape -e 'Super_L=Super_L|Control_L|Escape'
run pasystray
run compton --shadow-exclude '!focused'
run picom --shadow-exclude '!focused'
run blueman-applet
run keychain
run thunar --daemon
run pa-applet
run pamac-tray
# run picom
# run msm_notifier

## The following are not included in minimal edition by default
## but autorun.sh will pick them up if you install them
run utools
run guake
run_with file clash-linux-amd64 /home/leegenux/Applications/clash-linux-amd64
run http-server -p 8080 /home/leegenux/own_packages/clash-dashboard/dist
run_with flatpak nextcloud 'flatpak run com.nextcloud.desktopclient.nextcloud'
run_with file bd-qimpanel.watchdog.sh /opt/apps/com.baidu.fcitx-baidupinyin/files/bin/bd-qimpanel.watchdog.sh
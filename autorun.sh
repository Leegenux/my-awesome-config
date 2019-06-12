#!/bin/sh

if [ `pgrep electron-ssr | wc -l` -eq 0 ] ; then   # Make sure that the electron-ssr is under the $PATH
	electron-ssr &
fi

if [ `pgrep compton | wc -l` -eq 0 ] ; then   
	compton &
fi

if [ `pgrep flameshot | wc -l` -eq 0 ] ; then   
	flameshot &
fi

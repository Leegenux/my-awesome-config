#!/bin/sh

if [ `pgrep electron-ssr | wc -l` -eq 0 ] ; then   # Make sure that the electron-ssr is under the $PATH
	electron-ssr &
fi

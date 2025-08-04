#!/bin/sh
echo "Attempting to disable auto-sleep and remove sleepimage file from /private/var..."
echo ""
sudo pmset -a hibernatemode 0
sudo nvram "use-nvramrc?"=false
sudo rm -rfd /private/var/vm/sleepimage
echo "OK Success: Sleep and hibernate false, 0 - no safe sleepimage file."


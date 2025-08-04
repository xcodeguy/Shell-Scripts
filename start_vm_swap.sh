#!/bin/sh
echo "Attempting to enable auto-sleep..."
echo ""
sudo pmset -a hibernatemode 3
sudo nvram "use-nvramrc?"=true
echo "OK Success: Sleep and hibernate true, 3 -  safe sleepimage file should exist."
echo ""
ls -la /private/var/vm



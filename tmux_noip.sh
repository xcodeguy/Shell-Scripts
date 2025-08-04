#!/bin/sh
#sudo tail -f /private/tmp/com.noip.duc.daemon.stderr
tmux new-session 'htop' \; \
    split-window -h 'll' \; \
    split-window -h 'll'
    # \;
    # \
#    select-layout even-vertical
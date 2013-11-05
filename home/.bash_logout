#!/usr/bin/env bash
# /etc/bash.bash_logout: executed by bash(1) when login shell exits.

# if we have an ssh-agent process running, kill it


# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
  [ -x /usr/bin/clear ] && /usr/bin/clear
  [ -x /usr/bin/reset ] && /usr/bin/reset
fi

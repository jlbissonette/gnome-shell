#!/bin/sh

if [ -z $1 ]; then
  echo 'Usage: osk-preview.sh [--vertical|--horizontal] JSON_FILE'
  exit
fi

if [[ $1 = '--vertical' ]]; then
  export MUTTER_DEBUG_DUMMY_MODE_SPECS=768x1366
  FILE=$2
elif [[ $1 = '--horizontal' ]]; then
  export MUTTER_DEBUG_DUMMY_MODE_SPECS=1366x768
  FILE=$2
else
  FILE=$1
fi

GNOME_SHELL_TEST_OSK_FILE=`readlink -e $FILE`
export GNOME_SHELL_TEST_OSK_FILE
export NO_AT_BRIDGE=1

dbus-run-session -- gnome-shell --wayland --nested --mode=osk-preview

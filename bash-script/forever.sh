#!/bin/bash
# repo : https://github.com/mamunsyuhada/sd-assignments/blob/master/bash-script/forever.sh
OnRed='\033[41m'
OnGreen='\033[42m'
OnWhite='\033[47m'
OnYellow='\033[43m'
ColorOff='\033[0m'
LOCKFILE=tmp/foreverserver.lock
case "$1" in
  start)
    if [[ !(-f $LOCKFILE) ]]; then
      tmp/foreverserver &
      touch $LOCKFILE
      echo -e "${OnGreen}foreverserver is started${ColorOff}"
    else
      echo -e "${OnWhite}foreverserver is starting${ColorOff}"
    fi
    ;;
  stop)
    if [[ -f $LOCKFILE ]]; then
      kill $(cat /tmp/foreverserver.pid)
      rm -rf $LOCKFILE
      echo -e "${OnRed}foreverserver is stoped ....${ColorOff}"
    else
      echo -e "${OnWhite}foreverserver was stoped ....${ColorOff}"
    fi
    ;;
  *)
    echo -e "${OnYellow}Usage: $0 {start|stop}${ColorOff}"
    ;;
esac
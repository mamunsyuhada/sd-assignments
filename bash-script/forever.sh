#!/bin/bash
On_Red='\033[41m'
On_Green='\033[42m'
On_White='\033[47m'
On_Yellow='\033[43m'
Color_Off='\033[0m'

LOCKFILE=tmp/foreverserver.lock
killForever(){
  if [[ -f $LOCKFILE ]]; then
    kill $(cat /tmp/foreverserver.pid)
    rm -rf $LOCKFILE
    echo -e "${On_Red}foreverserver is stoped ....${Color_Off}"
  else
    echo -e "${On_White}foreverserver was stoped ....${Color_Off}"
  fi
}

case "$1" in
  start)
    killForever
    tmp/foreverserver &
    touch $LOCKFILE
    echo -e "${On_Green}foreverserver is starting with PID.... `cat /tmp/foreverserver.pid`${Color_Off}"
    ;;
  stop)
    killForever
    ;;
  *)
    echo -e "${On_Yellow}Usage: $0 {start|stop}${Color_Off}"
    ;;
esac

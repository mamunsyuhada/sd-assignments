# Bash Script | [Repo](https://github.com/mamunsyuhada/sd-assignments/edit/master/bash-script/README.md)

### Count File in a Directory
#### code

```sh
#!/bin/bash
# repo : https://github.com/mamunsyuhada/sd-assignments/blob/master/bash-script/countfiles.sh

result=""
mypath="`pwd`"
countFiles() {
  # https://stackoverflow.com/questions/18062778/how-to-hide-command-output-in-bash
  cd $1 &> /dev/null
  if [[ "$?" == "1" ]]; then
    echo "Usage: ./countfiles.sh <directory path> ....<directory path>"
    exit 1
  fi
  # https://devconnected.com/how-to-count-files-in-directory-on-linux/
  # -v = not match, "/" indicates a directory
  result+="$1 : `ls -p . | grep -v / | wc -l`"
  result+="\n"
  # back to first mypath
  cd $mypath &> /dev/null
}
for arg in "$@"
do
  countFiles "$arg"
done
printf "$result\r"
```

#### result
```sh
# ./countfiles.sh <directorytarget> ....<directorytarget>
bash countfiles.sh example/ ./ tmp/ img/
# example/ : 7
# ./ : 11
# tmp/ : 1
# img/ : 7
```

### Rename JPG Files with This Day Prefix

#### code
```sh
#!/bin/bash
# repo : https://github.com/mamunsyuhada/sd-assignments/blob/master/bash-script/countfiles.sh
THIS_DAY=`date +%Y%m%d`
for IMAGE in `ls *.jpg`
do
  # is jpg file generated in thisday ? 
  if [[ ${IMAGE:0:8} == THIS_DAY ]]; then
    continue
  fi

  RESULT=$THIS_DAY
  RESULT+="-$IMAGE"
  mv $IMAGE $RESULT
  printf "$IMAGE\t--->\t$RESULT\n\r"
done
```
#### result
```sh
bash renamejpg.sh
# backend.jpg     --->    20221217-backend.jpg
# interview.jpg   --->    20221217-interview.jpg
# lang.jpg        --->    20221217-lang.jpg
# meme.jpg        --->    20221217-meme.jpg
# memedev.jpg     --->    20221217-memedev.jpg
# proggamer.jpg   --->    20221217-proggamer.jpg
# programmer.jpg  --->    20221217-programmer.jpg
ls
# 20221217-backend.jpg    20221217-lang.jpg  20221217-memedev.jpg    20221217-programmer.jpg  example     img        renamejpg.sh
# 20221217-interview.jpg  20221217-meme.jpg  20221217-proggamer.jpg  countfiles.sh            forever.sh  README.md  tmp
```

### Start Stop Forever Server
#### code
```sh
#!/bin/bash
# repo : https://github.com/mamunsyuhada/sd-assignments/blob/master/bash-script/forever.sh

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
```
#### result
```sh
bash forever.sh start # start server
# foreverserver was stoped ....
# foreverserver is starting with PID.... 3626

bash forever.sh stop
# foreverserver is stoped ....
```

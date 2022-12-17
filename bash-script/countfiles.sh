#!/bin/bash
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
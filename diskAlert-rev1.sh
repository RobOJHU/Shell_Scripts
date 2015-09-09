#!/bin/sh
df -HPl | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 85 ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $usep%" rosteen@jhu.edu tstroup@jhu.edu sergey@jhu.edu ashar@jhu.edu jclavin2@jhu.edu jojha1@jhu.edu jpatel22@jhu.edu
  fi
done

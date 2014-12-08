#!/bin/bash

MYDATE=`TZ=MYT+16 date +%m-%d`
valid_host=$(hostname)
DIRECTORY="/root/YumDownLoader/$(date +'%m-%d-%Y')"

mkdir $DIRECTORY

cd $DIRECTORY

for PKG in `yum check-update | cut -d' ' -f1`; do
   yumdownloader --resolve $PKG
done

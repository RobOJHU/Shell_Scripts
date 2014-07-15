#!/bin/bash
MYDATE=`TZ=MYT+16 date +%m-%d`
valid_host=$(hostname)
DIRECTORY="/home/rosteen/.ssh"

if [ -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY exists.
echo "Got the /.ssh DIR ....  move on and ADD the authorized_key file"
echo $MYDATE
fi

if [ ! -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.

echo "the /.ssh DIR  ...does NOT exist --lets create it .. then  move on and ADD the authorized_key file"
mkdir "$DIRECTORY"
echo $MYDATE
fi

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAlm40Xye3S9qQpIPziB4yjX/XtvZeG4qYzlh6H2OilZGY9bgNDIWoHaEqBwL2QqPyVz4uKrC7nyDi5tXl4pO8YZXW+e1n55HxHwQvA4U/ipgJvQblEgYm51RxjfB7j6U9zrFNIGoOYT61nkNFSYPCkCCIdftRql+atgGFu/7dxyy+5Z4IsSGwQyxPlrN92/2I20bm9b+6Dw/S0UWZylDbpgu/u965IeATV3CPjc4YseMFj4jWtNyDUXp9bCiuU2jZH4wbfIJ4GkDTIvRJDyl4impdq5CojNoo0POmG6usI5gP2lDte6Q1whkqzdFABNHRk0A0UxtaQs62Bx3jJTrJ+w== root@daridsmp1.dev.jhu.edu" > "$DIRECTORY"/authorized_keys

#  Chown the new file
chown -R rosteen:root "$DIRECTORY"
#  Chmod  the new file
chmod  770 "$DIRECTORY"/authorized_keys

# Now lets SED the SUDOERS file
#sed '1,$s/\# \%wheel/%wheel/gp' /etc/sudoers2
sed -i '/## Same thing without a password/a%wheel  ALL=(ALL)       NOPASSWD: ALL'  /etc/sudoers

# and ADD wheel to rosteen group
usermod -a -G  wheel rosteen


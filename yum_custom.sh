#!/bin/sh

echo "Starting ..............."
echo $!
yum update -y --exclude=kernel* --exclude=php*  --exclude=oracle* --exclude=libgcj* --exclude=mysql*  --exclude=samba3x* --exclude=httpd* --exclude=mod_ssl* --exclude=libtdb*  --exclude=vmware*
echo "waiting ................"
wait $!
/sbin/shutdown -r now

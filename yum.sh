#!/bin/sh

yum update --exclude=kernel* --exclude=php*  --exclude=oracle* --exclude=libgcj* --exclude=mysql*  --exclude=samba3x* --exclude=httpd* --exclude=mod_ssl* --exclude=libtdb*  --exclude=autofs* --exclude=postgresql* --exclude=rhn* --exclude=389* --exclude=java*

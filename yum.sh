#!/bin/sh

yum update --exclude=kernel* --exclude=php*  --exclude=oracle* --exclude=libgcj* --exclude=mysql*  --exclude=samba3x* --exclude=httpd* --exclude=mod_ssl* --exclude=libtdb* 
kernel* php* autofs* oracle* libgcj* mysql* postgresql* *vmware libtdb* samba3x* httpd* mod_ssl* libtdb* --exclude=rhn* --exclude=389* --exclude=java*

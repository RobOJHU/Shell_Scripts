#!/bin/ksh
echo "Give me the USERS login name"
read loginname
# if there was a group --we wanted the user to be a member of --do it here
#usermod -a -G fjhm $loginname
# any way to CHECK here --RobO

getent passwd $loginname  > /dev/null
if [ $? -eq 0 ]; then
        echo "yes the user exists"
else
        echo "No, the user does not exist"
        exit
fi


id $loginname
setfacl -m g:$loginname:rwx /sftpdisk/ag_orders/Merkle/Fortis_Receipt_insert
setfacl -m g:$loginname:rwx /sftpdisk/ag_orders/Merkle
setfacl -m g:$loginname:r-x /sftpdisk/ag_orders
setfacl -m g:$loginname:--x /sftpdisk

getfacl /sftpdisk/ag_orders/Merkle/Fortis_Receipt_insert
getfacl /sftpdisk/ag_orders/Merkle
getfacl /sftpdisk/ag_orders
getfacl /sftpdisk

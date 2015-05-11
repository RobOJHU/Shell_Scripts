#!/bin/ksh
echo "Give me the USERS login name"
read loginname
id $loginname
setfacl -m g:$loginname:rwx /sftpdisk/ag_orders/Merkle/Fortis_Receipt_insert
setfacl -m g:$loginname:rwx /sftpdisk/ag_orders/Merkle
setfacl -m g:$loginname:r-x /sftpdisk/ag_orders
setfacl -m g:$loginname:--x /sftpdisk

getfacl /sftpdisk/ag_orders/Merkle/Fortis_Receipt_insert
getfacl /sftpdisk/ag_orders/Merkle
getfacl /sftpdisk/ag_orders
getfacl /sftpdisk

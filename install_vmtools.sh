#/bin/bash
# INSTALL VMtools
# Authored By: RobO
 mkdir /mnt/cdrom
 mount /dev/cdrom /mnt/cdrom
 cd /mnt/cdrom
 cp VMwareTools-9.4.10-2092844.tar.gz /root/.
 cd /root
 tar -xvf VMwareTools-9.4.10-2092844.tar.gz
 cd vmware-tools-distrib/
 echo "perl vmware-install.pl"

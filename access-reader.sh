#!/bin/sh
#
# The purpose of this script is to READ a log file --make it available to uesrs with out permission
# AND make it HUMAN READABLE
#
#
TD=`$DATE`
UPTIME="`uptime`" # Determine how long the system has been running
clear
echo ""
echo $UPTIME|
while read a b c d e f
do
echo "       As of $a the system has been up for $c days and $e hours"
echo ""
echo "          #########################################################"
echo "          ##############  HTTP ACCESS LOG FILE  ####################"
echo "          #########################################################"
echo "                   Last 20 lines of CURRENT ACCESS log"
echo ""
echo ""
#echo $SHOW
tail -20 /var/log/httpd/access_log
done

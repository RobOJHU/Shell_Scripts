#!/bin/sh
#
# The purpose of this script is to tell query which kernel
# is currently running on your system...
#
#
# Feb 25, 2004 by Ed Gurski (ed@gurski.com)
#
KERNEL="`uname -r`" # Get the name of the current kernel
UPTIME="`uptime`" # Determine how long the system has been running
RPM="`rpm -qa|grep kernel-2|sort`" # Show all installed kernels on this system
clear
echo ""
echo $UPTIME|
while read a b c d e f
do
echo "As of $a the system has been up for $c days and $e hours"
done

echo ""
echo "The running kernel is =====> $KERNEL"
echo ""
echo "The Kernels installed on this system are:"
echo "$RPM"
echo ""

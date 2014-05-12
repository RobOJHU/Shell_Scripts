#!/bin/bash
KERNEL="`uname -r`" # Get the name of the current kernel
UPTIME="`uptime`" # Determine how long the system has been running
RPM="`rpm -qa|grep kernel-2|sort`" # Show all installed kernels on this system
REDH="`cat /etc/redhat-release`" # Show the release version on this system
valid_host=$(hostname)
MYDATE=`TZ=MYT+16 date +%m-%d`




rm -f /tmp/email-file.txt
clear
echo "######################################"
echo "######    SERVER REPORT   ##############"
echo "######################################"
echo ""
displayhelp ()
{
    echo "Usage: server_report.sh"
    echo "       server_report.sh -v  (Displays version and exits)"
    echo "       server_report.sh -h  (Shows this message)"
}

displayversion ()
{
    echo "  Version 1.0.0, 4/29/2014, written by: RobO"
    echo "  Thank you for using this script. I hope you like it."
    echo "  If you have any improvements, please let me know!"
}

while getopts ":s:d:n:p:xvh" option; do
         case $option in
                 h)     displayhelp
                        exit 1
                        ;;
                 v)     displayversion
                        exit 1
                        ;;
                 \?)    echo "Invalid option: -$OPTARG" >&2
                        displayhelp
                        exit 1
                        ;;
         esac
done



                       echo "THIS host is $valid_host"
                        echo ""
                        echo "System uptime             =====> $UPTIME"
                        echo "The running kernel is     =====> $KERNEL"
##########  Anylyse the SELINUX stayus HERE ######
echo ""
echo "############## SELINUX ############# "
sestatus > /tmp/user-tmp.tmp
while read line
do

case $line in
*"enforcing"*)
echo $line
;;
*"enabled"*)
echo $line
;;
*"permiss"*)
echo $line
;;
*"disabled"*)
echo $line
;;
esac


done < /tmp/user-tmp.tmp
#  Clean up tmp file
rm -f /tmp/user-tmp.tmp

##########  Anylyse the hosts.allow status HERE ######
echo ""
echo "############## hosts.allow ############# "
while read line
do

case $line in
*"sshd:"*)
echo $line
;;
*"nrpe:"*)
echo $line
;;
esac
done < /etc/hosts.allow
#  Clean up tmp file
##########  Anylyse the hosts.deny status HERE ######
echo ""
echo "############## hosts.deny ############# "
echo ""
while read line
do

case $line in
*"ALL : ALL"*)
echo $line
;;
*"none"*)
echo $line
;;
esac
done < /etc/hosts.deny
#  Clean up tmp file

netstat -paln > /tmp/user-tmp2.tmp
##########  Anylyse the  SSHD port number  HERE ######
echo "############## SSH port numbers ############# "
echo ""
while read line
do

case $line in
*"ssh"*)
echo $line
;;
*"none"*)
echo $line
;;
esac

done < /tmp/user-tmp2.tmp
#  Clean up tmp file
rm -f /tmp/user-tmp2.tmp

##########  Anylyse ETH0  HERE ######
echo ""
echo "############## EtherNET cards ############# "
ip -f inet addr

##########  Anylyse USERS  HERE ######
echo ""
echo "############## USERS ############# "
w

free -m > /tmp/user-tmp3.tmp
##########  Anylyse MEMORY  HERE ######
echo ""
echo "##############   MEMORY in MEGA Bytes  ############# "

while read line
do

case $line in
*"Mem"*)
echo $line
;;
*"none"*)
echo $line
;;
esac
done < /tmp/user-tmp3.tmp

##########  AnylyseCPU usage ######
echo ""
echo "##############   CPU Usage  ############# "
mpstat

##########  CHECK IP tables use the $? which evalutate the last VAR set -- very cool ######
echo ""
echo "##############   IPTABLES  ############# "
/sbin/service iptables status >/dev/null 2>&1
if [ $? = 0 ]; then
    echo "All systems go. -- iptables is RUNNING"
else
    echo "Houston, we have a problem. -- iptables is NOT Running"
fi


                echo " "
                EL6UEKR3="el6uek"
                EL5UEK="el5uek"
                EL5="el5"
                # if you single quote your input, you could do this
                # searchString=$1
                # Is this lazy evaluation ?  -- RobO

                case $KERNEL  in
                  # match EL6R3
                  *"$EL6UEKR3"*) echo "THIS is a UEK OL 6 Kernel up to the RELEASE 3 version"


                        echo "************** OL 6 **************"
                        echo "Plugins:  "
                         ll /etc/yum/pluginconf.d/
                        echo ""
                        echo "**************  YUM INFO **************"
                        echo "REPOs  "
                         ll /etc/yum.repos.d/*.repo
                        echo "####### The latest REPO Group is  --OL6-base.repo & OL6-UEKR3.repo"
                        ;;
                  # match UEK OL5
                  *"$EL5UEK"*) echo "THIS is UEK OL5 highest we take an OL5 Kernel"

echo "Release    : 400.214.5.el5uek --- is the latest OL5 Kernel Im aware of"
                        echo ""
                        echo "**************  OL 5 **************"
                        echo "Plugins:  "
                         ll /etc/yum/pluginconf.d/
                        echo ""
                        echo "**************  YUM INFO **************"
                        echo "REPOs  "
                         ll /etc/yum.repos.d/
                        echo "####### The latest REPO Group is  --OL5-base.repo & OL5-UEK.repo"
                        ;;
                  # match OLD OL5
                  *"$EL5"*) echo "THIS is UEK OL5  BUT the old OL5 Kernel"

echo "Release    : 400.214.5.el5uek --- is the latest OL5 Kernel Im aware of"
                        echo ""
                        echo "**************  OL 5 Kernel needs update **************"
                        echo "Plugins:  "
                         ll /etc/yum/pluginconf.d/
                        echo ""
                        echo "**************  YUM INFO **************"
                        echo "REPOs  "
                         ll /etc/yum.repos.d/
                        echo "####### The latest REPO Group SHOULD be  --OL5-base.repo & OL5-UEK.repo"
                        ;;
                  *) echo "I Dont know what Kernel it is"
                        ;;
                esac


echo ""

                        if [[ $KERNEL -eq 0 ]]
                                then    echo "BASH Profile not UPDATED: Moving old script out -- NEW one in"
                                        #tail -8 /root/.bash_profile
                                        mv /root/.bash_profile /root/.bash_profile$MYDATE
                                        wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/BASHRC-BASH-profiles/master/.bash_profile
                        fi
                        echo "The BOOT sequence has `lk` as the named kernel"
                        if [[ `alias | grep getno | wc -l` -eq 0 ]]
                                then    echo "BASH Profile not UPDATED: Moving old script out -- NEW one in"
                                        #tail -8 /root/.bash_profile
                                        mv /root/.bash_profile /root/.bash_profile$MYDATE
                                        wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/BASHRC-BASH-profiles/master/.bash_profile
                        fi
                        if [[ ! -f /root/cmd-A.txt ]]
                                then    echo "CMD A does not exist ... downloading it for you from GITHUB"
                                wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CMD-line-text-files/master/cmd-A.txt
                        fi
                        if [[ ! -f /root/cmd-K.txt ]]
                                then    echo "CMD K does not exist ... downloading it for you from GITHUB"
                                wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CMD-line-text-files/master/cmd-K.txt
                        fi
                        if [[ ! -f /root/cmd-N.txt ]]
                                then    echo "CMD N does not exist ... downloading it for you from GITHUB"
                                wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CMD-line-text-files/master/cmd-N.txt
                        fi





echo ""


echo "WE ARE ...................DONE

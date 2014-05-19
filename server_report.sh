#!/bin/bash
KERNEL="`uname -r`" # Get the name of the current kernel
UPTIME="`uptime`" # Determine how long the system has been running
RPM="`rpm -qa|grep kernel-2|sort`" # Show all installed kernels on this system
REDH="`cat /etc/redhat-release`" # Show the release version on this system
valid_host=$(hostname)
MYDATE=`TZ=MYT+16 date +%m-%d`




rm -f /tmp/email-file.txt
clear
echo "######################################" > /tmp/email-file.txt
echo "######    SERVER REPORT   ##############" >> /tmp/email-file.txt
echo "######################################" >> /tmp/email-file.txt
echo "" >> /tmp/email-file.txt
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










                        echo "THIS host is $valid_host" >> /tmp/email-file.txt
                        echo ""  >> /tmp/email-file.txt
                        echo "System uptime             =====> $UPTIME" >> /tmp/email-file.txt
                        echo "The running kernel is     =====> $KERNEL" >> /tmp/email-file.txt
##########  Anylyse the SELINUX stayus HERE ######
echo ""
echo "############## SELINUX ############# " >> /tmp/email-file.txt
sestatus >> /tmp/user-tmp.tmp
while read line
do

case $line in
*"enforcing"*)
echo $line >> /tmp/email-file.txt
;;
*"enabled"*)
echo $line >> /tmp/email-file.txt
;;
*"permiss"*)
echo $line >> /tmp/email-file.txt
;;
*"disabled"*)
echo $line >> /tmp/email-file.txt
;;
esac


done < /tmp/user-tmp.tmp
#  Clean up tmp file
rm -f /tmp/user-tmp.tmp

##########  Anylyse the hosts.allow status HERE ######
echo "" >> /tmp/email-file.txt
echo "############## hosts.allow ############# " >> /tmp/email-file.txt
while read line
do

case $line in
*"sshd:"*)
echo $line >> /tmp/email-file.txt
;;
*"nrpe:"*)
echo $line >> /tmp/email-file.txt
;;
esac
done < /etc/hosts.allow
#  Clean up tmp file
##########  Anylyse the hosts.deny status HERE ######
echo "" >> /tmp/email-file.txt
echo "############## hosts.deny ############# " >> /tmp/email-file.txt
echo "" >> /tmp/email-file.txt
while read line
do

case $line in
*"ALL : ALL"*)
echo $line >> /tmp/email-file.txt
;;
*"none"*)
echo $line >> /tmp/email-file.txt
;;
esac
done < /etc/hosts.deny
#  Clean up tmp file

netstat -paln > /tmp/user-tmp2.tmp
############ look at the resol.conf file --telss use where the DNS servers are
echo " ###############  DNS servers   --named in the resolv.conf file  ###########################" >> /tmp/email-file.txt
cat /etc/resolv.conf >> /tmp/email-file.txt






##########  Anylyse the  SSHD port number  HERE ######
echo "############## SSH port numbers ############# " >> /tmp/email-file.txt
echo "" >> /tmp/email-file.txt
while read line
do

case $line in
*"ssh"*)
echo $line >> /tmp/email-file.txt
;;
*"none"*)
echo $line >> /tmp/email-file.txt
;;
esac

done < /tmp/user-tmp2.tmp
#  Clean up tmp file
rm -f /tmp/user-tmp2.tmp

##########  Anylyse ETH0  HERE ######
echo "" >> /tmp/email-file.txt
echo "############## EtherNET cards ############# " >> /tmp/email-file.txt
ip -f inet addr >> /tmp/email-file.txt

##########  Anylyse USERS  HERE ######
echo "" >> /tmp/email-file.txt
echo "############## USERS ############# " >> /tmp/email-file.txt
w >> /tmp/email-file.txt

free -m > /tmp/user-tmp3.tmp
##########  Anylyse MEMORY  HERE ######
echo "" >> /tmp/email-file.txt
echo "##############   MEMORY in MEGA Bytes  ############# " >> /tmp/email-file.txt

while read line
do

case $line in
*"Mem"*)
echo $line >> /tmp/email-file.txt
;;
*"none"*)
echo $line >> /tmp/email-file.txt
;;
esac
done < /tmp/user-tmp3.tmp

##########  AnylyseCPU usage ######
echo "" >> /tmp/email-file.txt
echo "##############   CPU Usage  ############# " >> /tmp/email-file.txt
mpstat >> /tmp/email-file.txt

##########  CHECK IP tables use the $? which evalutate the last VAR set -- very cool ######
echo "" >> /tmp/email-file.txt
echo "##############   IPTABLES  ############# " >> /tmp/email-file.txt
/sbin/service iptables status >/dev/null 2>&1
if [ $? = 0 ]; then
    echo "All systems go. -- iptables is RUNNING" >> /tmp/email-file.txt
else
    echo "Houston, we have a problem. -- iptables is NOT Running" >> /tmp/email-file.txt
fi


                echo " " >> /tmp/email-file.txt
                EL6UEKR3="el6uek" >> /tmp/email-file.txt
                EL5UEK="el5uek" >> /tmp/email-file.txt
                EL5="el5"
                # if you single quote your input, you could do this
                # searchString=$1
                # Is this lazy evaluation ?  -- RobO

                case $KERNEL  in
                  # match EL6R3
                  *"$EL6UEKR3"*) echo "THIS is a UEK OL 6 Kernel up to the RELEASE 3 version"  >> /tmp/email-file.txt


                        echo "************** OL 6 **************" >> /tmp/email-file.txt
                        echo "Plugins:  " >> /tmp/email-file.txt
                         ll /etc/yum/pluginconf.d/ >> /tmp/email-file.txt
                        echo "" >> /tmp/email-file.txt
                        echo "**************  YUM INFO **************" >> /tmp/email-file.txt
                        echo "REPOs  " >> /tmp/email-file.txt
                         ll /etc/yum.repos.d/*.repo >> /tmp/email-file.txt
                        echo "####### The latest REPO Group is  --OL6-base.repo & OL6-UEKR3.repo" >> /tmp/email-file.txt
                        ;;
                  # match UEK OL5
                  *"$EL5UEK"*) echo "THIS is UEK OL5 highest we take an OL5 Kernel"  >> /tmp/email-file.txt

echo "Release    : 400.214.5.el5uek --- is the latest OL5 Kernel Im aware of" >> /tmp/email-file.txt
                        echo "" >> /tmp/email-file.txt
                        echo "**************  OL 5 **************" >> /tmp/email-file.txt
                        echo "Plugins:  " >> /tmp/email-file.txt
                         ll /etc/yum/pluginconf.d/ >> /tmp/email-file.txt
                        echo "" >> /tmp/email-file.txt
                        echo "**************  YUM INFO **************" >> /tmp/email-file.txt
                        echo "REPOs  " >> /tmp/email-file.txt
                         ll /etc/yum.repos.d/ >> /tmp/email-file.txt
                        echo "####### The latest REPO Group is  --OL5-base.repo & OL5-UEK.repo" >> /tmp/email-file.txt
                        ;;
                  # match OLD OL5
                  *"$EL5"*) echo "THIS is UEK OL5  BUT the old OL5 Kernel"  >> /tmp/email-file.txt

echo "Release    : 400.214.5.el5uek --- is the latest OL5 Kernel Im aware of" >> /tmp/email-file.tx
                        echo "" >> /tmp/email-file.txt
                        echo "**************  OL 5 Kernel needs update **************" >> /tmp/email-file.txt
                        echo "Plugins:  " >> /tmp/email-file.txt
                         ll /etc/yum/pluginconf.d/ >> /tmp/email-file.txt
                        echo "" >> /tmp/email-file.txt
                        echo "**************  YUM INFO **************" >> /tmp/email-file.txt
                        echo "REPOs  " >> /tmp/email-file.txt
                         ll /etc/yum.repos.d/ >> /tmp/email-file.txt
                        echo "####### The latest REPO Group SHOULD be  --OL5-base.repo & OL5-UEK.repo" >> /tmp/email-file.txt
                        ;;
                  *) echo "I Dont know what Kernel it is"  >> /tmp/email-file.txt
                        ;;
                esac


echo "" >> /tmp/email-file.txt

                        if [[ $KERNEL -eq 0 ]]
                                then    echo "BASH Profile not UPDATED: Moving old script out -- NEW one in" >> /tmp/email-file.txt
                                        #tail -8 /root/.bash_profile
                                        mv /root/.bash_profile /root/.bash_profile$MYDATE
                                        wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/BASHRC-BASH-profiles/master/.bash_profile
                        fi
                        echo "The BOOT sequence has `lk` as the named kernel"  >> /tmp/email-file.txt
                        if [[ `alias | grep getno | wc -l` -eq 0 ]]
                                then    echo "BASH Profile not UPDATED: Moving old script out -- NEW one in" >> /tmp/email-file.txt
                                        #tail -8 /root/.bash_profile
                                        mv /root/.bash_profile /root/.bash_profile$MYDATE
                                        wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/BASHRC-BASH-profiles/master/.bash_profile
                        fi
                        if [[ ! -f /root/cmd-A.txt ]]
                                then    echo "CMD A does not exist ... downloading it for you from GITHUB" >> /tmp/email-file.txt
                                wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CMD-line-text-files/master/cmd-A.txt
                        fi
                        if [[ ! -f /root/cmd-K.txt ]]
                                then    echo "CMD K does not exist ... downloading it for you from GITHUB" >> /tmp/email-file.txt
                                wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CMD-line-text-files/master/cmd-K.txt
                        fi
                        if [[ ! -f /root/cmd-N.txt ]]
                                then    echo "CMD N does not exist ... downloading it for you from GITHUB" >> /tmp/email-file.txt
                                wget -c --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CMD-line-text-files/master/cmd-N.txt
                        fi





echo "" >> /tmp/email-file.txt


echo "WE ARE ...................DONE" >> /tmp/email-file.txt
mail -s "SERVER $valid_host REPORT" rosteen@jhu.edu < /tmp/email-file.txt


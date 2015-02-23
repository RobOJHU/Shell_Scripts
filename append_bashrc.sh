#!/bin/bash
#Filename: append_basrc.sh
#Description: APPEND the excisting /etc/bashrc
echo "


HISTSIZE=2500
HISTTIMEFORMAT="%m/%d  "


# MORE alise --got from STBROWN github.com
alias sudo='PATH=$PATH:/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin /usr/bin/sudo'
alias gti='git '
alias rm='rm -i'
alias cx='clear'
alias c='clear'
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
 ## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias top='top -c'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
 # install  colordiff package :)
#alias diff='colordiff'
# handy short cuts #
alias h='history'
alias ss='sestatus'
alias j='jobs -l'
# Do not wait interval 1 second, go fast #
alias ping='ping -c 20 -s.2'
alias ports='netstat -tulanp'
alias cp='cp -i'
alias mv='mv -i'
alias l.='ls -d .* --color=tty'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
alias control='echo /usr/sbin/apachectl'
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist
#25: Get system memory, cpu usage, and gpu memory info quickly
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

## this one saved by butt so many times ##
alias wget='wget -c'

alias ll='ls -l --color=tty'
alias ls='ls -F --color=tty'
alias allcron='sudo cut -d: -f1 /etc/passwd | grep -vE "#" | while read user; do echo -e "\nCrontab for $user:"; sudo crontab -u$user -li; done'
alias d8='date --iso-8601'
alias hh='cd $HOME'
alias d8h='date --iso-8601=hour'
alias d8m='date --iso-8601=minute'
alias d8s='date --iso-8601=second'
alias d8t='date +%FT%T'
alias d8ts='date +%FT%T | sed "s/:/-/g"'
alias histl='history | less'
alias hist='history'
alias hg='history | grep '
alias cdv='cd /var/www/html'
alias cdl='cd /var/log'
alias cdr='cd /etc/yum.repos.d'
alias getrepos='ll -liah /etc/yum.repos.d'
alias gr='ll -liah /etc/yum.repos.d'
alias cdw='cd /var/www/html'
alias cdd='cd /etc/init.d'

alias obj='cd /etc/nagios/objectsNEW/'
alias plug='cd /usr/lib64/nagios/plugins/'
alias getno='wget -c --no-check-certificate'

alias httpdconf='vim /etc/httpd/conf/httpd.conf'
alias httpdbin='cd /usr/sbin/httpd/'
alias alist='alias'
alias motd='cat /etc/motd'
alias cy='cat /etc/yum.conf'
alias lss='pwd & ls -liAh'
alias cdd='cd $1 & ls -liAh'
alias yx='yum --disableexclude=main'
hubc() { wget --no-check-certificate https://raw.githubusercontent.com/RobOJHU/CONFIGURATION/master/"$@"  ; }
hubb() { wget --no-check-certificate https://raw.githubusercontent.com/RobOJHU/BASHRC-BASH-profiles/master/"$@"  ; }
hubs() { wget --no-check-certificate https://raw.githubusercontent.com/RobOJHU/Shell_Scripts/master/"$@"  ; }
alias dumax='du --max-depth=1 -h'
alias lk='ls -t /boot/vmlinuz-* | sed "s/\/boot\/vmlinuz-//g" | head -n1'

alias yumup='yum-complete-transaction;yum -y update;yx -y install kernel-uek;yum clean all;package-cleanup --oldkernels --count=2'
" >> /etc/bashrc

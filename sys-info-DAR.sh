#!/bin/sh

 # (c) Paul Buetow -- additinal reporting by RobO

 gawk -F: '
   function say ( str ) {
     gsub(/ +/, " ", str)
     printf "%s\n", str
   }

   BEGIN {
     say( "cpuinfo (c) 2010 Paul Buetow --- this REV updated by RobO" )
     say()
   }
   BEGIN {
     say( " +++++++++++++++++  RELEASE & Kernel info  +++++++++++++++++" )
     say()
   }
 '
cat /etc/redhat-release

KERNEL="`uname -r`" # Get the name of the current kernel
UPTIME="`uptime`" # Determine how long the system has been running
RPM="`rpm -qa|grep kernel-2|sort`" # Show all installed kernels on this system
echo ""
echo $UPTIME|
while read a b c d e f
do
echo "As of $a the system has been up for $c days and $e hours"
done
echo "The running kernel is =====> $KERNEL"
 gawk -F: '
   function say ( str ) {
     gsub(/ +/, " ", str)
     printf "%s\n", str
   }

   # Newer versions of GAWK can use the built in length function instead
   function alength ( arr ) {
       len = 0
     for (var in arr)
          len++
     return len
   }

   function alength_min_1 ( arr ) {
        len = alength(arr)
     return len ? len : 1
   }

   BEGIN {
     say( "\n +++++++++++++++++  CPU info  +++++++++++++++++" )
     say()
   }

   $1 ~ /^core id/ { core_id[$2]++ }
   $1 ~ /^physical id/ { physical_id[$2]++ }
   $1 ~ /^processor/ { count["processor"]++ }

   {
     key = $1
     gsub(/[ \t]+/, "", key)
     info[key] = $2
   }

   END {
     ht = info["siblings"] != alength(core_id)
     physical_cpus = alength(physical_id) ? alength(physical_id) : 1


     say( info["modelname"] " " info["vendor_id"] " " info["cachesize"] " cache")
     say()

     say( sprintf("%s = %.3d %s", "p", physical_cpus, "Physical processors") )
     say( sprintf("%s = %.3d %s", "c", alength(core_id), "Cores @ each physical processor" ) )
     say( sprintf("%s = %.3d %s", "s", info["siblings"], "Siblings (Hyper-Threading enabled if s != c)") )
     say( sprintf("%s = %.3d [v = p*c*(s != c ? 2 : 1)] %s", "v", count["processor"], "Total processors (including virtual)") )
     say( " Hyper-Threading is " ( ht ? "enabled" : "disabled" ) )
     say()

     if ( alength(core_id) )
       say( sprintf("%.7d %s", info["cpuMHz"], "MHz each core") )

     say( sprintf("%.7d %s", info["cpuMHz"] * alength_min_1(core_id) * physical_cpus, "MHz total") )

     if ( count["processor"] > 1 )
       say( sprintf("%.7d %s", info["bogomips"], "Estimate of CPU speed each processor (including virtual)") )

     say( sprintf("%.7d %s", info["bogomips"] * alength_min_1(core_id) * physical_cpus, "Estimated total CPU speed") )
     say()
   }


' /proc/cpuinfo

gawk -F: '
   function say ( str ) {
     gsub(/ +/, " ", str)
     printf "%s\n", str
   }
   BEGIN {
     say( " +++++++++++++++++  Memory info in MB +++++++++++++++++" )
     say()
   }
'
free -mt

gawk -F: '
   function say ( str ) {
     gsub(/ +/, " ", str)
     printf "%s\n", str
   }
   BEGIN {
     say( " +++++++++++++++++  HARDWARE Report +++++++++++++++++" )
     say()
   }
'
lspci -v

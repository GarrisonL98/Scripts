#!/bin/bash

#Check if script was run as root. Exit if false.
if [ $UID -ne 0 ]
then 
 echo "Please run this script with sudo."
 exit
fi

#Define Variables 
output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777 2> /dev/null)

# Check for research directory. Create it if needed.
if [ ! -d $HOME/research ]
then
 mkdir $HOME/research
fi

# Check for output file. Clear it if needed.
if [ -f $output ]
then
 > $output
 fi
echo "A Quick system Audit Script." >>$output
date >> $output
echo "" >> $output
echo "Machine Type info:" >> $output
echo $MACHTYPE >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n" >> $output
echo "Hostname: $(hostname -s)" >> $output
echo -e "\n777 Files:" >> ~/research/sys_info.txt >> $output
find / -type f -perm 777 >> ~/research/sys_info.txt >> $output
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt >> $output
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> $output

# handy dandy loops
echo -e "\n Permissions for etc/ files: \n" >> $output
files=('etc/passwd' 'etc/shadow')

for file in ${files[@]}
do
	ls -l $file >> $output
done

# Display CPU usage
echo -e "\nCPU Info:" >> $output
df -H | head -2 >> $output
lscpu | grep CPU >> $output

# Display Disk Usage
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output

# Display the current user
echo -e "\nCurrent user login information: \n $(who -a) \n" >> $output

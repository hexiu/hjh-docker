#!/bin/bash
#

#filepath="/etc/yum.repos.d/"

#for i in `ls $filepath`; do
#	mv $filepath/$i $filepath/$i.bak
#done

# close fastestmirror 
file="/etc/yum/pluginconf.d/fastestmirror.conf"
sed -i s/enabled=1/enabled=0/g $file


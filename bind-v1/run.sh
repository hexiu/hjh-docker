#!/bin/bash 

/usr/sbin/sshd -D & 
/usr/local/bind/sbin/named -g -d 1 -c /usr/local/bind/etc/named.conf 



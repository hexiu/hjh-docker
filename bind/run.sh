#!/bin/bash 

/usr/sbin/sshd -D & 
/usr/local/bind/named -g -c /etc/bind/named.conf 



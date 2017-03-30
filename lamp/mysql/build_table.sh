#!/bin/bash 
# 
/usr/bin/mysqld_safe &
sleep 3
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS' WITH GRANT OPTION;"
mysql -e "create database score"
mysql -e "create table score.name_score(name char(20) not null,score int not null) DEFAULT CHARSET=utf8;"
mysql -e "insert into score.name_score values ('liming',80),('zhangjun',90),('xiaoer',96);"


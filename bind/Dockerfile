# Author : axiu 
# Email  : axiu@jaxiu.cn 
# Usage  : Bind (DNS Server)

FROM sshd_server:v1 

ADD ./test.list /etc/apt/
RUN apt-get update 
RUN apt-get install -y libmysqld-dev 
RUN apt-get install -y dpkg-dev fakeroot pbuilder gnupg dh-make libssl-dev libpcre3-dev git-core
RUN apt-get install -y build-essential debhelper make autoconf automake patch

RUN wget https://www.openssl.org/source/openssl-1.1.0e.tar.gz
RUN tar -xvf openssl-1.1.0e.tar.gz -C /tmp
RUN mv /tmp/openssl-1.1.0e /usr/local/ssl

ENV LD_LIBRARY_PATH=/usr/lib:/usr/local/ssl

RUN wget https://www.isc.org/downloads/file/bind-9-10-5/ 
RUN mv index.html bind-9-10-5.tar.gz 
RUN tar -xvf bind-9-10-5.tar.gz -C /tmp
WORKDIR /tmp/bind-9.10.5 

#RUN wget http://nchc.dl.sourceforge.net/project/mysql-bind/mysql-bind/mysql-bind-0.2%20src/mysql-bind.tar.gz 

RUN wget http://nchc.dl.sourceforge.net/project/mysql-bind/mysql-bind/mysql-bind-0.2%20src/mysql-bind.tar.gz

RUN tar -xvf mysql-bind.tar.gz -C /tmp 
WORKDIR /tmp/bind-9.10.5

RUN cp -rp /tmp/mysql-bind/mysqldb.c /tmp/mysql-bind/mysqldb.h /tmp/bind-9.10.5//bin/named/
RUN cp -rp /tmp/mysql-bind/mysqldb.c /tmp/mysql-bind/mysqldb.h /tmp/bind-9.10.5/bin/named/include/
RUN  sed -i "s/DBDRIVER_OBJS.*=/DBDRIVER_OBJS = mysqldb.@O@ /" bin/named/Makefile.in 
RUN  sed -i "s/DBDRIVER_SRCS.*=/DBDRIVER_SRCS = mysqldb.c /" bin/named/Makefile.in 
# exec command : mysql_config -cflags 
RUN  sed -i "s%DBDRIVER_INCLUDES.*=%DBDRIVER_INCLUDES = -I/usr/include/mysql  -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -fno-strict-aliasing -fwrapv -fPIC   -DUNIV_LINUX -DUNIV_LINUX %" bin/named/Makefile.in 
# exec command : mysql_config -libs
RUN  sed -i "s%DBDRIVER_LIBS.*=%DBDRIVER_LIBS = -rdynamic -L/usr/lib/mysql -lmysqlclient -lz -lcrypt -lnsl -lm -L/usr/lib -lssl -lcrypto %" bin/named/Makefile.in 
#RUN mv ./bin/named/main.c bin/named/main.c.bak

RUN sed -i "/#include <ctype.h>/a\#include <mysqldb.h>" bin/named/main.c  
RUN sed -i "s/ns_server_create/mysqldb_init();ns_server_create/" bin/named/main.c  
#RUN sed -i "s/ns_server_destroy(&ns_g_server);/ns_server_destroy(&ns_g_server);mysqldb_clear();/" bin/named/main.c  
RUN sed -i "/ns_server_destroy(&ns_g_server);/a\mysqldb_clear();" bin/named/main.c  


RUN sed -i "s%#include <named/mysqldb.h>%#include <include/mysqldb.h>%" bin/named/mysqldb.c 


RUN ./configure --bindir=/usr/local/bind --disable-linux-caps 
RUN make&&make install

#WORKDIR /usr/local/bind 

ENV PATH=$PATH:/usr/local/bind/bin:/usr/local/bind/sbin

RUN mkdir /etc/bind
RUN rndc-confgen > /etc/bind/rndc.conf 

WORKDIR /usr/local/bind

RUN tail -10 /etc/bind/rndc.conf | head -9 | sed 's/# //g' > /etc/bind/named.conf

RUN sed -i "s%127.0.0.1;%127.0.0.1; 115.159.1.0/24;%" /etc/bind/named.conf 

ADD temp.conf /etc/bind/temp.conf 

RUN cat /etc/bind/temp.conf >> /etc/bind/named.conf 

ADD run.sh /run.sh 
RUN chmod u+x /run.sh 

CMD ["/run.sh"]
 
EXPOSE 53 53 




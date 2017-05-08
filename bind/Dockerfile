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

RUN ./configure --bindir=/usr/local/bind 
RUN make&&make install

ENV PATH=$PATH:/usr/local/bind/bin
RUN echo $PATH;ls /usr/local/bind/
RUN /usr/local/bind/dig -t A go.jaxiu.cn
EXPOSE 53 53 




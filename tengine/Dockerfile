FROM sshd_server:v1 
MAINTAINER axiu axiu@jaxiu.cn 
ADD test.list /etc/apt/test.list
#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN apt-get update
RUN echo "nameserver 223.5.5.5" > /etc/resolv.conf
RUN apt-get install -y build-essential debhelper make autoconf automake patch 
RUN apt-get install -y dpkg-dev fakeroot pbuilder gnupg dh-make libssl-dev libpcre3-dev git-core 
RUN echo "Asia/Shanghai" > /etc/timezone 
RUN dpkg-reconfigure -f noninteractive tzdata 
RUN adduser --disabled-login --gecos 'Tengine' nginx 
WORKDIR /home/nginx

RUN su nginx -c 'git clone https://github.com/alibaba/tengine.git' 

WORKDIR /home/nginx/tengine 

RUN su nginx -c "mv packages/debian ."
ENV DEB_BUILD_OPTIONS nocheck

RUN su nginx -c "dpkg-buildpackage -rfakeroot -uc -b" 

WORKDIR /home/nginx 
RUN dpkg -i tengine_2.1.0-1_amd64.deb

VOLUME ["/data","/etc/nginx/sites-enabled","/var/log/nginx"]

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf 

WORKDIR /etc/nginx

ADD run.sh /run.sh 
RUN chmod u+x /run.sh 
CMD ["/run.sh"]
EXPOSE 80 
EXPOSE 443 
 


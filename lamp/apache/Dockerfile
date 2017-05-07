# SOURCE 
FROM sshd_server:v1 
# AUTHER
MAINTAINER axiu axiu@jaxiu.cn 
# env value 
ENV DEBIAN_FRONTEND noninteractive 
# start install some software 
RUN apt-get update
RUN apt-get -y install apache2 
RUN rm -rf /var/lib/apt/lists/* 

RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata 

ADD run.sh /run.sh 

RUN chmod u+x /run.sh 

RUN mkdir -p /var/lock/apache2 && mkdir -p /app && rm -rf /var/www/html && ln -s /app /var/www/html 

COPY sample/ /app 

ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2  
ENV APACHE_PID_FILE /var/run/apache2.pid 
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN axiu@jaxiu,cn
ENV APACHE_SERVERNAME localhost 
ENV APACHE_SERVERALIAS docker.localhost 
ENV APACHE_DOCUMENTROOT /var/www 

EXPOSE 80 
WORKDIR /app 
CMD ["/run.sh"] 
    

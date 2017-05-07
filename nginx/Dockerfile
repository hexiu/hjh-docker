FROM sshd_server:v1 
MAINTAINER axiu axiu@jaxiu.cn 
RUN apt-get update 
RUN apt-get -y install nginx 
RUN rm -rf /var/lib/apt/lists/* 
RUN echo "\n daemon off;" >> /etc/nginx/nginx.conf 
RUN chown -R www-data:www-data /var/lib/nginx 
RUN echo "Asia/Shanghai" > /etc/timezone 
RUN dpkg-reconfigure -f nonineractive tzdata 
ADD run.sh /run.sh 
RUN chmod u+x /run.sh 
VOLUME ["/etc/nginx/sites-enabled","/etc/nginx/certs","/etc/nginx/conf.d","/var/log/nginx"]
WORKDIR /etc/nginx
CMD ["/run.sh"]
EXPOSE 80
EXPOSE 443 



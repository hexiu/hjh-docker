#use base images 
FROM ubuntu:16.04
#add author info 
MAINTAINER axiu axiu@jaxiu.cn 
#add apt sources.list 
ADD sources.list /etc/apt/sources.list
# apt update
RUN apt-get update 
# install ssh server 
RUN apt-get install openssh-server -y 
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh 
# no pam 
RUN sed -ri 's/session	required	pam_loginuid.so/#session	required	pam_loginuid.so/g' /etc/pam.d/sshd
#add authorized file 
ADD authorized_keys /root/.ssh/authorized_keys
RUN echo "#!/bin/bash" > /root/run.sh
RUN echo "/usr/sbin/sshd -D" >> /root/run.sh
RUN chmod u+x /root/run.sh
EXPOSE 22
CMD ["/root/run.sh"]

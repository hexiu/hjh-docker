# name   : for mysql container 
# useful : provide mysql database
# createtime : 2017-03-20 

From centos:latest 
MAINTAINER axiu axiu@jaxiu.cn
WORKDIR /root/
RUN echo "nameserver 114.114.114.114" > /etc/resolv.conf
ADD test.sh /root/test.sh 
RUN chmod u+x /root/test.sh
RUN /root/test.sh
ADD 163.repo /etc/yum.repos.d/163.repo
RUN yum -y install wget 
#RUN wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
#RUN rpm -ivh /root/mysql-community-release-el7-5.noarch.rpm
RUN yum -y install mysql-server
RUN yum -y install mysql
RUN mysql_install_db --user=mysql 
ENV MYSQL_USER test 
ENV MYSQL_PASS mypassword 
ENV LC_ALL en_US.UTF-8
ADD build_table.sh /root/build_table.sh
RUN chmod u+x /root/build_table.sh 
RUN /root/build_table.sh 
EXPOSE 3306 
ADD run.sh /root/run.sh 
RUN chmod u+x /root/run.sh
CMD /root/run.sh 








#use base images
FROM ubuntu
#add author info
MAINTAINER axiu axiu@jaxiu.cn
# apt update
RUN apt-get update
# install ssh server
RUN apt-get install nodejs -y
RUN apt-get install npm -y
RUN apt-get install git -y 
RUN npm install -g  gitbook -y 
RUN npm install -g gitbook-cli 
RUN apt-get install vim -y 
RUN mkdir -p /docs
WORKDIR /docs
RUN gitbook init docs
WORKDIR /docs/docs
CMD ["gitbook", "serve", "--port", "2345"]




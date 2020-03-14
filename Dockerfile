FROM centos:centos7

RUN yum -y update
RUN yum -y install crontabs

ADD runcurl.sh /runcurl.sh
ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /runcurl.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
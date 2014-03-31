FROM fedora

RUN yum -y update; yum clean all
RUN yum -y install mongodb-server; yum clean all
RUN mkdir -p /data/db
RUN chown -R mongodb:mongodb /data/db

EXPOSE 27017

USER mongodb

CMD ["/usr/bin/mongod"]


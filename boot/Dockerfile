FROM centos

RUN yum -y update
RUN yum -y install java-1.7.0-openjdk-devel
RUN yum -y install unzip

ADD jboss-eap-6.2.0.zip /opt/
RUN unzip -q /opt/jboss-eap-6.2.0.zip -d /opt/
RUN rm /opt/jboss-eap-6.2.0.zip

ADD launch.sh /opt/jboss-eap-6.2/bin/

CMD ["standalone"]
ENTRYPOINT ["/opt/jboss-eap-6.2/bin/launch.sh"]

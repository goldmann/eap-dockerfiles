FROM centos

# Execute system update
RUN yum -y update

# Install packages necessary to run EAP
RUN yum -y install java-1.7.0-openjdk-devel
RUN yum -y install unzip

# Copy the EAP to image, unpack and clean up afterwards
ADD jboss-eap-6.2.0.zip /opt/
RUN unzip -q /opt/jboss-eap-6.2.0.zip -d /opt/
RUN rm /opt/jboss-eap-6.2.0.zip

# Creates a management user
RUN /opt/jboss-eap-6.2/bin/add-user.sh admin Admin#70365 --silent

# Add the launch script which will be used as the entry point
ADD launch.sh /opt/jboss-eap-6.2/bin/

# Specify default values for entry point
CMD ["standalone"]

# And the entry point itself
ENTRYPOINT ["/opt/jboss-eap-6.2/bin/launch.sh"]

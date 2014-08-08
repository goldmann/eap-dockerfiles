FROM rhel:latest

# Execute system update
RUN yum -y update
# Install packages necessary to run EAP
RUN yum -y install java-1.7.0-openjdk-devel unzip

# YUM cleanup
RUN yum clean all

# Set handy environment variables
ENV JBOSS_EAP_VERSION 6.3.0
ENV JBOSS_EAP_SHORTVERSION 6.3

# Copy the EAP to image, unpack and clean up afterwards
ADD jboss-eap-6.3.0.zip /opt/
RUN unzip -q /opt/jboss-eap-$JBOSS_EAP_VERSION.zip -d /opt/

# Make sure the distribution is available from a well-known place
RUN ln -s /opt/jboss-eap-$JBOSS_EAP_SHORTVERSION /opt/jboss-eap

# Add the launch script which will be used as the entry point
ADD launch.sh /opt/jboss-eap/bin/

# Remove unneded zip files
RUN rm /opt/jboss-eap*.zip

# Boot EAP in standalone mode
CMD ["/opt/jboss-eap/bin/launch.sh", "standalone"]

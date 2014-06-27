FROM rhel:latest

# Execute system update
RUN yum -y update
# Install packages necessary to run EAP
RUN yum -y install java-1.7.0-openjdk-devel unzip

# YUM cleanup
RUN yum clean all

# Copy the EAP to image, unpack and clean up afterwards
ADD jboss-eap-6.2.0.zip /opt/
RUN unzip -q /opt/jboss-eap-6.2.0.zip -d /opt/

# Upgrade to 6.2.3
ADD jboss-eap-6.2.3-patch.zip /opt/
RUN /opt/jboss-eap-6.2/bin/jboss-cli.sh --command="patch apply /opt/jboss-eap-6.2.3-patch.zip"

# Add the launch script which will be used as the entry point
ADD launch.sh /opt/jboss-eap-6.2/bin/

# Remove unneded zip files
RUN rm /opt/jboss-eap*.zip

# Boot EAP in standalone mode
CMD ["/opt/jboss-eap-6.2/bin/launch.sh", "standalone"]

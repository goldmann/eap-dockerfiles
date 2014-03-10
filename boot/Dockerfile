FROM 10.64.27.125:5000/vpavlin/rhel6:latest

# Execute system update
RUN yum -y update
# Install packages necessary to run EAP
RUN yum -y install java-1.7.0-openjdk-devel unzip

# YUM cleanup
RUN rm -rf /var/cache/yum/*

# Copy the EAP to image, unpack and clean up afterwards
ADD jboss-eap-6.2.0.zip /opt/
RUN unzip -q /opt/jboss-eap-6.2.0.zip -d /opt/

# Upgrade to 6.2.1
ADD jboss-eap-6.2.1.zip /opt/
RUN /opt/jboss-eap-6.2/bin/jboss-cli.sh --command="patch apply /opt/jboss-eap-6.2.1.zip"

# Add the launch script which will be used as the entry point
ADD launch.sh /opt/jboss-eap-6.2/bin/

# Remove unneded zip files
RUN rm /opt/jboss-eap*.zip

# Specify default values for entry point
CMD ["standalone"]

# And the entry point itself
ENTRYPOINT ["/opt/jboss-eap-6.2/bin/launch.sh"]

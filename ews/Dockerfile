FROM 10.64.27.125:5000/vpavlin/rhel6:latest

# Install unzip and apr-util
RUN yum -y install unzip apr-util mailcap
# Cleanup the yum database
RUN yum clean all

ADD jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip /opt/
RUN unzip -q /opt/jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip -d /opt/

# Remove unneeded zip files
RUN rm /opt/*.zip

# Create the apache user
RUN groupadd -g 48 -r apache
RUN useradd -c "Apache" -u 48 -g apache -s /sbin/nologin -r -d /opt/jboss-ews-2.0/httpd apache
RUN chown -R apache:apache /opt/jboss-ews-2.0/httpd

# Apply the custom mod_cluster configuration
ADD mod_cluster.conf /opt/jboss-ews-2.0/httpd/conf.d/mod_cluster.conf

# Not required + prevents httpd from boot
RUN rm /opt/jboss-ews-2.0/httpd/conf.d/auth_kerb.conf

# Run the postinstall script
RUN cd /opt/jboss-ews-2.0/httpd && ./.postinstall

CMD ["/opt/jboss-ews-2.0/httpd/sbin/httpd", "-DFOREGROUND", "-f", "/opt/jboss-ews-2.0/httpd/conf/httpd.conf"]

FROM 10.64.27.125:5000/rhel:7-0.0.1.beta.el7
# FROM 10.64.27.125:5000/vpavlin/rhel7
MAINTAINER scollier <scollier@redhat.com>

# Update the container and clean cache
RUN yum -y update
# Add repo files
ADD ./mongo.repo /etc/yum.repos.d/
# Install MongoDB packages and extras
RUN yum -y install mongo-10gen-server mongo-10gen
# Clean up the YUM database
RUN yum clean all

# Add custom mongodb configuration
ADD ./mongod.conf /etc/

# Prepare the data dir
RUN mkdir -p /data/db
RUN chown -R mongod:mongod /data

# Expose port
EXPOSE 27017

ADD launch.sh /
RUN chmod +x /launch.sh

USER mongod

CMD ["/launch.sh"]


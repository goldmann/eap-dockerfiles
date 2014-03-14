FROM redhat/eap:latest

ADD ./openshift-origin-deps.repo /etc/yum.repos.d/openshift-origin-deps.repo

# Install packages necessary to compile applications
RUN yum -y install maven3

# YUM cleanup
RUN yum clean all

# Add scripts for sti compatibility
ADD ./prepare /usr/bin/prepare
ADD ./run /usr/bin/run
RUN chmod +x /usr/bin/{prepare,run}


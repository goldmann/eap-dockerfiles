FROM 10.64.27.125:5000/vpavlin/rhel6

# Run rsyslogd on 514 TCP port
RUN echo -e "\$ModLoad imudp\n\$UDPServerRun 514" >> /etc/rsyslog.d/remote.conf

# Expose the port
EXPOSE 514/udp

CMD ["rsyslogd", "-n"]

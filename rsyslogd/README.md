
1. Build the rsyslogd image

    docker build --rm=true --tag=redhat/rsyslogd  .

2. Start it

    docker run --name rsyslogd redhat/rsyslogd bash
    rsyslogd
    tail -f /var/log/messages

3. In a new terminal build the `eap-rsyslogd` image

    cd ../eap-rsyslogd
    docker build --rm=true --tag=redhat/eap-rsyslogd  .

4. Start the EAP:

    docker run -t -i -link rsyslogd:rsyslogd redhat/eap-rsyslogd

You should see logs on the console and in the syslog on the rsyslog terminal

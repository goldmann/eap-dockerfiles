FROM 10.64.27.125:5000/goldmann/eap

RUN sed -i 's@</console-handler>@</console-handler>\n            <custom-handler name="SYSLOG" class="org.apache.log4j.net.SyslogAppender" module="org.apache.log4j">\n                <level name="INFO"/>\n                <formatter>\n                    <pattern-formatter pattern="${jboss.hostname} %d{HH:mm:ss,SSS} %-5p [%c] (%t) %s%E%n"/>\n                </formatter>\n                <properties>\n                    <property name="syslogHost" value="${jboss.rsyslogd.host}:514"/>\n                    <property name="facility" value="LOCAL1"/>\n                    <property name="facilityPrinting" value="false"/>\n                </properties>\n            </custom-handler>@' /opt/jboss-eap-6.2/standalone/configuration/standalone.xml

RUN sed -i 's|<handler name="FILE"/>|<handler name="FILE"/>\n                    <handler name="SYSLOG"/>|' /opt/jboss-eap-6.2/standalone/configuration/standalone.xml

CMD ["/eap/bin/launch.sh", "standalone", "-Djboss.hostname=`hostname`", "-Djboss.rsyslogd.host=$RSYSLOGD_PORT_514_UDP_ADDR"]

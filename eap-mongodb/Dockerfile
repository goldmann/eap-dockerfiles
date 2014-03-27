FROM 10.64.27.125:5000/goldmann/eap

RUN mkdir -p /opt/jboss-eap-6.2/modules/system/layers/base/com/mongodb/main/
ADD module.xml /opt/jboss-eap-6.2/modules/system/layers/base/com/mongodb/main/
ADD mongo-java-driver-2.9.3.jar /opt/jboss-eap-6.2/modules/system/layers/base/com/mongodb/main/


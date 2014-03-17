This Dockerfile creates an image with JBoss EWS (Apache HTTPD).

# Usage

Below you can find instructions on how to build ans use the image.

## Preparations

Get the `jboss-ews-httpd-2.0.1-RHEL6-x86_64.zip` from  [access.redhat.com](https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?product=webserver&downloadType=distributions).

## Building

    docker build --rm=true --tag=redhat/ews .

## Running

Start it

    docker run -i -t redhat/ews


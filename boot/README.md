This Dockerfile creates an image with JBoss EAP.

# Usage

Below you can find instructions on how to build ans use the image.

## Preparations

Get [JBoss EAP 6.2.0 and the 6.2.1 patch](https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?downloadType=distributions&product=appplatform&productChanged=yes).

## Building

    docker build --rm=true --tag=eap-6.2 .

## Running

To start in standalone mode

    docker run -i -t eap-6.2

To start in standalone mode and bind to `0.0.0.0`

    docker run -i -t eap-6.2 standalone -b 0.0.0.0

To start in standalone mode and bind to `0.0.0.0` and additionally mount the `standalone/deployments/` directory to `/home/goldmann/work/deployments`

    docker run -i -t -v /home/goldmann/work/deployments:/opt/jboss-eap-6.2/standalone/deployments eap-6.2 standalone -b 0.0.0.0

You can also run above container in the background

    docker run -d -v /home/goldmann/work/deployments:/opt/jboss-eap-6.2/standalone/deployments eap-6.2 standalone -b 0.0.0.0

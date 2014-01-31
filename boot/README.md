This Dockerfile creates an image with JBoss EAP.

# Usage

Below you can find instructions on how to build ans use the image.

## Building

    docker build .

## Running

To start in standalone mode

    docker run -i -t IMAGE_ID

To start in standalone mode and bind to `0.0.0.0`

    docker run -i -t IMAGE_ID standalone -b 0.0.0.0

To start in standalone mode and bind to `0.0.0.0` and additionally mount the `standalone/deployments/` directory to `/home/goldmann/work/deployments`

    docker run -i -t -v /home/goldmann/work/deployments:/opt/jboss-eap-6.2/standalone/deployments IMAGE_ID standalone -b 0.0.0.0

You can also run above container in the background

    docker run -d /home/goldmann/work/deployments:/opt/jboss-eap-6.2/standalone/deployments IMAGE_ID standalone -b 0.0.0.0

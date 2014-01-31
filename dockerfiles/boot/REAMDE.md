This Dockerfile creates an image with JBoss EAP.

To start in standalone mode

    docker run -i -t HASH

To start in standalone mode and bind to `0.0.0.0`

    docker run -i -t HASH standalone -b 0.0.0.0

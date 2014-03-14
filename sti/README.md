This Dockerfile creates an image with JBoss EAP redy to use by STI.

# Usage

Below you can find instructions on how to build ans use the image.

## Preparations

Get [JBoss EAP 6.2.0 and the 6.2.1 patch](https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?downloadType=distributions&product=appplatform&productChanged=yes).

## Building

    docker build --rm=true --tag=redhat/eap-sti .

## Usage

Here is how to use this image with STI

### First make sure you have STI installed

    go get github.com/pmorie/go-sti/sti

### Build the kitchensink example with STI

    sti build git://github.com/pmorie/simple-jbosseap redhat/eap-sti kitchensink-eap

### Run the resulting image

    docker run -i -t -p 18080:8080 kitchensink-eap

### Confirm that the app works

Point your browser to [http://localhost:18080/jboss-as-kitchensink](http://localhost:18080/jboss-as-kitchensink).

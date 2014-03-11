This script prepares a tar.gz file with all required files to run the latest version of JBoss EAP 6.2.

# Usage

Below you can find instructions on how to build it.

## Preparations

Get [JBoss EAP 6.2.0 and the 6.2.1 patch](https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?downloadType=distributions&product=appplatform&productChanged=yes) and place them in this directory.

## Building

Run the `create.sh` script.

    Tue, 11 Mar 2014 13:33:35 +0100 Preparing directory structure
    Tue, 11 Mar 2014 13:33:35 +0100 Unpacking EAP distribution jboss-eap-6.2.0.zip
    Tue, 11 Mar 2014 13:33:36 +0100 Upgrading EAP distribution using jboss-eap-6.2.1.zip
    {
          "outcome" : "success",
              "result" : {}
    }
    Tue, 11 Mar 2014 13:33:38 +0100 Installing launch script
    Tue, 11 Mar 2014 13:33:38 +0100 Creating package with the layer
    Tue, 11 Mar 2014 13:33:47 +0100 Done!

A tar file called `jboss-eap-6.2.1-layer.tar.gz` should be created.

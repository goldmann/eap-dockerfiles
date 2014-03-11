#!/bin/bash

CURRENTDIR=`dirname $0`
BUILDDIR=$CURRENTDIR/build

distribution=jboss-eap-6.2.0.zip
patches=( jboss-eap-6.2.1.zip )

for f in "$distribution ${patches[@]}"; do
  if [ ! -f "$CURRENTDIR/jboss-eap-6.2.0.zip" ]; then
    echo "File $f not found!"
    echo "Download it from https://access.redhat.com/jbossnetwork/restricted/listSoftware.html?downloadType=distributions&product=appplatform&productChanged=yes"
    exit 1
  fi
done

# Clean up the build dir
echo "$(date -R) Preparing directory structure"
rm -rf $BUILDDIR
mkdir -p $BUILDDIR/opt

# Unpack the main EAP distribution
echo "$(date -R) Unpacking EAP distribution $distribution"
unzip -q $distribution -d $BUILDDIR/opt/

# Upgrade
for f in "${patches[@]}"; do
  echo "$(date -R) Upgrading EAP distribution using $f"
  $BUILDDIR/opt/jboss-eap-6.2/bin/jboss-cli.sh --command="patch apply $f"
done

echo "$(date -R) Installing launch script"
cp launch.sh $BUILDDIR/opt/jboss-eap-6.2/bin/

echo "$(date -R) Creating package with the layer"
tar -czf jboss-eap-6.2.1-layer.tar.gz -C $BUILDDIR .

echo "$(date -R) Done!"

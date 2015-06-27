#!/bin/bash

set -e

# To have our own output directory (upgradepkg)
export TMP=/tmp/bob-infinality-bundle
rm -rf $TMP

# Number of CPUs + 1
export NUMJOBS=$(expr $(lscpu | grep -E '^CPU\(s\):' | xargs | cut -d ' ' -f 2) + 1)

# Detect the installation of lxml
LXMLPKG=$(ls /var/log/packages/lxml* 2>/dev/null || true)
if [ -z "$LXMLPKG" ]; then
  echo "###"
  echo "### Error, lxml seems to be not installed."
  echo "###"
  echo "### You can find lxml's SlackBuild at:"
  echo "###"
  echo "###  http://slackbuilds.org/result/?search=lxml&sv="
  echo "###"
  echo "### Install it and execute this script one again."
  echo "###"
  exit 1
fi

LXMLPKG=$(basename $LXMLPKG)
echo "###"
echo "### lxml detected: $LXMLPKG"
echo "###"
sleep 3

echo "###"
echo "### Building: source/l/freetype ..."
echo "###"
sleep 3

( cd source/l/freetype
  sh freetype.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/freetype*.txz
) || exit 1

echo "###"
echo "### Building: source/x/fontconfig ..."
echo "###"
sleep 3

( cd source/x/fontconfig
  sh fontconfig.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/fontconfig*.txz
) || exit 1

echo "###"
echo "### Building: source/l/cairo ..."
echo "###"
sleep 3

( cd source/l/cairo
  sh cairo.SlackBuild || exit 1
  upgradepkg --install-new --reinstall $TMP/cairo*.txz
) || exit 1

echo "###"
echo "### Finished."
echo "###"

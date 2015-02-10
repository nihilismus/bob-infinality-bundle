#!/bin/bash

set -e

# To have our own output directory (upgradepkg)
export TMP=/tmp/bob-infinality-bundle
rm -rf $TMP

# Number of CPUs + 1
export NUMJOBS=$(expr $(lscpu | grep -E '^CPU\(s\):' | xargs | cut -d ' ' -f 2) + 1)

echo "###"
echo "### Building: source/l/freetype ..."
echo "###"
sleep 3

( cd source/l/freetype
  sh freetype.SlackBuild
  upgradepkg --install-new --reinstall $TMP/freetype*.txz
) || exit 1

echo "###"
echo "### Building: source/x/fontconfig ..."
echo "###"
sleep 3

( cd source/x/fontconfig
  sh fontconfig.SlackBuild
  upgradepkg --install-new --reinstall $TMP/fontconfig*.txz
) || exit 1

#echo "###"
#echo "### Building: source/l/cairo ..."
#echo "###"
#sleep 3
#
#( cd source/l/cairo
#  sh cairo.SlackBuild
#  upgradepkg --install-new --reinstall $TMP/cairo*.txz
#) || exit 1

echo "Finished."

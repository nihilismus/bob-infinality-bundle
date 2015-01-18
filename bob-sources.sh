#!/bin/sh

set -e

# If you get "Delaying before reconnect" with lftp, you can
# echo 'set net:reconnect-interval-base 0' to ~/.lftprc and see if that
# works.

MIRROR=$(/usr/bin/grep -v '^#' /etc/slackpkg/mirrors | xargs)

# A well-know mirror
# MIRROR=http://slackware.mirrors.tds.net/pub/slackware/slackware64-current

SLACKBUILDS="source/x/fontconfig/ source/l/cairo/ patches/source/freetype/"

for slackbuild in $SLACKBUILDS; do
  echo "Mirroring..."
  echo "$MIRROR/$slackbuild => $(pwd)/$slackbuild"
  sleep 1
  mkdir -p $slackbuild
  lftp -c "mirror -c -e -p $MIRROR/$slackbuild $slackbuild"
done

VERSION=2015-01-01

echo "Downloading modifications..."
wget -N https://github.com/bohoomil/fontconfig-ultimate/archive/$VERSION.tar.gz
tar xpf $VERSION.tar.gz

echo "Copying modifications..."
  mkdir patches/source/freetype/infinality-bundle
  cp -r fontconfig-ultimate-$VERSION/freetype/* patches/source/freetype/infinality-bundle/
  cp modifications/freetype/freetype.SlackBuild.patch patches/source/freetype/
  cp -r modifications/fontconfig/* source/x/fontconfig/
  cp -r modifications/cairo/* source/l/cairo

echo "Patching SlackBuilds..."
  patch -Np0 -i patches/source/freetype/freetype.SlackBuild.patch
  patch -Np0 -i source/x/fontconfig/fontconfig.SlackBuild.patch
  patch -Np0 -i source/l/cairo/cairo.SlackBuild.patch

echo "Done."

#EOF

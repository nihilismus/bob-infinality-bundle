#!/bin/sh

set -e

# If you get "Delaying before reconnect" with lftp, you can
# echo 'set net:reconnect-interval-base 0' to ~/.lftprc and see if that
# works.

MIRROR=$(/usr/bin/grep -v '^#' /etc/slackpkg/mirrors | xargs)

# A well-know mirror
# MIRROR=http://slackware.mirrors.tds.net/pub/slackware/slackware64-current

SLACKBUILDS="source/x/fontconfig/ source/l/cairo/ source/l/freetype/"

for slackbuild in $SLACKBUILDS; do
  echo "Mirroring..."
  echo "$MIRROR/$slackbuild => $(pwd)/$slackbuild"
  sleep 1
  mkdir -p $slackbuild
  lftp -c "mirror -c -e -p $MIRROR/$slackbuild $slackbuild"
done

#EOF

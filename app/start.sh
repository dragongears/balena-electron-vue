#!/bin/bash

# By default docker gives us 64MB of shared memory size but to display heavy
# pages we need more.
#umount /dev/shm && mount -t tmpfs shm /dev/shm

# Default to UTC if no TIMEZONE env variable is set
echo "Setting time zone to ${TIMEZONE=UTC}"
# This only works on Debian-based images
echo "${TIMEZONE}" > /etc/timezone
dpkg-reconfigure tzdata

# using local electron module instead of the global electron lets you
# easily control specific version dependency between your app and electron itself.
# the syntax below starts an X instance with ONLY our electronJS fired up,
# it saves you a LOT of resources avoiding full-desktops envs

rm /tmp/.X0-lock &>/dev/null || true
NODE_ENV='production' startx /usr/src/app/node_modules/electron/dist/electron /usr/src/app/dist_electron/bundled --enable-logging

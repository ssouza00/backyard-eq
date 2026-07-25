#!/bin/sh
set -eu

mkdir -p /config/coeffs /audio /root/camilladsp/configs /root/camilladsp/coeffs

if [ ! -f /config/default.yml ]; then
  cp /defaults/default.yml /config/default.yml
fi

cp /config/default.yml /root/camilladsp/configs/default.yml
rm -f /audio/spotify.pipe
mkfifo /audio/spotify.pipe
chmod 666 /audio/spotify.pipe

/usr/local/bin/camilladsp \
  --port 1234 \
  --address 0.0.0.0 \
  --logfile /root/camilladsp/camilladsp.log \
  /root/camilladsp/configs/default.yml &

cd /opt/camillagui_backend
exec ./camillagui_backend

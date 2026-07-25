# Back-yard-EQ for Unraid

A Spotify Connect audio endpoint with CamillaDSP processing and CamillaGUI controls.

## Components

- **spotify-connect** uses giof71/librespot:latest and appears in Spotify as **Unraid Backyard**.
- **Back-yard-EQ** uses ghcr.io/ssouza00/backyard-eq:latest for EQ, profiles, and the web interface.
- Both containers share /mnt/user/appdata/spotify-dsp/audio.
- Back-yard-EQ outputs through the Unraid /dev/snd ALSA device.

## Interfaces

- Spotify container WebUI opens [Spotify Web Player](https://open.spotify.com/).
- EQ controls open at http://BACK-YARD-EQ-IP:5005/gui/index.html.

## Updating

GitHub Actions builds and publishes ghcr.io/ssouza00/backyard-eq:latest after every change to the main branch. Unraid can then detect and install updates normally.

## Unraid templates

Import the templates from the templates folder. Use a custom LAN network such as br1 so Spotify Connect discovery works correctly.

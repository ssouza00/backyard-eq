# Spotify Connect with CamillaDSP for Unraid

A reusable Spotify Connect audio endpoint with professional CamillaDSP processing and CamillaGUI controls.

## Components

- **Spotify Connect** uses `giof71/librespot:latest`. Each user chooses their own Spotify device name during installation.
- **CamillaDSP EQ** uses `ghcr.io/ssouza00/backyard-eq:latest` for equalization, profiles, and the browser interface.
- Both containers share a configurable host directory containing the audio FIFO.
- CamillaDSP outputs through the ALSA device selected by the Unraid user.

## Privacy

The templates contain no Spotify credentials, account details, fixed LAN addresses, or installation-specific identifiers. Spotify authentication and device selection happen through Spotify Connect on the user's own network.

## Installation

1. Install **CamillaDSP EQ** and select the host audio device.
2. Install **Spotify Connect EQ** and choose any Spotify device name.
3. Use the same shared-audio host directory in both templates.
4. Open Spotify, select the newly named device, and begin playback.
5. Open the CamillaGUI WebUI from Unraid to select profiles and tune sound.

## Updating

GitHub Actions builds and publishes `ghcr.io/ssouza00/backyard-eq:latest` after changes to the main branch. Unraid can detect and install image updates normally.

## Support

Report template or integration issues through this repository's Issues page.
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

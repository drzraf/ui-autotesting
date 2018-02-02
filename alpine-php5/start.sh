#!/bin/sh
exec sh -c "chromium-browser --disable-background-networking  --disable-default-apps  --disable-extensions  --disable-gpu  --disable-sync  --disable-translate  --headless  --hide-scrollbars  --metrics-recording-only  --mute-audio  --no-first-run --remote-debugging-address=${DEBUG_ADDRESS:-0.0.0.0}  --remote-debugging-port=${DEBUG_PORT:-9222} --safebrowsing-disable-auto-update --no-sandbox"
# https://github.com/westy92/headless-chrome-alpine/blob/master/Dockerfile

#!/bin/sh

CHROME_ARGS="--disable-gpu --headless --no-sandbox --remote-debugging-address=${DEBUG_ADDRESS:-0.0.0.0}  --remote-debugging-port=${DEBUG_PORT:-9222} --user-data-dir=/data"

if [ -n "$CHROME_OPTS" ]; then
  CHROME_ARGS="${CHROME_ARGS} ${CHROME_OPTS}"
fi

# Start Chrome
exec sh -c "/usr/bin/google-chrome-stable $CHROME_ARGS"

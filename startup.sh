#!/bin/bash

# Set the display environment variable
export DISPLAY=:0

# Start Chrome Remote Desktop host with your custom command
/opt/google/chrome-remote-desktop/start-host --code="4/0AdLIrYf7MUrqTY8Tohk-R3mwFUVetcw-xbYl5J05VhVmYGC2KP8f-TLQ5Tmgk6T9lBFdTQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) &

# Start SSH (if needed)
/usr/sbin/sshd -D

#!/bin/bash

# Set the display environment variable
export DISPLAY=:0

# Start Chrome Remote Desktop host with your custom command
/opt/google/chrome-remote-desktop/start-host --code="4/0AeaYSHAPxtPXPhRvlypLcbOku7DoB0hewui3FLVdNz89tJCX1NVGIX1S7IMJc4RKgn_vvg" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) &

# Start SSH (if needed)
/usr/sbin/sshd -D

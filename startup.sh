#!/bin/bash

# Create the user account if it doesn't exist
if ! id -u Albin &>/dev/null; then
    echo "Creating user Albin..."
    useradd -m Albin
fi

# Set password for the user
echo "Setting password for user Albin..."
echo "Albin:Albin4242" | chpasswd

# Start Chrome Remote Desktop host with custom command
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AdLIrYdx_6GkV6PzhX-d-3_wXj2uNdSrzSIDU1_ORJgtc67LjTzyrZXZpb4deWpa-vfgtA" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --user-name=Albin

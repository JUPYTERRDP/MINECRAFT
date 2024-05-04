#!/bin/bash

# Create the user account if it doesn't exist
if ! id -u Albin &>/dev/null; then
    echo "Creating user Albin..."
    useradd -m Albin
fi

# Set password for the user
echo "Setting password for user Albin..."
echo -e "Albin4242\nAlbin4242" | passwd Albin

# Start Chrome Remote Desktop host with custom command
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AdLIrYdm6t7f0syyFJchqKULZViC_q3gkXZvRq8kgBu_xXpApx00cv0T_C0xoJiuheb8bA" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --user-name=Albin

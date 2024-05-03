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
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AdLIrYdu7up_U8uzR5FWgxEmTUBofOG9xpZw9TmqIqVzXxXAum37mTqdlD6_Mb5waEJhdw" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --user-name=Albin

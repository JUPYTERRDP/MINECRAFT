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
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AdLIrYcCh9UkKG_5yka7gPQopHQucZiU4DU2Nh5DPWYiKxFwrDUHIY-6JQx4F-9tO_O8FQ" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --user-name=Albin

#!/bin/bash

# Create privilege separation directory for SSH
mkdir -p /run/sshd

# Start SSH service
/usr/sbin/sshd

# Start Chrome Remote Desktop host with custom command
DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AdLIrYdu7up_U8uzR5FWgxEmTUBofOG9xpZw9TmqIqVzXxXAum37mTqdlD6_Mb5waEJhdw" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname)

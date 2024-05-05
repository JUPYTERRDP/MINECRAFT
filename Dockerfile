# Example Dockerfile for your web service
FROM ubuntu:latest

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    chrome-remote-desktop \
    # Other dependencies if needed \
    && rm -rf /var/lib/apt/lists/*

# Set up Chrome Remote Desktop (use RUN commands to execute installation steps)
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb \
    && sudo dpkg -i chrome-remote-desktop_current_amd64.deb \
    && sudo apt-get install -f

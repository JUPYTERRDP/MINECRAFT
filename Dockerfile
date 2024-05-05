# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Install required packages
RUN apt-get update && apt-get install -y \
    gnupg \
    xrdp \
    xfce4 \
    xfce4-goodies \
    firefox \
    curl \
    fonts-noto-color-emoji \
    libappindicator3-1 \
    libatk-bridge2.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    fonts-liberation \
    libasound2 \
    libu2f-udev \
    libvulkan1 \
    --no-install-recommends

# Import the missing public key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

# Download Chrome using curl
RUN curl -o chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Chrome
RUN dpkg -i chrome.deb || true

# Install any missing dependencies
RUN apt-get install -f -y

# Clean up
RUN rm chrome.deb

# Expose RDP port
EXPOSE 3389

# Start RDP server
CMD ["xrdp", "--nodaemon"]

# Use an appropriate base image for your Linux distribution
FROM ubuntu:latest

# Add the missing public key
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

# Add a repository that provides libasound2
RUN echo "deb http://archive.ubuntu.com/ubuntu bionic main universe" >> /etc/apt/sources.list

# Install required packages
RUN apt-get update && apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-goodies \
    firefox \
    wget \
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

# Download and install Chrome
RUN wget -q -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i chrome.deb && \
    apt-get install -f && \
    rm chrome.deb

# Expose RDP port
EXPOSE 3389

# Start RDP server
CMD ["xrdp", "--nodaemon"]

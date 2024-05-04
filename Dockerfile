# Use an official Ubuntu runtime as the base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    apt-utils \
    xfce4 \
    xfce4-goodies \
    desktop-base \
    xfce4-terminal \
    dbus-x11 \
    supervisor \
    x11vnc \
    xvfb \
    firefox \
    tigervnc-standalone-server \
    tigervnc-common \
    xfonts-base \
    xfonts-100dpi \
    xfonts-75dpi \
    xfonts-scalable \
    xfonts-cyrillic \
    x11-apps \
    dbus \
    dbus-x11 \
    x11-utils \
    fonts-liberation \
    libnss3 \
    libnspr4 \
    libgtk-3-0 \
    libxss1 \
    libxtst6 \
    lsb-release \
    libappindicator3-1 \
    xdg-utils \
    curl \
    iproute2 \
    procps \
    unzip \
    xserver-xorg-video-dummy \
    xbase-clients \
    python3-packaging \
    openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Download and install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Chrome Remote Desktop
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb \
    && apt-get install -y ./chrome-remote-desktop_current_amd64.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create SSH privilege separation directory
RUN mkdir /run/sshd

# Expose necessary ports
EXPOSE 5900
EXPOSE 22

# Start Chrome Remote Desktop and SSH
CMD service chrome-remote-desktop start && /usr/sbin/sshd -D

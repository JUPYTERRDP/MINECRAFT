# Use an appropriate base image for your Linux distribution
FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    xrdp \
    xfce4 \
    xfce4-goodies \
    firefox \
    wget \
    gdebi-core \
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
    --no-install-recommends

# Download and install libasound2 manually
RUN wget http://security.ubuntu.com/ubuntu/pool/main/a/alsa-lib/libasound2_1.2.2-2.1ubuntu2.2_amd64.deb && \
    dpkg -i libasound2_1.2.2-2.1ubuntu2.2_amd64.deb && \
    rm libasound2_1.2.2-2.1ubuntu2.2_amd64.deb

# Download and install Chrome
RUN wget -q -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    gdebi -n chrome.deb && \
    rm chrome.deb

# Expose RDP port
EXPOSE 3389

# Start RDP server
CMD ["xrdp", "--nodaemon"]

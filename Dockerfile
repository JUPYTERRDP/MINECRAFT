# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables for CRP token and PIN
ENV CRP="4/0AeaYSHBntyK5gi3BZaC4d0b0x4pSdGd0Ht0jCtFWQARtkpSskgBX2e2YSqkqFHZdOsPZ3A" \
    PIN="123456"

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    sudo \
    xfce4 \
    desktop-base \
    xfce4-terminal \
    xscreensaver \
    gnome-terminal \
    xvfb \
    xserver-xorg-video-dummy \
    xbase-clients \
    psmisc \
    python3-packaging \
    python3-psutil \
    python3-xdg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Chrome Remote Desktop
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb \
    && dpkg --install chrome-remote-desktop_current_amd64.deb \
    && apt-get install -y --fix-broken \
    && apt-get clean \
    && rm chrome-remote-desktop_current_amd64.deb

# Set up Chrome Remote Desktop with CRP token and PIN
RUN useradd -m albin \
    && printf "albin:albin4242\n" | chpasswd \
    && usermod -aG sudo albin \
    && printf "XFCE\n" > /etc/chrome-remote-desktop-session \
    && su - albin -c "DISPLAY= /opt/google/chrome-remote-desktop/start-host --code=\"$CRP\" --redirect-url=\"https://remotedesktop.google.com/_/oauthredirect\" --name=$(hostname) --pin=$PIN"

# Run XFCE desktop environment
CMD ["su", "-", "albin", "-c", "startxfce4"]

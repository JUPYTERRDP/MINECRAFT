# Use Ubuntu as base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    sudo \
    xfce4 \
    desktop-base \
    xfce4-terminal \
    xscreensaver \
    gnome-terminal \
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

# Create a user
ARG username=Albin
ARG password=Albin4242
RUN useradd -m $username \
    && adduser $username sudo \
    && echo "$username:$password" | sudo chpasswd \
    && sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

# Set up autostart for the user
ARG CRP=''
ARG Pin=123456
ARG Autostart=True
RUN if [ "$CRP" != "" ]; then \
        mkdir -p /home/$username/.config/autostart \
        && link="https://youtu.be/d9ui27vVePY?si=TfVDVQOd0VHjUt_b" \
        && echo "[Desktop Entry]\nType=Application\nName=Colab\nExec=sh -c \"sensible-browser $link\"\nIcon=\nComment=Open a predefined notebook at session signin.\nX-GNOME-Autostart-enabled=true" > /home/$username/.config/autostart/colab.desktop \
        && chmod +x /home/$username/.config/autostart/colab.desktop \
        && chown $username:$username /home/$username/.config \
    ; fi \
    && adduser $username chrome-remote-desktop \
    && command="/opt/google/chrome-remote-desktop/start-host --code=\"$CRP\" --redirect-url=\"https://remotedesktop.google.com/_/oauthredirect\" --name=$(hostname)" \
    && su - $username -c "$command" \
    && service chrome-remote-desktop start

# Run indefinitely to keep the container running
CMD ["tail", "-f", "/dev/null"]

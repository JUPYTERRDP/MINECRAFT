FROM python:3.10

WORKDIR /app

# Set default browser
ENV BROWSER /usr/bin/firefox

# Install dependencies
RUN pip install --no-cache-dir notebook

# Install Python 3 packages
RUN pip install some-python-package another-python-package

# Download and extract ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz

# Set ngrok authtoken
RUN ./ngrok authtoken 2gJA7Z4ft9WBNwKAEHY9IJAJAs9_7yfkdPQUXaceFcnepqahf

# Set command to run on container start
CMD ./ngrok http 8888 & python3 -m notebook --ip=0.0.0.0 --allow-root

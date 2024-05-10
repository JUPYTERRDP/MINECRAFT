FROM python:3.10

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir notebook

# Install R and required packages
RUN apt-get update && apt-get install -y \
    r-base \
    r-recommended \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfribidi-dev \
    libharfbuzz-dev \
    libfreetype-dev && \
    R -e "install.packages(c('IRkernel', 'tidyverse'))" && \
    R -e "IRkernel::installspec()"

# Download and extract ngrok
RUN wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xvf ngrok-v3-stable-linux-amd64.tgz

# Set ngrok authtoken
RUN ./ngrok authtoken 2ep0210cJIyyFj5U0A4nCrGayCF_5cPgMxFrSE2BNNE32LnsE

# Set command to run on container start
CMD ./ngrok http 8888 & python3 -m notebook --ip=0.0.0.0 --allow-root

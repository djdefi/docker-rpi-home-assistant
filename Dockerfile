FROM resin/rpi-raspbian
EXPOSE 8123

# configuration
VOLUME ["/data"]

# Start Home Assistant
CMD [ "python3", "-m", "homeassistant", "--config", "/data" ]

# Base layer
ENV ARCH=arm
ENV CROSS_COMPILE=/usr/bin/
ENV HA_VERSION 0.56.2


RUN apt-get update && \
    apt-get install --no-install-recommends \
      build-essential python3-dev python3-pip \
      libffi-dev libpython-dev libssl-dev \
      net-tools nmap \
      iputils-ping \
      ssh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Home Assistant
RUN pip3 install homeassistant==$HA_VERSION

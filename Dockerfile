FROM resin/rpi-raspbian:latest

RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends \
    python3 python3-dev python3-pip python3-netifaces python3-psutil \
    libxrandr-dev nmap bluetooth libglib2.0-dev libbluetooth-dev libsodium13 \
    net-tools nmap cython3 libudev-dev libglib2.0-dev build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD https://raw.githubusercontent.com/home-assistant/home-assistant/dev/requirements_all.txt requirements_all.txt

RUN pip3 install --upgrade pip && \
    pip3 install --no-cache-dir -r requirements_all.txt && \
    pip3 install homeassistant && \
    pip3 install netdisco && \
    pip3 install pychromecast==0.7.2 

EXPOSE 8123

VOLUME ["/data"]

ENTRYPOINT ["hass", "--config", "/data"]

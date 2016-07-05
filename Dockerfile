FROM resin/rpi-raspbian:latest

RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends python3 python3-dev python3-pip python3-netifaces python3-psutil \
	 net-tools nmap cython3 libudev-dev libglib2.0-dev build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip && \
    pip3 install homeassistant && \
    pip3 install netdisco && \
    pip3 install pychromecast==0.7.2 

EXPOSE 8123

VOLUME ["/data"]

ENTRYPOINT ["hass", "--config", "/data"]

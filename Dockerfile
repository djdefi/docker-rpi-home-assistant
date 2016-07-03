FROM resin/rpi-raspbian:latest

RUN sudo apt-get update
RUN sudo apt-get install -y python3-pip python3-netifaces net-tools nmap

RUN pip3 install homeassistant && \
    pip3 install --upgrade pip && \
    pip3 install netdisco && \
    pip3 install pychromecast==0.7.2 

EXPOSE 8123

VOLUME ["/data"]

ENTRYPOINT ["hass", "--config", "/data"]

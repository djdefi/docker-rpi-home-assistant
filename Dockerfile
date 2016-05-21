FROM resin/rpi-raspbian:latest

RUN sudo apt-get update
RUN sudo apt-get install -y python3-pip

RUN pip3 install homeassistant

EXPOSE 8123

VOLUME ["/data"]

ENTRYPOINT ["hass", "--config", "/data"]

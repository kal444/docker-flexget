FROM python:2
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

RUN pip install -I flexget transmissionrpc

VOLUME /config
VOLUME /data

ENTRYPOINT ["/usr/local/bin/flexget", "-c", "/config/config.yml"]
CMD ["--loglevel", "info", "daemon", "start"]

FROM python:2
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

RUN pip install -I flexget transmissionrpc

VOLUME /conf
VOLUME /data

ENTRYPOINT ["/usr/local/bin/flexget", "-c", "/conf/config.yml"]
CMD ["--loglevel", "info", "daemon", "start"]

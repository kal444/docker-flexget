FROM python:2
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

RUN pip install -I flexget transmissionrpc \
    && useradd -u 999 -r -g 100 -d /conf -s /sbin/nologin -c "flexget user" flexget \
    && chown -R flexget:100 /conf \
    && chmod 755 /conf

VOLUME /conf
VOLUME /data

USER flexget
ENTRYPOINT ["/usr/local/bin/flexget", "-c", "/conf/config.yml"]
CMD ["--loglevel", "info", "daemon", "start"]

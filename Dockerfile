FROM python:2
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

RUN pip install -I flexget transmissionrpc \
    && groupadd -r users -g 100 \
    && useradd -u 999 -r -g users -d /conf -s /sbin/nologin -c "flexget user" flexget \
    && chown -R flexget:users /conf \
    && chmod 755 /conf

VOLUME /conf
VOLUME /data

USER flexget
ENTRYPOINT ["/usr/local/bin/flexget", "-c", "/conf/config.yml"]
CMD ["--loglevel", "info", "daemon", "start"]

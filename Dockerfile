FROM python:2
MAINTAINER Kyle Huang <kyle@yellowaxe.com>

# latest version from here: https://pypi.python.org/pypi/FlexGet
ENV FLEXGET_VERSION=2.10.96

RUN pip install -I "flexget==${FLEXGET_VERSION}" \
    transmissionrpc \
  && useradd -u 999 -r -g 100 -m -d /home/flexget -s /sbin/nologin -c "flexget user" flexget \
  && chown -R flexget:100 /home/flexget \
  && chmod 755 /home/flexget \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /conf
VOLUME /data

USER flexget
ENTRYPOINT ["/usr/local/bin/flexget", "-c", "/conf/config.yml"]
CMD ["--loglevel", "info", "daemon", "start", "--autoreload-config"]

FROM        quay.io/prometheus/busybox:latest
MAINTAINER  Alexey Palazhchenko <alexey.palazhchenko@percona.com>

COPY mongodb_exporter /bin/mongodb_exporter

ENV MONGODB_URL mongodb://mongo_db:27017
EXPOSE      9216
ENTRYPOINT  [ "/bin/mongodb_exporter" ]


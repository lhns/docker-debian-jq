FROM debian

ENV CLEANIMAGE_VERSION 2.0
ENV CLEANIMAGE_URL https://raw.githubusercontent.com/LolHens/docker-cleanimage/$CLEANIMAGE_VERSION/cleanimage

ENV JQ_REF a17dd32
ENV JQ_URL https://raw.githubusercontent.com/LolHens/jq-buildenv/$JQ_REF/jq


ADD ["$CLEANIMAGE_URL", "/usr/local/bin/"]
RUN chmod +x "/usr/local/bin/cleanimage"

RUN apt update \
 && apt-get install -y \
      curl \
 && cleanimage

ADD ["JQ_URL", "/usr/bin/"]
RUN chmod +x "/usr/bin/jq"

FROM debian

ENV CLEANIMAGE_VERSION 2.0
ENV CLEANIMAGE_URL https://raw.githubusercontent.com/lhns/docker-cleanimage/$CLEANIMAGE_VERSION/cleanimage

ENV JQ_VERSION 1.7rc2
ENV JQ_URL https://github.com/jqlang/jq/releases/download/jq-${JQ_VERSION}/jq-linux-amd64

RUN apt-get update \
 && apt-get install -y curl \
 && curl -sSfLo /usr/bin/jq -- "$JQ_URL" \
 && chmod +x /usr/bin/jq \
 && curl -sSfLo /usr/bin/cleanimage -- "$CLEANIMAGE_URL" \
 && chmod +x /usr/bin/cleanimage \
 && cleanimage

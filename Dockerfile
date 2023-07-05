FROM ghcr.io/lhns/debian-jq

ENV CLEANIMAGE_VERSION 2.0
ENV CLEANIMAGE_URL https://raw.githubusercontent.com/lhns/docker-cleanimage/$CLEANIMAGE_VERSION/cleanimage

ENV GOJQ_VERSION v0.12.13
ENV GOJQ_FILE gojq_${GOJQ_VERSION}_linux_amd64
ENV GOJQ_URL https://github.com/itchyny/gojq/releases/download/$GOJQ_VERSION/${GOJQ_FILE}.tar.gz

RUN apt-get update \
 && apt-get install -y \
      curl \
 && curl -sSfL -- "$GOJQ_URL" | tar -xzf - \
 && mv "$GOJQ_FILE/gojq" /usr/bin/jq \
 && rm -Rf "$GOJQ_FILE" \
 && curl -sSfL -- "$CLEANIMAGE_URL" > "/usr/local/bin/cleanimage" \
 && chmod +x "/usr/local/bin/cleanimage" \
 && cleanimage

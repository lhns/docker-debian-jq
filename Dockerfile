FROM debian

ENV GOJQ_VERSION v0.12.12
ENV GOJQ_FILE gojq_${GOJQ_VERSION}_linux_amd64
ENV GOJQ_URL https://github.com/itchyny/gojq/releases/download/$GOJQ_VERSION/${GOJQ_FILE}.tar.gz

RUN apt-get update \
 && apt-get install --no-cache -y \
      curl \
 && curl -sSfL -- "$GOJQ_URL" | tar -xzf - \
 && mv "$GOJQ_FILE/gojq" /usr/bin/jq \
 && rm -Rf "$GOJQ_FILE"

FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

LABEL maintainer="CrazyMax" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.url="https://github.com/crazy-max/docker-7zip" \
  org.opencontainers.image.source="https://github.com/crazy-max/docker-7zip" \
  org.opencontainers.image.version=$VERSION \
  org.opencontainers.image.revision=$VCS_REF \
  org.opencontainers.image.vendor="CrazyMax" \
  org.opencontainers.image.title="7-Zip" \
  org.opencontainers.image.description="7-Zip" \
  org.opencontainers.image.licenses="MIT"

RUN apk --update --no-cache add p7zip \
  && rm -rf /var/cache/apk/* /tmp/*

CMD [ "7za", "--help" ]

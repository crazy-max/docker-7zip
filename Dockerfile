# syntax=docker/dockerfile:experimental
FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:latest

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

LABEL maintainer="CrazyMax" \
  org.label-schema.name="7zip" \
  org.label-schema.description="7-Zip" \
  org.label-schema.url="https://github.com/crazy-max/docker-7zip" \
  org.label-schema.vcs-url="https://github.com/crazy-max/docker-7zip" \
  org.label-schema.vendor="CrazyMax" \
  org.label-schema.schema-version="1.0"

RUN apk --update --no-cache add p7zip \
  && rm -rf /var/cache/apk/* /tmp/*

CMD [ "7za", "--help" ]

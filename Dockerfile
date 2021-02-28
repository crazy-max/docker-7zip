ARG P7ZIP_VERSION=16.02

FROM alpine:3.13
LABEL maintainer="CrazyMax"

ARG P7ZIP_VERSION
RUN apk --update --no-cache add \
    p7zip=${P7ZIP_VERSION}-r4 \
  && rm -rf /var/cache/apk/* /tmp/*

CMD [ "7za", "--help" ]

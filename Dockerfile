FROM alpine:3.13
LABEL maintainer="CrazyMax"

ENV P7ZIP_VERSION="16.02"

RUN apk --update --no-cache add \
    p7zip=${P7ZIP_VERSION}-r4 \
  && rm -rf /var/cache/apk/* /tmp/*

CMD [ "7za", "--help" ]

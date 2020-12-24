FROM alpine:latest
LABEL maintainer="CrazyMax"

RUN apk --update --no-cache add p7zip \
  && rm -rf /var/cache/apk/* /tmp/*

CMD [ "7za", "--help" ]

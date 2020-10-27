FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:latest

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN printf "I am running on ${BUILDPLATFORM:-linux/amd64}, building for ${TARGETPLATFORM:-linux/amd64}\n$(uname -a)\n"

LABEL maintainer="CrazyMax"

RUN apk --update --no-cache add p7zip \
  && rm -rf /var/cache/apk/* /tmp/*

CMD [ "7za", "--help" ]

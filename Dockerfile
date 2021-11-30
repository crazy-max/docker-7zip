ARG P7ZIP_VERSION="16.02"
ARG P7ZIP_RELEASE="-r4"

FROM alpine:3.15
ARG P7ZIP_VERSION
RUN apk --update --no-cache add p7zip=${P7ZIP_VERSION}${P7ZIP_RELEASE}

CMD [ "7za", "--help" ]

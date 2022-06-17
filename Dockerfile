# syntax=docker/dockerfile:1

ARG P7ZIP_VERSION=17.04
ARG ALPINE_VERSION=3.16
ARG XX_VERSION=1.1.1

FROM --platform=$BUILDPLATFORM tonistiigi/xx:${XX_VERSION} AS xx
FROM --platform=$BUILDPLATFORM alpine:${ALPINE_VERSION} AS base
COPY --from=xx / /
RUN apk --update --no-cache add clang cmake curl file make ninja pkgconf tar tree xz
ARG P7ZIP_VERSION
WORKDIR /src
RUN curl -sSL "https://github.com/jinfeihan57/p7zip/archive/v${P7ZIP_VERSION}/p7zip-v${P7ZIP_VERSION}.tar.gz" | tar xz --strip 1

FROM base AS builder
ENV XX_CC_PREFER_LINKER=ld
ARG TARGETPLATFORM
RUN xx-apk --no-cache --no-scripts add gcc g++ nasm yasm

WORKDIR /src/CPP/7zip/CMAKE
RUN cmake -Wno-dev -G Ninja -B build $(xx-clang --print-cmake-defines) \
    -DCMAKE_CXX_FLAGS="-w -s" \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX="$(xx-info sysroot)usr/local" \
    -DCMAKE_EXE_LINKER_FLAGS="-static" \
  && cmake --build build \
  && cmake --install build
RUN mkdir -p /out \
  && mv ./build/bin/7z_ /out/7z \
  && mv ./build/bin/7za /out/ \
  && mv ./build/bin/7zr /out/

FROM alpine:${ALPINE_VERSION} AS smoke
COPY --from=builder /out /usr/local/bin/
RUN 7z --help
RUN 7za --help
RUN 7zr --help

FROM alpine:${ALPINE_VERSION}
COPY --from=builder /out /usr/local/bin/
CMD [ "7za", "--help" ]

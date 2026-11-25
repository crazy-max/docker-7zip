# syntax=docker/dockerfile:1

# renovate: datasource=custom.sevenzip depName=ip7z/7zip
ARG SEVENZIP_VERSION=26.06
ARG SEVENZIP_VERSION_NUM=2606
ARG SEVENZIP_SHA256=a4e374c8f864f51df48c2cfd0e1413ec3b2ea030deae852d6a655402ebb61ac4

# Renovate follows the ${ALPINE_VERSION}-stable branch in Alpine's aports repo
# and updates the patch's last commit and file checksum together.
# renovate: datasource=custom.aports-patch depName=7-zip-musl.patch
ARG SEVENZIP_MUSL_PATCH_COMMIT=7307b5dc774c879eec0f9557806a23610b2d3c03
ARG SEVENZIP_MUSL_PATCH_SHA256=454adae60ee8113447ea4f249e619a4723cfbe5e576cdf759a4fc8cec8e3da1b

ARG ALPINE_VERSION=3.24
# renovate: datasource=docker depName=tonistiigi/xx versioning=docker
ARG XX_VERSION=1.10.0

FROM --platform=$BUILDPLATFORM tonistiigi/xx:${XX_VERSION} AS xx
FROM --platform=$BUILDPLATFORM alpine:${ALPINE_VERSION} AS base
COPY --from=xx / /
RUN apk --update --no-cache add clang file make patch tar xz
ARG SEVENZIP_VERSION
ARG SEVENZIP_VERSION_NUM
ARG SEVENZIP_SHA256
ADD --checksum=sha256:${SEVENZIP_SHA256} https://github.com/ip7z/7zip/releases/download/${SEVENZIP_VERSION}/7z${SEVENZIP_VERSION_NUM}-src.tar.xz /tmp/7zip.tar.xz
ARG SEVENZIP_MUSL_PATCH_COMMIT
ARG SEVENZIP_MUSL_PATCH_URL=https://raw.githubusercontent.com/alpinelinux/aports/${SEVENZIP_MUSL_PATCH_COMMIT}/main/7zip/7-zip-musl.patch
ARG SEVENZIP_MUSL_PATCH_SHA256
ADD --checksum=sha256:${SEVENZIP_MUSL_PATCH_SHA256} ${SEVENZIP_MUSL_PATCH_URL} /tmp/7-zip-musl.patch
WORKDIR /src
RUN <<EOT
  set -e
  tar -xJf /tmp/7zip.tar.xz
  rm /tmp/7zip.tar.xz
  patch -p1 --binary < /tmp/7-zip-musl.patch
EOT

FROM base AS builder
ENV XX_CC_PREFER_LINKER=ld
ARG TARGETPLATFORM
RUN xx-apk --no-cache --no-scripts add gcc g++ musl-dev

RUN <<EOT
  set -e
  for bundle in Alone2 Alone Alone7z; do
    make -j2 -C "CPP/7zip/Bundles/${bundle}" -f ../../cmpl_clang.mak \
      CROSS_COMPILE=xx- LOCAL_FLAGS=-D_GNU_SOURCE CFLAGS_WARN_WALL="-Wall -Wextra" \
      LDFLAGS=-static LFLAGS_STRIP=-s
  done
  mkdir -p /out
  cp CPP/7zip/Bundles/Alone2/b/c/7zz /out/
  cp CPP/7zip/Bundles/Alone/b/c/7za /out/
  cp CPP/7zip/Bundles/Alone7z/b/c/7zr /out/
  cd /out
  ln -s 7zz 7z
  for binary in 7zz 7za 7zr; do
    xx-verify --static "$binary"
  done
EOT

FROM alpine:${ALPINE_VERSION} AS smoke
COPY --from=builder /out /usr/local/bin/
RUN <<EOT
  set -eu
  cd /tmp
  7zz i > formats
  grep -w Rar formats
  grep -w Rar5 formats
  echo "7-Zip smoke test" > input
  7z a -t7z smoke.7z input
  for binary in 7zz 7za 7zr; do
    "$binary" x -so smoke.7z input > output
    cmp input output
  done
EOT

FROM alpine:${ALPINE_VERSION}
COPY --from=builder /out /usr/local/bin/
COPY --from=base /src/DOC/License.txt /usr/share/licenses/7zip/License.txt
CMD [ "7zz", "--help" ]

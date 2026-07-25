FROM debian:bookworm-slim

ARG CAMILLADSP_VERSION=4.1.3
ARG CAMILLAGUI_VERSION=4.1.0

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl libasound2 tar \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://github.com/HEnquist/camilladsp/releases/download/v${CAMILLADSP_VERSION}/camilladsp-linux-amd64.tar.gz \
    | tar -xz -C /usr/local/bin \
 && chmod +x /usr/local/bin/camilladsp

RUN mkdir -p /opt/camillagui_backend \
 && curl -fsSL https://github.com/HEnquist/camillagui-backend/releases/download/v${CAMILLAGUI_VERSION}/bundle_linux_amd64.tar.gz \
    | tar -xz -C /opt \
 && chmod +x /opt/camillagui_backend/camillagui_backend

COPY entrypoint.sh /entrypoint.sh
COPY default.yml /defaults/default.yml
RUN chmod +x /entrypoint.sh

EXPOSE 5005 1234
ENTRYPOINT ["/entrypoint.sh"]

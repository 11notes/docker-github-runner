ARG APP_VERSION=2.323.0

# :: Header
  FROM ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind:v${APP_VERSION}-ubuntu-22.04
  USER root
  COPY --chown=1001:121 ./rootfs /
  RUN set -ex; \
    chmod +x /usr/bin/startup.sh;
  USER runner
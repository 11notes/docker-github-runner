# ╔═════════════════════════════════════════════════════╗
# ║                       SETUP                         ║
# ╚═════════════════════════════════════════════════════╝
  # GLOBAL
  ARG APP_UID=1000 \
      APP_GID=1000 \
      APP_VERSION=2.323.0


# ╔═════════════════════════════════════════════════════╗
# ║                       IMAGE                         ║
# ╚═════════════════════════════════════════════════════╝
# :: HEADER
  FROM ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind:v${APP_VERSION}-ubuntu-22.04
  ENV ACTIONS_RUNNER_HOOK_JOB_COMPLETED=/usr/local/bin/cleanup.sh
  USER root
  COPY --chown=1001:121 ./rootfs /
  RUN set -ex; \
    chmod +x -R \
      /usr/bin \
      /usr/local/bin;
  USER runner
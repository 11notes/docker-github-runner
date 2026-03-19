# ╔═════════════════════════════════════════════════════╗
# ║                       SETUP                         ║
# ╚═════════════════════════════════════════════════════╝
  # GLOBAL
  ARG APP_UID=1001 \
      APP_GID=121 \
      APP_VERSION=0.0.0


# ╔═════════════════════════════════════════════════════╗
# ║                       IMAGE                         ║
# ╚═════════════════════════════════════════════════════╝
# :: HEADER
  FROM ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind:v${APP_VERSION}-ubuntu-22.04
  ARG APP_UID \
      APP_GID
  ENV ACTIONS_RUNNER_HOOK_JOB_COMPLETED=/usr/local/bin/cleanup.sh
  USER root
  COPY --chown=${APP_UID}:${APP_GID} ./rootfs /
  RUN set -ex; \
    chmod +x -R \
      /usr/bin \
      /usr/local/bin;
  USER ${APP_UID}:${APP_GID}
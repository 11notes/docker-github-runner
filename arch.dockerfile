# :: Build / runner
  FROM mcr.microsoft.com/dotnet/runtime-deps:8.0-jammy AS build
  ARG TARGETARCH
  ARG APP_VERSION
  ENV BUILD_ROOT=/actions-runner
  ENV RUNNER_CONTAINER_HOOKS_VERSION=0.6.1
  ENV DOCKER_VERSION=28.0.4
  ENV BUILDX_VERSION=0.21.2
  ENV DEBIAN_FRONTEND=noninteractive

  USER root

  RUN set -ex; \
    apt update -y; \
    apt install --no-install-recommends -y \
      curl \
      unzip; \
    mkdir -p ${BUILD_ROOT};

  RUN set -ex; \
    cd ${BUILD_ROOT}; \
    case ${TARGETARCH} in \
      amd64) \
        curl -f -L -o runner.tar.gz https://github.com/actions/runner/releases/download/v${APP_VERSION}/actions-runner-linux-x64-${APP_VERSION}.tar.gz; \
        curl -f -L -o runner-container-hooks.zip https://github.com/actions/runner-container-hooks/releases/download/v${RUNNER_CONTAINER_HOOKS_VERSION}/actions-runner-hooks-k8s-${RUNNER_CONTAINER_HOOKS_VERSION}.zip; \
        curl -fLo docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz; \
      ;; \
      arm64) \
        curl -f -L -o runner.tar.gz https://github.com/actions/runner/releases/download/v${APP_VERSION}/actions-runner-linux-arm64-${APP_VERSION}.tar.gz; \
        curl -f -L -o runner-container-hooks.zip https://github.com/actions/runner-container-hooks/releases/download/v${RUNNER_CONTAINER_HOOKS_VERSION}/actions-runner-hooks-k8s-${RUNNER_CONTAINER_HOOKS_VERSION}.zip; \
        curl -fLo docker.tgz https://download.docker.com/linux/static/stable/aarch64/docker-${DOCKER_VERSION}.tgz; \
      ;; \
    esac; \
    tar xzf ./runner.tar.gz; \
    rm runner.tar.gz; \
    unzip ./runner-container-hooks.zip -d ./k8s; \
    rm runner-container-hooks.zip; \
    tar zxvf docker.tgz; \
    rm -rf docker.tgz; \
    mkdir -p /usr/local/lib/docker/cli-plugins; \
    curl -fLo /usr/local/lib/docker/cli-plugins/docker-buildx "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-${TARGETARCH}"; \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx;

# :: Header
  FROM mcr.microsoft.com/dotnet/runtime-deps:8.0-jammy

  # :: arguments
    ARG TARGETARCH
    ARG APP_IMAGE
    ARG APP_NAME
    ARG APP_VERSION
    ARG APP_ROOT
    ARG APP_UID
    ARG APP_GID

  # :: environment
    ENV APP_IMAGE=${APP_IMAGE}
    ENV APP_NAME=${APP_NAME}
    ENV APP_VERSION=${APP_VERSION}
    ENV APP_ROOT=${APP_ROOT}

    ENV DEBIAN_FRONTEND=noninteractive
    ENV RUNNER_MANUALLY_TRAP_SIG=1
    ENV ACTIONS_RUNNER_PRINT_LOG_TO_STDOUT=1
    ENV ImageOS=ubuntu22

  # :: multi-stage
    COPY --from=build --chown=1000:123 /actions-runner ${APP_ROOT}
    COPY --from=build /usr/local/lib/docker/cli-plugins/docker-buildx /usr/local/lib/docker/cli-plugins/docker-buildx

# :: Run
  USER root

  # :: install application
    RUN set -ex; \
      apt update -y; \
      apt install --no-install-recommends -y \
        sudo \
        lsb-release \
        gpg-agent \
        software-properties-common \
        curl \
        jq \
        unzip; \
       rm -rf /var/lib/apt/lists/*;

    RUN set -ex; \
      add-apt-repository ppa:git-core/ppa; \
      apt update -y; \
      apt install --no-install-recommends -y \
        git; \
      rm -rf /var/lib/apt/lists/*;

    RUN set -ex; \
      adduser --disabled-password --gecos "" --uid 1000 runner; \
      groupadd docker --gid 123; \
      usermod -aG sudo runner; \
      usermod -aG docker runner; \
      echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers; \
      echo "Defaults env_keep += \"DEBIAN_FRONTEND\"" >> /etc/sudoers;

    RUN set -ex; \
      cd ${APP_ROOT}; \
      install -o root -g root -m 755 docker/* /usr/bin/; \
      rm -rf docker;

  # :: copy filesystem changes and set correct permissions
    COPY ./rootfs /
    RUN set -ex; \
      chmod +x -R /usr/local/bin; \
      chown -R 1000:123 \
        ${APP_ROOT};

# :: Volumes
  VOLUME ["${APP_ROOT}"]

# :: Start
  USER runner
  ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
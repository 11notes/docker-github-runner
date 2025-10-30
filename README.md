![banner](https://github.com/11notes/defaults/blob/main/static/img/banner.png?raw=true)

# GITHUB-RUNNER
![size](https://img.shields.io/docker/image-size/11notes/github-runner/2.329.0?color=0eb305)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![pulls](https://img.shields.io/docker/pulls/11notes/github-runner?color=2b75d6)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)[<img src="https://img.shields.io/github/issues/11notes/docker-github-runner?color=7842f5">](https://github.com/11notes/docker-github-runner/issues)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxyZWN0IHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgZmlsbD0idHJhbnNwYXJlbnQiLz4KICA8cGF0aCBkPSJtMTMgNmg2djdoN3Y2aC03djdoLTZ2LTdoLTd2LTZoN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+)

github runner

# SYNOPSIS 📖
**What can I do with this?** Run your own github runners fully self-hosted. Use sysbox for rootless DinD withouth exposing the socket. 

# VOLUMES 📁
* **/home/runner** - Directory of your runner data

# COMPOSE ✂️
```yaml
name: "github"
services:
  runner01:
    runtime: sysbox-runc
    cpus: "32.0"
    mem_reservation: "32G"
    mem_limit: "64G"
    image: "11notes/github-runner:2.329.0"
    environment:
      TZ: "Europe/Zurich"
      RUNNER_NAME: "runner01"
      RUNNER_REPO: "11notes/docker-node"
      RUNNER_ADMINISTRATION_TOKEN: ${RUNNER_ADMINISTRATION_TOKEN}
      RUNNER_LABELS: "x64,linux"
    volumes:
      - "var:/runner"
    restart: "always"

volumes:
  var:
```
To find out how you can change the default UID/GID of this container image, consult the [RTFM](https://github.com/11notes/RTFM/blob/main/linux/container/image/11notes/how-to.changeUIDGID.md#change-uidgid-the-correct-way).

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Will activate debug option for container image and app (if available) | |
| `RUNNER_NAME` | name of the runner | |
| `RUNNER_REPO` | username/repository (no URL required) | |
| `RUNNER_ADMINISTRATION_TOKEN` | github access token with Administration permission set to write | |

# MAIN TAGS 🏷️
These are the main tags for the image. There is also a tag for each commit and its shorthand sha256 value.

* [2.329.0](https://hub.docker.com/r/11notes/github-runner/tags?name=2.329.0)
* [latest](https://hub.docker.com/r/11notes/github-runner/tags?name=latest)

# REGISTRIES ☁️
```
docker pull 11notes/github-runner:2.329.0
docker pull ghcr.io/11notes/github-runner:2.329.0
docker pull quay.io/11notes/github-runner:2.329.0
```

# SOURCE 💾
* [11notes/github-runner](https://github.com/11notes/docker-github-runner)

# PARENT IMAGE 🏛️
* [ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind](https://github.com/actions/actions-runner-controller/blob/master/runner/actions-runner-dind.ubuntu-22.04.dockerfile)

# BUILT WITH 🧰
* [actions/runner](https://github.com/actions/actions-runner-controller)
* [11notes/util](https://github.com/11notes/docker-util)

# GENERAL TIPS 📌
> [!TIP]
>* Use a reverse proxy like Traefik, Nginx, HAproxy to terminate TLS and to protect your endpoints
>* Use Let’s Encrypt DNS-01 challenge to obtain valid SSL certificates for your services

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-github-runner/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-github-runner/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-github-runner/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).

*created 30.10.2025, 11:37:06 (CET)*
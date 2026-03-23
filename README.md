![banner](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/banner/README.png)

# GITHUB-RUNNER
![size](https://img.shields.io/badge/image_size-1GB-green?color=%2338ad2d)![5px](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/markdown/transparent5x2px.png)![pulls](https://img.shields.io/docker/pulls/11notes/github-runner?color=2b75d6)![5px](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/markdown/transparent5x2px.png)[<img src="https://img.shields.io/github/issues/11notes/docker-github-runner?color=7842f5">](https://github.com/11notes/docker-github-runner/issues)![5px](https://raw.githubusercontent.com/11notes/static/refs/heads/master/img/markdown/transparent5x2px.png)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxyZWN0IHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgZmlsbD0idHJhbnNwYXJlbnQiLz4KICA8cGF0aCBkPSJtMTMgNmg2djdoN3Y2aC03djdoLTZ2LTdoLTd2LTZoN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+)

github runner

# SYNOPSIS 📖
**What can I do with this?** Run your own github runners fully self-hosted. Use sysbox for rootless DinD withouth exposing the socket. 

# VOLUMES 📁
* **/home/runner** - Directory of your runner data

# COMPOSE ✂️
```yaml
name: "github"
services:
  runner:
    runtime: sysbox-runc
    cpus: "32.0"
    mem_reservation: "32G"
    mem_limit: "64G"
    image: "11notes/github-runner:2.333.0"
    environment:
      TZ: "Europe/Zurich"
      RUNNER_NAME: "runner"
      RUNNER_REPO: "11notes/docker-distroless"
      RUNNER_ADMINISTRATION_TOKEN: "${RUNNER_ADMINISTRATION_TOKEN}"
      RUNNER_LABELS: "x64,linux"
    volumes:
      - "runner.var:/runner"
    restart: "always"

volumes:
  runner.var:
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

* [2.333.0](https://hub.docker.com/r/11notes/github-runner/tags?name=2.333.0)

### There is no latest tag, what am I supposed to do about updates?
It is my opinion that the ```:latest``` tag is a bad habbit and should not be used at all. Many developers introduce **breaking changes** in new releases. This would messed up everything for people who use ```:latest```. If you don’t want to change the tag to the latest [semver](https://semver.org/), simply use the short versions of [semver](https://semver.org/). Instead of using ```:2.333.0``` you can use ```:2``` or ```:2.333```. Since on each new version these tags are updated to the latest version of the software, using them is identical to using ```:latest``` but at least fixed to a major or minor version. Which in theory should not introduce breaking changes.

If you still insist on having the bleeding edge release of this app, simply use the ```:rolling``` tag, but be warned! You will get the latest version of the app instantly, regardless of breaking changes or security issues or what so ever. You do this at your own risk!

# REGISTRIES ☁️
```
docker pull 11notes/github-runner:2.333.0
docker pull ghcr.io/11notes/github-runner:2.333.0
docker pull quay.io/11notes/github-runner:2.333.0
```

# SOURCE 💾
* [11notes/github-runner](https://github.com/11notes/docker-github-runner)

# PARENT IMAGE 🏛️
* [ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind](https://github.com/actions/actions-runner-controller/blob/master/runner/actions-runner-dind.ubuntu-22.04.dockerfile)

# BUILT WITH 🧰
* [actions/runner](https://github.com/actions/actions-runner-controller)
* [11notes/util](https://github.com/11notes/docker-util)

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-github-runner/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-github-runner/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-github-runner/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).

*created 23.03.2026, 14:17:35 (CET)*
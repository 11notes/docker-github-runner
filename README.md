![banner](https://github.com/11notes/defaults/blob/main/static/img/banner.png?raw=true)

# GITHUB-RUNNER
![size](https://img.shields.io/docker/image-size/11notes/github-runner/2.325.0?color=0eb305)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![version](https://img.shields.io/docker/v/11notes/github-runner/2.325.0?color=eb7a09)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![pulls](https://img.shields.io/docker/pulls/11notes/github-runner?color=2b75d6)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)[<img src="https://img.shields.io/github/issues/11notes/docker-GITHUB-RUNNER?color=7842f5">](https://github.com/11notes/docker-GITHUB-RUNNER/issues)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxyZWN0IHdpZHRoPSIzMiIgaGVpZ2h0PSIzMiIgZmlsbD0idHJhbnNwYXJlbnQiLz4KICA8cGF0aCBkPSJtMTMgNmg2djdoN3Y2aC03djdoLTZ2LTdoLTd2LTZoN3oiIGZpbGw9IiNmZmYiLz4KPC9zdmc+)

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
    deploy:
      resources:
        limits:
          cpus: '8.00'
          memory: 4G
    image: "11notes/github-runner:2.325.0"
    environment:
      TZ: "Europe/Zurich"
      RUNNER_NAME: "runner01"
      RUNNER_REPO: "11notes/docker-node"
      RUNNER_ADMINISTRATION_TOKEN: ${RUNNER_ADMINISTRATION_TOKEN}
    volumes:
      - "var:/runner"
    restart: "always"

volumes:
  var:
```

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

* [2.325.0](https://hub.docker.com/r/11notes/github-runner/tags?name=2.325.0)
* [latest](https://hub.docker.com/r/11notes/github-runner/tags?name=latest)

# REGISTRIES ☁️
```
docker pull 11notes/github-runner:2.325.0
docker pull ghcr.io/11notes/github-runner:2.325.0
docker pull quay.io/11notes/github-runner:2.325.0
```

# SOURCE 💾
* [11notes/github-runner](https://github.com/11notes/docker-GITHUB-RUNNER)

# PARENT IMAGE 🏛️
* [ghcr.io/actions-runner-controller/actions-runner-controller/actions-runner-dind](https://github.com/actions/actions-runner-controller/blob/master/runner/actions-runner-dind.ubuntu-22.04.dockerfile)

# BUILT WITH 🧰
* [actions/runner](https://github.com/actions/actions-runner-controller)
* [11notes/util](https://github.com/11notes/docker-util)

# GENERAL TIPS 📌
> [!TIP]
>* Use a reverse proxy like Traefik, Nginx, HAproxy to terminate TLS and to protect your endpoints
>* Use Let’s Encrypt DNS-01 challenge to obtain valid SSL certificates for your services

# SECURITY VULNERABILITIES REPORT ⚡
| ID | Severity | Risk | Vector | Source |
| --- | --- | --- | --- | --- |
| CVE-2024-41110 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:L/UI:N/S:C/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-41110) |
| CVE-2023-24531 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-24531) |
| CVE-2024-23653 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-23653) |
| CVE-2024-24790 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-24790) |
| CVE-2021-46848 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2021-46848) |
| CVE-2024-23652 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-23652) |
| CVE-2024-45337 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-45337) |
| CVE-2025-22871 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:N) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-22871) |
| CVE-2025-49794 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-49794) |
| CVE-2025-49796 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-49796) |
| CVE-2024-21626 | high | low | [CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:C/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:C/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-21626) |
| CVE-2025-6297 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:N](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:N) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-6297) |
| CVE-2023-39323 | high | low | [CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-39323) |
| CVE-2024-53427 | high | low | [CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-53427) |
| CVE-2016-2568 | high | low | [CVSS:3.1/AV:L/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2016-2568) |
| CVE-2017-15131 | high | low | [CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.0/AV:L/AC:L/PR:L/UI:N/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2017-15131) |
| CVE-2024-24557 | high | low | [CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-24557) |
| CVE-2016-20013 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2016-20013) |
| CVE-2017-11164 | high | low | [CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2017-11164) |
| CVE-2021-21240 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2021-21240) |
| CVE-2022-41409 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2022-41409) |
| CVE-2022-4899 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2022-4899) |
| CVE-2023-39325 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-39325) |
| CVE-2023-44487 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-44487) |
| CVE-2023-45142 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-45142) |
| CVE-2023-45285 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-45285) |
| CVE-2023-45288 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-45288) |
| CVE-2023-47108 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2023-47108) |
| CVE-2024-21538 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-21538) |
| CVE-2024-24784 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:N](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:H/A:N) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-24784) |
| CVE-2024-24786 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-24786) |
| CVE-2024-24791 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-24791) |
| CVE-2024-34156 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-34156) |
| CVE-2024-34158 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-34158) |
| CVE-2024-41996 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-41996) |
| CVE-2025-22869 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-22869) |
| CVE-2025-23166 | high | low | [CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-23166) |
| CVE-2025-30204 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-30204) |
| CVE-2025-48060 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-48060) |
| CVE-2025-49795 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-49795) |
| CVE-2025-6021 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-6021) |
| CVE-2024-23651 | high | low | [CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-23651) |
| CVE-2025-5222 | high | low | [CVSS:3.1/AV:L/AC:H/PR:N/UI:R/S:U/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:H/PR:N/UI:R/S:U/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2025-5222) |

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-github-runner/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-github-runner/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-github-runner/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).

*created 10.07.2025, 01:37:45 (CET)*
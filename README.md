![banner](https://github.com/11notes/defaults/blob/main/static/img/banner.png?raw=true)

# GITHUB-RUNNER
[<img src="https://img.shields.io/badge/github-source-blue?logo=github&color=040308">](https://github.com/11notes/docker-GITHUB-RUNNER)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![size](https://img.shields.io/docker/image-size/11notes/github-runner/2.323.0?color=0eb305)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![version](https://img.shields.io/docker/v/11notes/github-runner/2.323.0?color=eb7a09)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![pulls](https://img.shields.io/docker/pulls/11notes/github-runner?color=2b75d6)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)[<img src="https://img.shields.io/github/issues/11notes/docker-GITHUB-RUNNER?color=7842f5">](https://github.com/11notes/docker-GITHUB-RUNNER/issues)![5px](https://github.com/11notes/defaults/blob/main/static/img/transparent5x2px.png?raw=true)![swiss_made](https://img.shields.io/badge/Swiss_Made-FFFFFF?labelColor=FF0000&logo=data:image/svg%2bxml;base64,PHN2ZyB2ZXJzaW9uPSIxIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAwIDMyIDMyIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxwYXRoIGQ9Im0wIDBoMzJ2MzJoLTMyeiIgZmlsbD0iI2YwMCIvPjxwYXRoIGQ9Im0xMyA2aDZ2N2g3djZoLTd2N2gtNnYtN2gtN3YtNmg3eiIgZmlsbD0iI2ZmZiIvPjwvc3ZnPg==)

github runner

# MAIN TAGS 🏷️
These are the main tags for the image. There is also a tag for each commit and its shorthand sha256 value.

* [2.323.0](https://hub.docker.com/r/11notes/github-runner/tags?name=2.323.0)
* [latest](https://hub.docker.com/r/11notes/github-runner/tags?name=latest)

# REPOSITORIES ☁️
```
docker pull 11notes/github-runner:2.323.0
docker pull ghcr.io/11notes/github-runner:2.323.0
docker pull quay.io/11notes/github-runner:2.323.0
```

# SYNOPSIS 📖
**What can I do with this?** Run your own github runners fully self-hosted.

# VOLUMES 📁
* **/home/runner** - Directory of your runner data

# COMPOSE ✂️
```yaml
name: "docker-node"
services:
  runner01:
    deploy:
      resources:
        limits:
          cpus: '24.00'
          memory: 16G
        reservations:
          cpus: '1.00'
          memory: 1G
    image: "11notes/github-runner:2.323.0"
    container_name: "docker-node-runner01"
    hostname: "docker-node-runner01"
    environment:
      TZ: "Europe/Zurich"
      GITHUB_REPOSITORY: "11notes/docker-node"
      GITHUB_TOKEN: ${GITHUB_TOKEN}
    volumes:
      - "/run/docker.sock:/var/run/docker.sock:ro"
      - "var:/home/runner"
    restart: "always"

volumes:
  var:
```

# ENVIRONMENT 📝
| Parameter | Value | Default |
| --- | --- | --- |
| `TZ` | [Time Zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) | |
| `DEBUG` | Will activate debug option for container image and app (if available) | |
| `GITHUB_REPOSITORY` | username/repository (no URL required) | |
| `GITHUB_TOKEN` | github access token with Administration permission set to write | |

# SOURCE 💾
* [11notes/github-runner](https://github.com/11notes/docker-GITHUB-RUNNER)

# PARENT IMAGE 🏛️
* [mcr.microsoft.com/dotnet/runtime-deps](https://hub.docker.com/r/microsoft/dotnet-runtime-deps/)

# BUILT WITH 🧰
* [actions/runner](https://github.com/actions/runner)
* [11notes/util](https://github.com/11notes/docker-util)

# GENERAL TIPS 📌
> [!TIP]
>* Use a reverse proxy like Traefik, Nginx, HAproxy to terminate TLS and to protect your endpoints
>* Use Let’s Encrypt DNS-01 challenge to obtain valid SSL certificates for your services

# SECURITY VULNERABILITIES REPORT ⚡
| ID | Severity | Risk | Vector | Source |
| --- | --- | --- | --- | --- |
| CVE-2021-46848 | critical | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2021-46848) |
| CVE-2024-53427 | high | low | [CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-53427) |
| CVE-2016-2568 | high | low | [CVSS:3.1/AV:L/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2016-2568) |
| CVE-2016-20013 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2016-20013) |
| CVE-2017-11164 | high | low | [CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.0/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2017-11164) |
| CVE-2021-21240 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2021-21240) |
| CVE-2022-41409 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2022-41409) |
| CVE-2022-4899 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2022-4899) |
| CVE-2024-21538 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-21538) |
| CVE-2024-41996 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-41996) |
| CVE-2024-8176 | high | low | [CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H) | [nvd.nist.gov](https://nvd.nist.gov/vuln/detail/CVE-2024-8176) |

# ElevenNotes™️
This image is provided to you at your own risk. Always make backups before updating an image to a different version. Check the [releases](https://github.com/11notes/docker-github-runner/releases) for breaking changes. If you have any problems with using this image simply raise an [issue](https://github.com/11notes/docker-github-runner/issues), thanks. If you have a question or inputs please create a new [discussion](https://github.com/11notes/docker-github-runner/discussions) instead of an issue. You can find all my other repositories on [github](https://github.com/11notes?tab=repositories).

*created 08.04.2025, 00:07:44 (CET)*
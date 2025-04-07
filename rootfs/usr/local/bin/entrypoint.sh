#!/bin/bash
  if [ -z "${1}" ]; then
    RUNNER_TOKEN=$(curl -X POST -H "Authorization: token ${GITHUB_TOKEN}" -H "Accept: application/vnd.github+json" https://api.github.com/repos/${GITHUB_REPOSITORY}/actions/runners/registration-token | jq .token --raw-output)
    
    if ! [ -f ${APP_ROOT}/svc.sh ]; then
      ${APP_ROOT}/config.sh --unattended --url https://github.com/${GITHUB_REPOSITORY} --token ${RUNNER_TOKEN}
    fi

    remove(){
      if [ -f ${APP_ROOT}/svc.sh ]; then
        ${APP_ROOT}/config.sh remove --unattended --token ${RUNNER_TOKEN}
        rm -rf ${APP_ROOT}/svc.sh
      fi
      exit 0
    }

    trap "remove" SIGINT
    trap "remove" SIGQUIT
    trap "remove" SIGTERM

    set -- "${APP_ROOT}/run.sh"
  fi

  exec "$@"
#!/usr/bin/env bash

DIR=$(readlink -e $(dirname $0))
SUDO_CMD=$(test -w /var/run/docker.sock || echo sudo)
PROJECT_DIR="/puppeteer"

node() {
    local base_dir=$(dirname ${DIR})
    local work_dir=$(pwd | sed "s:${base_dir}:${PROJECT_DIR}:")

    if [[ ${work_dir} = $(pwd) ]]; then
        work_dir="${PROJECT_DIR}"
    fi

    ${SUDO_CMD} docker run --cap-add all \
        -it \
        --rm \
        -v ${NPM_HOME}:/.npm \
        -v ${NPM_HOME}:/home/node/.npm \
        -v ${HOME}/.ssh:/.ssh \
        -v ${HOME}/.ssh:/home/node/.ssh \
        -v ${DIR}:${PROJECT_DIR} \
        -w ${work_dir} \
        -u $(id -u) \
        --network pdfgen \
        buildkite/puppeteer \
        $@
}

node node pdf.js
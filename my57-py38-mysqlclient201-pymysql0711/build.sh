#!/bin/env bash
# Builds a debian bullseye image suitable for use with ansible-test
# Based on https://github.com/ansible-community/images
set -ex

SCRIPT_DIR=$(cd `dirname $0` && pwd -P)
DEPENDENCIES="$(cat ${SCRIPT_DIR}/dependencies.txt | tr '\n' ' ')"

build=$(buildah from quay.io/ansible/ubuntu1804-test-container:main)
buildah run "${build}" -- /bin/bash -c "apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y --no-install-recommends && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ${DEPENDENCIES} && apt-get clean && rm -rf /var/lib/apt/lists/*"

# Extra python dependencies
buildah run --volume ${SCRIPT_DIR}:/tmp/src:z "${build}" -- /bin/bash -c "python3.8 -m pip install -r /tmp/src/requirements.txt"

# # Ansible-specific setup:
# buildah run "${build}" -- /bin/bash -c "ln -s /lib/systemd/systemd /sbin/init"
# buildah run "${build}" -- /bin/bash -c "rm /etc/apt/apt.conf.d/docker-clean"
# buildah run "${build}" -- /bin/bash -c "ssh-keygen -A && sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/' /etc/sudoers"
# buildah run "${build}" -- /bin/bash -c "mkdir -p /etc/ansible && echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts"
# buildah run "${build}" -- /bin/bash -c "sed /etc/locale.gen -i -e 's/# en_US\\.UTF-8/en_US.UTF-8/'"
# buildah run "${build}" -- /bin/bash -c "locale-gen"
# buildah run "${build}" -- /bin/bash -c "update-locale LANG=en_US.UTF-8"

buildah config --env container=docker "${build}"
buildah config --cmd "/sbin/init" "${build}"
buildah commit "${build}" "${1:-localhost/my57-py38-mysqlclient201-pymysql0711:0.0.1}"

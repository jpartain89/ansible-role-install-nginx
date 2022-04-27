#!/usr/local/env bash
set -e

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

if [[ $(lsb_release -sc) == "focal" ]]; then
    OS_VERS=bullseye
fi

${SUDO} apt-get update
${SUDO} apt-get -y install apt-transport-https lsb-release ca-certificates curl
${SUDO} curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ ${OS_VERS} main" | ${SUDO} tee /etc/apt/sources.list.d/php.list
${SUDO} apt-get update

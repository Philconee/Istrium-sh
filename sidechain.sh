#!/usr/bin/env bash

read -p "First launch ? [y/N]: " choice
if [[ "$choice" =~ ^(yes|y) ]]; then
    sudo apt-get install curl
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    source ~/.profile
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install 8.9.1
    sudo apt-get install -y jq git
    sudo apt-get install libusb-1.0-0-dev
fi

[[ "${DEBUG}" == 'true' ]] && set -o xtrace
set -o errexit
set -o pipefail
set -o noclobber

shopt -s extglob

readonly __dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly __file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
readonly __base="$(basename ${__file} .sh)"
readonly __root="$(cd "$(dirname "${__dir}")" && pwd)"
readonly __manifest="${__dir}/manifest.json"

readonly -a DEPENDENCIES_PROGRAMS=('postgresql postgresql-contrib libpq-dev build-essential python git curl jq libtool autoconf locales automake locate zip unzip htop nmon iftop pkg-config libcairo2-dev libgif-dev git curl')
readonly -a DEPENDENCIES_NODEJS=('forever grunt-cli node-sass angular-cli')

source "${__dir}/bootstrap/lib.sh"
source "${__dir}/bootstrap/app.sh"

main()
{
    parse_args "$@"

    trap cleanup SIGINT SIGTERM SIGKILL
}

[[ "$0" == "$BASH_SOURCE" ]] && main "$@"

#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function output() {
    local message="${1:-}"
    local level=$(echo "${2:-info}" | awk '{print toupper($0)}')
    
    echo "[${level}] ${message}"
}

function preconditions() {
    if [[ $BASH_VERSINFO -lt 4 ]]; then
        output "Bash version >= 4 required." "error"
        return 1
    fi

    local unamestr=$(uname)
    if [[ "${unamestr}" != "Darwin" ]]; then
        output "Only Mac OS is supported at this time" "error"
        return 1
    fi
}

function symlink() {
    local source="${DIR}/${1}"
    local dest=$2

    if [ -f "${dest}/${1}" ] || [ -L "${dest}/${1}" ]; then
        output "Removing '${dest}/${1}'" "warning"
        rm "${dest}/${1}"
    fi

    output "Symlinking '${source}' to '${dest}'"
    ln -s "${source}" "${dest}"
}

function main() {
    preconditions

    symlink .bashrc "${HOME}"
    symlink .vimrc "${HOME}"
}

main

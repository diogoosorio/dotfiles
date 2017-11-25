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
        output "Replacing '${dest}/${1}'" "warning"
        rm "${dest}/${1}"
    fi

    ln -s "${source}" "${dest}"
}

function install_dependencies() {
    if [ ! -f "${HOME}/.fzf.bash" ]; then
        brew install fzf
        $(brew --prefix)/opt/fzf/install
    fi

    if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
        output "Installed the Tmux Plugin Manager. Please run C-I after the setup is finished to install the plugins."
    fi

    brew install reattach-to-user-namespace
    brew install ack

    if [ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
    fi
}

function main() {
    preconditions

    install_dependencies

    symlink .bashrc $HOME
    symlink .vimrc $HOME
    symlink .tmux.conf $HOME
    symlink .ackrc $HOME

    if [ ! -f "${HOME}/.bash_profile" ]; then
        echo "source ${HOME}/.bashrc" > "${HOME}/.bash_profile"
    fi
}

main

export PATH="/usr/local/bin:${PATH}"
export PS1=$'\e[1;34m[\D{%H:%M:%S}] \e[m\w $(status) \e[m$ '

function status() {
    if [[ $? -eq 0 ]]; then
        echo $'\e[1;32m\u25CF'
    else
        echo $'\e[1;31m\u25CF'
    fi
}

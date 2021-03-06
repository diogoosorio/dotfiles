export PATH="/usr/local/bin:${HOME}/.rbenv/bin:${PATH}"
export PROMPT_COMMAND=bash_prompt
export TERM=screen-256color
export EDITOR=vim
export VISUAL="${EDITOR}"

function status_icon() {
    if [ $? -eq 0 ]; then
        echo $'\[\e[1;32m\]\xE2\x97\x8F\[\e[0m\]'
    else
        echo $'\[\e[1;31m\]\xE2\x97\x8F\[\e[0m\]'
    fi
}

function bash_prompt() {
    local status=$(status_icon)

    PS1="\[\e[1;34m\][\D{%H:%M:%S}] \[\e[m\]\w ${status} $ "
}

# load fzf
[ -f "${HOME}/.fzf.bash" ] && source "${HOME}/.fzf.bash"

# load rbenv
[ -f "${HOME}/.rbenv/bin/rbenv" ] && eval "$(rbenv init -)"

DOTFILES_DIR="${HOME}/dotfiles"

source "${DOTFILES_DIR}/bash/z.sh"
source "${DOTFILES_DIR}/bash/up.sh"
source "${DOTFILES_DIR}/bash/base.sh"
source "${DOTFILES_DIR}/bash/git-completion.bash"

if [ -f "${HOME}/.bash.env" ]; then
  source "${HOME}/.bash.env"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

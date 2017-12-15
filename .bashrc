DOTFILES_DIR="${HOME}/dotfiles"

source "${DOTFILES_DIR}/bash/z.sh"
source "${DOTFILES_DIR}/bash/up.sh"
source "${DOTFILES_DIR}/bash/base.sh"
source "${DOTFILES_DIR}/bash/git-completion.bash"

if [ -f "${HOME}/.bash.env" ]; then
  source "${HOME}/.bash.env"
fi

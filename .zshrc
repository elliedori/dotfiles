# ZSH CONFIG
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="half-life"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ENV SETUP
export PATH=/opt/homebrew/bin:$PATH
export PATH=~/.local:$PATH

# CUSTOM COMMANDS
current_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

gpoc() {
  cmd="git push origin `current_branch`"
  echo "Executing command..."
  echo "$cmd"
  eval $cmd
}

gpoc-f() {
  cmd="git push origin `current_branch` -f"
  echo "Executing command..."
  echo "$cmd"
  eval $cmd
}

# ALIASES
alias gsl="git stash list"
alias gaa="git add --all"
alias gap="git add --patch"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gst="git status"
alias gdf="git diff"
alias gbr="git branch"
alias glo="git log --oneline"
alias gdb="git branch -D"
alias grm="git rebase main"
alias gco="git checkout"
alias gpo="git push origin"
alias c="clear"

# WORK ALIASES
alias watch="make unit-test-watch"
alias types="turbo generate-types"
alias run="make dev-start-web"
alias story="make dev-storybook"
alias status="scripts/deployments/is_pr_deployed.sh"
alias status="scripts/deployments/is_pr_deployed.sh"
alias ext-run="yarn workspace @vanta/qauto-browser-extension run dev --mode"
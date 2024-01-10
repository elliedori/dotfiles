# ZSH CONFIG
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git)
source $ZSH/oh-my-zsh.sh

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
alias grm="git rebase master"
alias gco="git checkout"
alias gpo="git push origin"
alias c="clear"
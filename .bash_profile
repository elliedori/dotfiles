#SETUP

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export PATH=/opt/homebrew/bin:$PATH

# set default editor to Vim
export EDITOR=vim

# # PROMPT CUSTOMIZATION

# # A more colorful prompt
# # \[\e[0m\] resets the color to default color
# c_reset='\[\e[0m\]'
# #  \e[0;31m\ sets the color to red
# c_path='\[\e[0;31m\]'
# # \e[0;32m\ sets the color to green
# c_git_clean='\[\e[0;32m\]'
# # \e[0;31m\ sets the color to red
# c_git_dirty='\[\e[0;31m\]'

# # PS1 is the variable for the prompt you see everytime you hit enter
# PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

# export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# # Determines if the git branch you are on is clean or dirty
# git_prompt ()
# {
#   if ! git rev-parse --git-dir > /dev/null 2>&1; then
#     return 0
#   fi
#   # Grab working branch name
#   git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
#   # Clean or dirty branch
#   if git diff --quiet 2>/dev/null >&2; then
#     git_color="${c_git_clean}"
#   else
#     git_color=${c_git_dirty}
#   fi
#   echo " [$git_color$git_branch${c_reset}]"
# }

# # Colors ls should use for folders, files, symlinks etc, see `man ls` and
# # search for LSCOLORS
# export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# # Force ls to use colors (G) and use humanized file sizes (h)
# alias ls='ls -Gh'

# # Force grep to always use the color option and show line numbers
# export GREP_OPTIONS='--color=always'

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

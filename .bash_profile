#SETUP

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Display user & host info at start of session
echo "Loading ~/.bash_profile a shell script that runs in every new terminal you open"
echo "Logged in as $USER at $(hostname)"

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
test -s $git_completion_script && source $git_completion_script

# Keep SSH agent active between terminal sessions
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi

# Load ssh key at start of each session
ssh-add -A &> /dev/null

# Mark landing-pages repo as safe
PATH=".git/safe/../../bin:$PATH"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# set default editor to Sublime
export EDITOR=vim

# --------------------------------------------------------------------------------------------------------------------- #

# PROMPT CUSTOMIZATION

# A more colorful prompt
# \[\e[0m\] resets the color to default color
c_reset='\[\e[0m\]'
#  \e[0;31m\ sets the color to red
c_path='\[\e[0;31m\]'
# \e[0;32m\ sets the color to green
c_git_clean='\[\e[0;32m\]'
# \e[0;31m\ sets the color to red
c_git_dirty='\[\e[0;31m\]'

# PS1 is the variable for the prompt you see everytime you hit enter
PROMPT_COMMAND='PS1="${c_path}\W${c_reset}$(git_prompt) :> "'

export PS1='\n\[\033[0;31m\]\W\[\033[0m\]$(git_prompt)\[\033[0m\]:> '

# Determines if the git branch you are on is clean or dirty
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  git_branch=$(Git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  # Clean or dirty branch
  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi
  echo " [$git_color$git_branch${c_reset}]"
}

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex
# Force ls to use colors (G) and use humanized file sizes (h)
alias ls='ls -Gh'

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'

# --------------------------------------------------------------------------------------------------------------------- #

# CUSTOM COMMANDS

# The subl command works through a symlink now, keeping this for reference
# alias subl="open -a /Applications/Sublime\ Text.app/"

alias be="bundle exec"

alias gsl="git stash list"
alias gaa="git add --all"
alias gcm="git commit -m"
alias gst="git status"
alias gdf="git diff"
alias gbr="git branch"
alias glo="git log --oneline"
alias gdb="git branch -D"
alias grm="git rebase master"
alias gco="git checkout"
alias gpo="git push origin"

run() { cd ~/Dev/kufak-suite; echo "Starting invoker safely..."; pkill puma; pkill unicorn;  invoker start; }

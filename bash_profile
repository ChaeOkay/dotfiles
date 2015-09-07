git_dirty_indicator()
{
  git_status=$(git status --porcelain 2> /dev/null)
  [ $? -ne 0 ] && return

  if [ -z "$git_status" ]
  then
    echo "\[\e[1;32m\]●\[\e[m\] "
  else
    echo "\[\e[1;31m\]●\[\e[m\] "
  fi
}

git_branch()
{
  git_branch2=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  [ $? -ne 0 ] && return

  echo "\[\e[0;34m\]$git_branch2\[\e[m\] "
}

bash_prompt()
{
  ruby_version="\[\e[0;35m\]$(ruby --version | awk '{print $2}')\[\e[m\]"
  arrow="\[\e[0;33m\]»\[\e[m\]"
  path="\[\e[0;32m\]\w\[\e[m\]"

  if [ -n "$SSH_CLIENT" ]; then
    host="\[\e[0;35m\]\h:\[\e[m\] "
  fi

  PS1="$host$(git_dirty_indicator)$(git_branch)$path $arrow "
}

PROMPT_COMMAND=bash_prompt

alias v='vim'
alias gi='git'
alias gd='git diff'
alias gdc='git diff cached'
alias gri='git rebase -i'
alias go='git checkout'
alias gob='git checkout -b'
alias gs='git status'
alias gst='git stash'
alias gc='git commit'
alias ga='git add'
alias gl='git log'
alias gprune='git fetch --prune && git branch --merged | grep -v "*" | xargs -n 1 git branch -d'

source ~/.bashrc

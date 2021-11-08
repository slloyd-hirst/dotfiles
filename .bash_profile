export EDITOR=vim

if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  source /usr/local/git/contrib/completion/git-completion.bash
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  export GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[01;33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
  source ~/.git-prompt.sh
fi

set_term_title(){
  echo -en "\033]0;$1\a"
}

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias pom='git pull origin master'
alias yolo='git push origin master'
alias git_cleanup='git br --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias be='bundle exec'
alias b='bundle'
alias spart='cd ~/Development/sage_one_advanced'
alias gacui='cd ~/Development/s1_gac_ui'
alias sop='cd ~/Development/sop'

alias rsi='ENVIRONMENT=development bundle exec rspec --tag integration'
alias rsapi='ENVIRONMENT=development bundle exec rspec --tag api_requests'

# Directory Nav
alias ..="cd .."
alias ...="cd ../.."

function commit() {
  git commit $@;
  parrot --loops=2;
}

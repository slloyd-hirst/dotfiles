eval "$(rbenv init -)"

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH # get mysql client/gem to work - http://stackoverflow.com/questions/10557507/rails-mysql-on-osx-library-not-loaded-libmysqlclient-18-dylib

#export http_proxy="http://lon1.sme.zscaler.net:80"
#export https_proxy="http://lon1.sme.zscaler.net:9480"
export no_proxy=127.0.0.1
export DEFERRED_GARBAGE_COLLECTION=true
export EDITOR=vim
export gem_server='http://sage:soppass@gems.platform.sageone.com/'

if [ -f ~/.git-completion.sh ]; then
  source ~/.git-completion.sh
fi

if [ -f ~/.git-prompt.sh ]; then
  export GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[01;33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
  source ~/.git-prompt.sh
fi

set_term_title(){
  echo -en "\033]0;$1\a"
}

# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RBENV_ROOT=/usr/local/opt/rbenv

export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export MYSQL_USERNAME='fuji'
export MYSQL_PASSWORD='yama'

# AB Service
export FEATURE_SERVER='http://localhost:3004/feature_request' # This is for localhost abserver port
export REDIS_URL='http://localhost:6379' # This is the localhost port of the redis-server
export SIGNER_KEY='HZXJBnvBdXaW7ghLVWwpxmapQaJai2Lr' # This is from https://github.com/Sage/abservice/blob/master/server/config/secrets.yml#L15

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias yolo='git push origin master'
alias git_cleanup='git br --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias be='bundle exec'
alias rake='noglob bundle exec rake'
alias clean_assets='bundle exec rake assets:clean RAILS_ENV=development'
alias fudgy='bundle exec fudge build'
alias spart='cd ~/development/sage_one_advanced'
alias sop='cd ~/development/sop'
alias usa='cd ~/development/sage_one_gac_us'
alias uk='cd ~/development/sage_one_gac_uki'
alias canada='cd ~/development/sage_one_gac_ca'
alias germany='cd ~/development/sage_one_gac_de'
alias b='bundle'

alias gac='cd ~/development/sage_one_advanced/host_app && be rails s'
alias ms1='cd ~/development/mysageone_uk/host_app && be rails s'

# MySql
alias mysql_start='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysql_stop='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mysql_restart='sudo /usr/local/mysql/support-files/mysql.server restart'

# Directory Nav
alias ..="cd .."
alias ...="cd ../.."

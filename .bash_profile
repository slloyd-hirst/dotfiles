eval "$(rbenv init -)"

export no_proxy=127.0.0.1
export DEFERRED_GARBAGE_COLLECTION=true
export EDITOR=vim
export LOG_LEVEL=debug

export CUSTOMER_STATEMENTS_REPORT_ENABLED=true
export CASHBOOK_REPORT_ENABLED=true
export SUPPLIER_TAX_ENABLED=true
export INTELLIGENCE_ACTIVE=true
export INTEGRATION_CLOUD_ENABLED=true
export CDN_URL=dev
export MS1_MODE='legacy'
export S1_SSO_KEY='SSO_KEY'
export S1_AUTH_DOMAIN='lvh.me'
export S1_AUTH_HMAC_SECRET='newSecretK3y'
export S1_AUTH_KEY='n3wAuthK3y'
export S1_CSRF_KEY='XCSRFTOKEN'
export S1_AB_SERVICE_HOST='http://ab.service.dev-sageone.com:2010'
export SHOW_S1_ARTEFACTS_B_PATH=true
export BANKING_CLOUD_NEW_UI=true

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

export MYSQL_USERNAME='fuji'
export MYSQL_PASSWORD='yama'

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
alias jobs='bundle exec rake jobs:work'
alias rake='noglob bundle exec rake'
alias clean_assets='bundle exec rake assets:clean RAILS_ENV=development'
alias fudgy='bundle exec fudge build'
alias spart='cd ~/development/sage_one_advanced'
alias gacui='cd ~/development/s1_gac_ui'
alias sop='cd ~/development/sop'

alias gac='cd ~/development/sage_one_advanced/host_app && ENVIRONMENT=development bundle exec thin start -p 3032 --threaded'
alias gac_dj='cd ~/development/sage_one_advanced/host_app && ENVIRONMENT=development bundle exec rake jobs:work'
alias gac_gateway='cd ~/development/s1_gac_gateway_service && GAC_SERVER=http://accounts-extra.lvh.me:3032 bundle exec rails s'
alias addons='cd ~/development/sage_one_addons/host_app && BCDATABASE_PATH=../bcdatabase_dev REDIS_URL=redis://localhost:6379/0/cache bundle exec rails s'
alias addons_dj='cd ~/development/sage_one_addons/host_app && BCDATABASE_PATH=../bcdatabase_dev REDIS_URL=redis://localhost:6379/0/cache bundle exec rake jobs:work'
alias ms1_uk='cd ~/development/mysageone_uk/host_app && BCDATABASE_PATH=../bcdatabase_dev S1_MOCK_ENV=true bundle exec thin start -p 3000 --threaded'
alias ms1_uk_dj='cd ~/development/mysageone_uk/host_app && BCDATABASE_PATH=../bcdatabase_dev S1_MOCK_ENV=true bundle exec rake jobs:work'
alias ms1_ca='cd ~/development/mysageone_ca/host_app && S1_NAMESPACE=cbc_development ENVIRONMENT=development CBC_MODE=false QUEUE_PROVIDER=RabbitMQ MQ_ENDPOINT=foo bundle exec rails s'
alias ms1_ca_dj='cd ~/development/mysageone_ca/host_app && S1_NAMESPACE=cbc_development ENVIRONMENT=development CBC_MODE=false QUEUE_PROVIDER=RabbitMQ MQ_ENDPOINT=foo bundle exec rake jobs:work'
alias ms1_us='cd ~/development/mysageone_us/host_app && S1_NAMESPACE=cbc_development ENVIRONMENT=development CBC_MODE=false QUEUE_PROVIDER=RabbitMQ MQ_ENDPOINT=foo bundle exec rails s'
alias ms1_us_dj='cd ~/development/mysageone_us/host_app && S1_NAMESPACE=cbc_development ENVIRONMENT=development CBC_MODE=false QUEUE_PROVIDER=RabbitMQ MQ_ENDPOINT=foo bundle exec rake jobs:work'
alias rsi='ENVIRONMENT=development bundle exec rspec --tag integration'
alias rsapi='ENVIRONMENT=development bundle exec rspec --tag api_requests'
alias pdf='cd ~/development/sage_one_advanced/host_app && bundle exec fuji_pdf_server start'
alias rs='bundle exec rspec'

# Directory Nav
alias ..="cd .."
alias ...="cd ../.."

function docker_start() {
  docker-machine start default
  docker-machine env
  eval "$(docker-machine env default)"
  eval "$(aws ecr get-login --region eu-west-1)"
}

function commit() {
  git commit $@;
  parrot --loops=2;
}

function new_mtd_user() {
  curl -X POST \
    https://test-api.service.hmrc.gov.uk/create-test-user/organisations \
    -H 'Accept: application/vnd.hmrc.1.0+json' \
    -H 'Authorization: Bearer 1d634b850233cf92f657e2249905c' \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -H 'Postman-Token: 600bb611-b77e-4cfc-b407-bd0d2abbbbfc' \
    -d '{ "serviceNames": [ "submit-vat-returns", "mtd-vat"]}'
}

function new_mtd_not_authed_user() {
  curl -X POST \
    https://test-api.service.hmrc.gov.uk/create-test-user/organisations \
    -H 'Accept: application/vnd.hmrc.1.0+json' \
    -H 'Authorization: Bearer 1d634b850233cf92f657e2249905c' \
    -H 'Cache-Control: no-cache' \
    -H 'Content-Type: application/json' \
    -H 'Postman-Token: 600bb611-b77e-4cfc-b407-bd0d2abbbbfc' \
    -d '{ "serviceNames": [ "submit-vat-returns" ]}'
}

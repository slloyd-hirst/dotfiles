# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Set title to "Peppermint Terminal"
PROMPT_COMMAND='echo -ne "\033]0;Peppermint Terminal\007"'

# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi

        if [[ ${EUID} == 0 ]] ; then
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[02;33m\] \w \$\[\033[00m\] '
        else
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
        fi

        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# sudo hint
#if [ ! -e $HOME/.sudo_as_admin_successful ]; then
#    case " $(groups) " in *\ admin\ *)
#    if [ -x /usr/bin/sudo ]; then
#	cat <<-EOF
#	To run a command as administrator (user "root"), use "sudo <command>".
#	See "man sudo_root" for details.

#	EOF
#    fi
#    esac
#fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

export PATH="/home/developer/.rbenv/bin:/home/developer/.rbenv/shims:/home/developer/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# ===============================================================================
# Sage Customisation
#   These are some bash defaults we setup for you

source ~/.git-completion.sh
source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[01;33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '
export BUNDLE_SAGEONEGEMS__JFROG__IO=
export BUNDLE_GEMS__RAILSLTS__COM=

alias docker_stats='docker stats $(docker ps --format={{.Names}})'
alias aws_login='$(aws ecr get-login --no-include-email)'
alias docker_stop='docker stop $(docker ps -a -q)'
alias portainer='docker run --rm --label service=portainer -p 9000:9000 --name portainer -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/portainer:/data portainer/portainer -l service=portainer --no-auth'

# ===============================================================================
eval "$(rbenv init -)"

# Customisations
export EDITOR=vim
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g='git'
alias pom='git pull origin master'
alias yolo='git push origin master'
alias git_cleanup='git br --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias spart='cd ~/Development/sage_one_advanced'
alias gacui='cd ~/Development/s1_gac_ui'
alias sop='cd ~/Development/sop'
alias ..="cd .."
alias ...="cd ../.."
alias hub='sudo hub'

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


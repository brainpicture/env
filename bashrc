# ~/.bashrc: executed by bash(1) for non-login shells.
export PS1='\h:\w\$ '
umask 022

export LC_ALL=C

export TERM=xterm-256color

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\],--[\[\033[01;37m\]$LINENO\[\033[00;36m\]]-----(\[\033[01;33m\]\u\[\033[00;36m\])------(\[\033[01;36m\]\t\[\033[00;36m\])\n\[\033[36m\]\`--:\[\033[01;31m\]\w> \[\033[00m\]'

alias branch='git branch'
alias checkout='git checkout'
alias master='git checkout master'
alias feature='git checkout feature'
alias merge='git merge'
alias stash='git stash'
alias diff='git diff'
alias track='git commit --amend'
alias sshwatch='node ~/env/watch.js'

export GIT_MERGE_AUTOEDIT='no'

function passgen {
  MAXSIZE=$(($*))
  if [ $MAXSIZE == 0  ]
  then
    MAXSIZE=8
  fi
  array1=(
  w e r t y u p a s d f h j k z x c v b m Q W E R T Y U P A D
  F H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0
  )

  MODNUM=${#array1[*]}

  pwd_len=0

  while [ $pwd_len -lt $MAXSIZE  ]
  do
    index=$(($RANDOM%$MODNUM))
    password="${password}${array1[$index]}"
    ((pwd_len++))
  done
  echo $password
}

function ru {
    str=$*
    curl -s "http://api.microsofttranslator.com/V2/Http.svc/Translate?appId=C21742C60D890BCA6B3819EDAD45B74C77A25658&text=${str// /+}&from=en&to=ru" | sed 's/<[^>]*>//g'
}

function en {
    str=$*
    curl -s "http://api.microsofttranslator.com/V2/Http.svc/Translate?appId=C21742C60D890BCA6B3819EDAD45B74C77A25658&text=${str// /+}&from=ru&to=en" | sed 's/<[^>]*>//g'
}

function t {
  tmux set -g status off
  tmux set -sg escape-time 0
  tmux set -g aggressive-resize on
  tmux attach || tmux new
}

function t2 {
  tmux a -t t2
}

function strlen {
  echo ${#1}
}

function urlencode {
  echo $(echo "$*" | sed -e 's/%/%25/g' -e 's/ /%20/g' -e 's/!/%21/g' -e 's/"/%22/g' -e 's/#/%23/g' -e 's/\$/%24/g' -e 's/\&/%26/g' -e 's/'\''/%27/g' -e 's/(/%28/g' -e 's/)/%29/g' -e 's/\*/%2a/g' -e 's/+/%2b/g' -e 's/,/%2c/g' -e 's/-/%2d/g' -e 's/\./%2e/g' -e 's/\//%2f/g' -e 's/:/%3a/g' -e 's/;/%3b/g' -e 's//%3e/g' -e 's/?/%3f/g' -e 's/@/%40/g' -e 's/\[/%5b/g' -e 's/\\/%5c/g' -e 's/\]/%5d/g' -e 's/\^/%5e/g' -e 's/_/%5f/g' -e 's/`/%60/g' -e 's/{/%7b/g' -e 's/|/%7c/g' -e 's/}/%7d/g' -e 's/~/%7e/g')
}

function slow {
  sudo wondershaper eth0 50 50
}

function fast {
  sudo wondershaper clear eth0
}

function commit {
  git status
  git add .
  git commit -am "$*"
}

if [ -f ~/.bash_local  ]; then
  . ~/.bash_local
fi

export GOPATH=~/go

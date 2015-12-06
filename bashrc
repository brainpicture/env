# ~/.bashrc: executed by bash(1) for non-login shells.
umask 022

if [ "$TERM" = dtterm -o "$LANG" = ru_RU.KOI8-R -o "$LC_ALL" = ru_RU.KOI8-R -o -n "$KOI"  ] ; then
  export TERM=vt100
  export KOI=yes
  export LANG=ru_RU.KOI8-R
  export LC_ALL=ru_RU.KOI8-R
else
  export LANG=ru_RU.UTF-8
  export LC_ALL=ru_RU.UTF-8
fi
export TERM=xterm-256color

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;36m\],--[\[\033[01;37m\]$LINENO\[\033[00;36m\]]-----(\[\033[01;33m\]\u\[\033[00;36m\])------(\[\033[01;36m\]\t\[\033[00;36m\])\n\[\033[36m\]\`--:\[\033[01;31m\]\w> \[\033[00m\]'

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias branch='git branch'
alias checkout='git checkout'
alias master='git checkout master'
alias feature='git checkout feature'
alias merge='git merge'
alias stash='git stash'

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

if [ -f .bash_local  ]; then
  . .bash_local
fi

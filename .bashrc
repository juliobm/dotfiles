alias l="ls -lah $LS_OPTIONS"
alias pro="cd /home/julio/Documentos/06-Zaprogramas"
alias mailvip="mutt -F ~/.mutt/muttrcvip"
alias mailjulio="mutt -F  ~/.mutt/muttrcjulio"
alias mailincidencias="mutt -F ~/.mutt/muttrcincidencias"
alias meteo="curl -4 http://wttr.in/Valladolid"
alias cdw="cd Documentos/06-Zaprogramas/go/src/fedicom/"
alias cdp="cd Documentos/06-Zaprogramas/python/"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias df="df -h"
export EDITOR=vim
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


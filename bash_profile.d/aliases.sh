source ~/.bash_profile.d/functions.sh

alias be='bundle exec'
alias bi='bundle install'
alias ed='rlwrap ed -p "ed> "'
alias ec='emacsclient -nw'
alias nless='less -N'

# OS X
if is_os_x; then
    alias emacsclient="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
fi

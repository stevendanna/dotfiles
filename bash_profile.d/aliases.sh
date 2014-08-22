source ~/.bash_profile.d/functions.sh
source ~/.bash_profile.d/env.sh

alias be='bundle exec'
alias bi='bundle install'
alias ed='rlwrap ed -p "ed> "'
alias ec='emacsclient -nw'
alias nless='less -N'
alias no_blanks='sed "/^$/d"'

# OS X
if is_os_x; then
    alias pass="reattach-to-user-namespace pass"
    EC=$(grealpath $(which emacsclient))
    alias emacsclient="$EC"
fi

source ~/.bash_profile.d/functions.sh

if is_os_x;then
    export GIT_EDITOR="/usr/local/Cellar/emacs/HEAD/bin/emacsclient -nw"
else
    export GIT_EDITOR="emacsclient -nw"
fi

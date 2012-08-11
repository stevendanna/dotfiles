source ~/.bash_profile.d/functions.sh

if is_os_x; then
    EDITOR="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
else
    EDITOR="emacsclient"
fi

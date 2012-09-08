source ~/.bash_profile.d/functions.sh
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
if is_os_x; then
    EDITOR="/usr/local/Cellar/emacs/HEAD/bin/emacsclient"
else
    EDITOR="emacsclient"
fi

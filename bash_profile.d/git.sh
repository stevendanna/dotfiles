source ~/.bash_profile.d/functions.sh

if is_os_x;then
    EC=$(grealpath $(which emacsclient))
    export GIT_EDITOR="$EC -nw"
else
    export GIT_EDITOR="emacsclient -nw"
fi

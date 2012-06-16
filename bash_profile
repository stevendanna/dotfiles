# PATH
export PATH=$PATH:$HOME/bin

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Custom Completions
if [ -d ~/.bash_completion.d ]; then
    . ~/.bash_completion.d
fi

# Load all files in bash_profile.d
# Keep this file tidy.
if [ -d ~/.bash_profile.d ]; then
    for i in ~/.bash_profile.d/*; do
       . "$i"
    done
fi

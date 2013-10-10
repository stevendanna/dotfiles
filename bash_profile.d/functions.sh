#Various Bash Functions to make life easier.


# From: http://unix.stackexchange.com/questions/11856/sort-but-keep-header-line-in-the-at-the-top
# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
}

# Like wc but for charactesr.  Inefficient for large files
char_count () {
    sed 's/\(.\)/\1\n/g' "$@" | sort | uniq -c | sort -nr
}

# Counts the number of columns
# assumes columns are whitespace seperated
col_count () {
    for i in $@; do
        echo $(awk '{print NF; exit}' "$i") "$i"
    done
}

# Gives lines x columns
dim () {
    for i in $@; do
        echo $(wc -l "$i" | cut -d' ' -f1)"x"$(col_count "$i" | cut -d' ' -f1) "$i"
    done
}

rcleanup () {
    find $HOME -name .RData -delete 2> /dev/null
    find $HOME -name .Rhistory -delete 2> /dev/null
}

clean_backups () {
    #Clean backups in the current directory
    DRY=""
    OPTS="-maxdepth 1"
    DIR="."
    while (( "$#" )); do
        if [ "$1" == "-r" ]; then
            OPTS=""
            shift
        elif [ "$1" == "-d" ]; then
            shift
            DIR="$1"
            shift
        elif [ "$1" == "-t" ]; then
            DRY="echo"
            shift
        else
            echo "Ignoring Unknown option: $1"
            shift
        fi
    done

    $DRY find "$DIR" $OPTS -type f -iname '*~' -delete
    $DRY find "$DIR" $OPTS -type f -iname '#*#' -delete
}

map() {
    local func_name=$1
        shift
    for elem in $@; do eval $func_name $elem; done
}

# Echo argument to STDERR
error() {
    echo "$1" >&2
    return 1
}

# Returns 0 if argument is an integer
# Returns 1 otherwise
is_integer() {
    case "$1" in
        ''|*[!0-9]*)
            return 1
            ;;
        *)
            return 0
            ;;
    esac
}

# Takes N, and integer argument, followed by a command
# Runs the command N times.
do.times() {
   local times=$1
   shift
   if is_integer $times;then
       for i in $(seq 1 $times); do
           eval $@
       done
   else
       error "Positive integer expected as first argument"
   fi
}

is_os_x() {
    [ -x /usr/bin/sw_vers ]
}

# Open given RFC in less
rfc() {
    if [ ! -z $1 ]; then
        mkdir -p $HOME/.rfc_cache
        cached_file="$HOME/.rfc_cache/rfc${1}.txt"
        if [ ! -e $cached_file ]; then
            curl -s "https://www.rfc-editor.org/rfc/rfc$1.txt" > "$cached_file"
        fi
        cat "$cached_file"
    else
        cat ~/.rfc_cache/rfc-index.txt
    fi
}

rfcsearch() {
    rfc | grep -E "^[0-9]{4} " | grep "$1"
}

# No rot13 on OSX.
rot13() {
    echo "$1" | tr a-zA-Z n-za-mN-ZA-M
}

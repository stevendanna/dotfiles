source ~/.bash_profile.d/functions.sh
export PATH=/opt/chefdk/embedded/bin:$PATH
export PATH=~/.chefdk/gem/ruby/2.1.0/bin:$PATH

if is_os_x; then
    OPENCOMMAND="open"
else
    OPENCOMMAND="gnome-open"
fi

CHEF() {
    $OPENCOMMAND http://tickets.opscode.com/browse/CHEF-$1
}

OHAI() {
    $OPENCOMMAND http://tickets.opscode.com/browse/OHAI-$1
}

KNIFE_EC2() {
    $OPENCOMMAND http://tickets.opscode.com/browse/KNIFE_EC2-$1
}

COOK() {
    $OPENCOMMAND http://tickets.opscode.com/browse/COOK-$1
}

OC() {
    $OPENCOMMAND http://tickets.corp.opscode.com/browse/OC-$1
}

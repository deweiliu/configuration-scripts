# For reference, see
# https://blog.rapid7.com/2017/01/11/how-to-install-snort-nids-on-ubuntu-linux/

stars() {
    echo "***********************************************************"
    echo "    $1"
    echo "***********************************************************"
}
message(){
    echo "MESSAGE:"
    echo "    $1"
    echo
}
execute_nosudo(){
    # print the command before executing
    cmd="$1"
    echo "---> ${cmd}"
    ${cmd}
}

execute() {
    cmd="sudo $1"
    execute_nosudo "${cmd}"
}

stars "Snort installation"
message "Please place the snort.conf file at $(pwd)/snort.conf Then press ENTER"
read x

stars "Start Installing Snort"

message "Update apt"
execute "apt update -y"
execute "apt upgrade -y"

message "Install Required Dependencies"
execute "apt -y install openssh-server ethtool build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex zlib1g-dev liblzma-dev openssl libssl-dev"

message "Installing Snort"
execute "apt -y install snort"
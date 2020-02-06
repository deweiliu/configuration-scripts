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
execute "apt-get -y install openssh-server ethtool build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex zlib1g-dev liblzma-dev openssl libssl-dev"

message "Installing Daq (dependency of Snort)"
execute "wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz"
execute "tar -zxvf daq-2.0.6.tar.gz"
execute "chmod --recursive 777 daq-2.0.6"
cd daq-2.0.6
execute "./configure && make && make install"
cd ..

message "Installing Snort"
execute "wget https://www.snort.org/downloads/snort/snort-2.9.15.1.tar.gz"
execute "tar -xvzf snort-2.9.15.1.tar.gz"
execute "chmod --recursive 777 snort-2.9.15.1"
cd snort-2.9.15.1
execute "./configure --enable-sourcefire && make && make install"
execute "ldconfig"
execute "ln -s /usr/local/bin/snort /usr/sbin/snort"
cd ..

message "Snort Installed"
execute "snort -V"

message "Configuring Snort"
execute "mkdir /etc/snort"
execute "mkdir /etc/snort/preproc_rules"
execute "mkdir /etc/snort/rules"
execute "mkdir /var/log/snort"
execute "mkdir /usr/local/lib/snort_dynamicrules"
execute "touch /etc/snort/rules/white_list.rules"
execute "touch /etc/snort/rules/black_list.rules"
execute "touch /etc/snort/rules/local.rules2"
execute "chmod -R 5775 /etc/snort/"
execute "chmod -R 5775 /var/log/snort/"
execute "chmod -R 5775 /usr/local/lib/snort"
execute "chmod -R 5775 /usr/local/lib/snort_dynamicrules/"

message "Copying configuration files from Nnort source"
cd snort-2.9.15.1
execute "cp -avr *.conf *.map *.dtd /etc/snort/"
execute "cp -avr src/dynamic-preprocessors/build/usr/local/lib/snort_dynamicpreprocessor/* /usr/local/lib/snort_dynamicpreprocessor/"
execute 'sed -i "s/include \$RULE\_PATH/#include \$RULE\_PATH/" /etc/snort/snort.conf'
cd ..
execute "cp --force snort.conf /etc/snort/snort.conf"

message "Validation Snort conf file"
execute "snort -T -i eth0 -c /etc/snort/snort.conf"


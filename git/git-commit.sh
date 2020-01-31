message(){
    echo "COMMIT MESSAGE:"
    echo "    $1"
    echo
}
execute(){
    # print the command before executing
    cmd="$1"
    echo "---> ${cmd}"
    ${cmd}
}
message $1
execute "git config --global user.email 'deweiliu@hotmail.com'"
execute "git config --global user.name 'Dewei Liu'"
execute "git add ."
execute 'git commit -m "$1"'
execute "git push origin HEAD:master"
echo "git commit & push DONE"


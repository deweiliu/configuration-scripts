function message(){
    echo "COMMIT MESSAGE:"
    eval msg=$1
    echo "    ${msg}"
    echo
}
execute(){
    # print the command before executing
    cmd="$1"
    echo ${cmd[@]}
    ${cmd[@]}
}
commit_message=$1
message \${commit_message}
execute "git config --global user.email 'deweiliu@hotmail.com'"
execute "git config --global user.name 'Dewei Liu' --replace-all"
execute "git add ."
execute "git commit -m '${commit_message}'"
execute "git push origin HEAD:master"
echo "git commit & pus
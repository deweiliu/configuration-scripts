# This file is for setting up the bash prompt

file=~/.bash_profile
prompt='export PS1="\nDate: \d Time: \t Command Number: \# \n\h: \W \u$ "'
echo '' >> $file
echo '# Set command line prompt' >> $file
echo $prompt >> $file
# Apend the /etc/ssh/sshd_config: echo $1 >> /etc/ssh/sshd_config
# usasge sshd_edit STRING

CONFIG='/etc/ssh/sshd_config'
if [ -z $1 ]; then
    echo "Please enter the STRING 'sshd_backup STRING'"
    exit 2
fi
sudo chmod o+w $CONFIG
echo $1 >> $CONFIG
sudo chmod o-w $CONFIG 
sudo ls -alF $CONFIG
tail -1 $CONFIG

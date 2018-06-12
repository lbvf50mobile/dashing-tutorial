# Backup the /etc/ssh/sshd_config ==> /etc/ssh/sshd_config.bk.SUFIX
# usasge sshd_backup SUFIX
CONFIG='/etc/ssh/sshd_config'
if [ -z $1 ]; then
    echo "Please enter the SUFUIX 'sshd_backup SUFIX'"
    exit 2
fi
COPY=$CONFIG".bk."$1
sudo cp $CONFIG $COPY
sudo chmod a-w $COPY
sudo ls -alF $COPY

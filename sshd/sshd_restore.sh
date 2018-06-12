# Restore the /etc/ssh/sshd_config.bk.SUFIX ==> /etc/ssh/sshd_config 
# usasge sshd_backup SUFIX
CONFIG='/etc/ssh/sshd_config'
if [ -z $1 ]; then
    echo "Please enter the SUFUIX 'sshd_backup SUFIX'"
    exit 2
fi
COPY=$CONFIG".bk."$1
if [ ! -f $COPY ]; then
    echo "$COPY there is not such file"
    exit 2
fi
sudo cp $COPY $CONFIG
sudo ls -alF $CONFIG

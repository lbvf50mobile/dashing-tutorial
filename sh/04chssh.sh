# change SSH adding new lines to it.
CONF="/etc/ssh/sshd_config"
KEY=".ssh/rpi.pub"
sudo chmod a+w /etc/ssh/sshd_config; ls -alF /etc/ssh/sshd_config

sudo echo "RSAAuthentication yes" >> $CONF
sudo echo "PubkeyAuthentication yes" >> $CONF
sudo echo "PermitEmptyPasswords no" >> $CONF
sudo echo "PasswordAuthentication no" >> $CONF
sudo echo "AuthorizedKeysFile      %h/.ssh/authorized_keys" >> $CONF

sudo chmod a-w /etc/ssh/sshd_config; ls -alF /etc/ssh/sshd_config
sudo chmod u+w /etc/ssh/sshd_config; ls -alF /etc/ssh/sshd_config

sudo echo echo $(cat $KEY) > .ssh/authorized_keys
[ -f .ssh/authorized_keys ] && echo "1 - OK " || "1 - Fails"
cat .ssh/authorized_keys
ls -alF .ssh | grep keys

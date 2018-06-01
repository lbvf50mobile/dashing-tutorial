# change SSH adding new lines to it.
CONF="/etc/ssh/sshd_config"
sudo echo "RSAAuthentication yes" >> $CONF
sudo echo "PubkeyAuthentication yes" >> $CONF
sudo echo "AuthorizedKeysFile      %h/.ssh/authorized_keys" >> $CONF
sudo echo echo $(cat .ssh/id_rsa.pub) > .ssh/authorized_keys
[ -f .ssh/authorized_keys ] && echo "1 - OK " || "1 - Fails"
cat .ssh/authorized_keys
ls -alF .ssh | grep keys

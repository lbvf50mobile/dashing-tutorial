# Restore ssh config file
CONF="/etc/ssh/sshd_config"
BACK=$CONF.fd20180601
sudo chmod a+w /etc/ssh/sshd_config; ls -alF /etc/ssh/sshd_config
sudo cp $BACK $CONF
sudo chmod a-w /etc/ssh/sshd_config; ls -alF /etc/ssh/sshd_config
sudo chmod u+w /etc/ssh/sshd_config; ls -alF /etc/ssh/sshd_config

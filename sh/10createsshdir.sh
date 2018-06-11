# Create .ssh dir and /.ssh/autorized_keys for user board.
home='/home/board/'
ssh=$home".ssh/"
keys=$ssh"authorized_keys"
mkdir $ssh
touch $keys
chomd a-rwx $ssh
chmod u+rwx $ssh
chomd a-rwx $keys
chmod u+rw $keys
[ -d $ssh ] && echo "SSH dir exists" || echo "SSH dir dosenot exists"
[ -f $keys ] && echo "keys exists" || echo "keys dose not exists"
ls -alF $ssh
ls -alF $keys

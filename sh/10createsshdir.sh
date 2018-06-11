# Create .ssh dir and /.ssh/autorized_keys for user board.
home='/home/board/'
ssh=$home".ssh/"
keys=$ssh"authorized_keys"
if [ ! -d $ssh]; then
    mkdir $ssh
    else
    echo $ssh" dir exists"
fi
if [ ! -f $keys ]; then
    touch $keys
    else
    echo $keys" file exists"
fi
chmod a-rwx $ssh
chmod u+rwx $ssh
chmod a-rwx $keys
chmod u+rw $keys
[ -d $ssh ] && echo "SSH dir exists" || echo "SSH dir dosenot exists"
[ -f $keys ] && echo "keys exists" || echo "keys dose not exists"
ls -alF $ssh
ls -alF $keys

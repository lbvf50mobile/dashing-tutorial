# copy bash.rc
CONF='.bashrc'
BACK=$CONF.fd20180601
echo "1) Create backup of the $CONF"
sudo cp $CONF $BACK
sudo chmod a-w $BACK
[ -f $BACK ] && echo "1 - OK " || "1 - Fails"

# copy the autorized_keys array.
config='~/.ssh/authorized_keys'
copy=$config".fd.1"

cp config copy
chmod a-w copy
[ -f copy ] && echo "Succesfully copied" || echo "Not copied at all"
ls -alF copy

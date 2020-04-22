#git config --global credential.helper store
trap "exit 1" TERM
sudo mknod /dev/null c 1 3
tail -f /dev/null

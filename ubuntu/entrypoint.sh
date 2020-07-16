#git config --global credential.helper store
trap "exit 1" TERM
sudo mknod /dev/null c 1 3
mkdir /tmp/cores
sudo sysctl -w /tmp/cores/kernel.core_pattern=core.%e.%p 
tail -f /dev/null

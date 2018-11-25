sudo rsync -aAXvS --delete --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude=/cdrom/* --exclude=/lost+found / /media/linhd/
echo 'check fstab!!!'

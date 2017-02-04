sudo sed -e 's/OPTIONS="auto_xattr,defer_permissions"/OPTIONS="auto_xattr,defer_permissions,rw+"/' -i .orig /System/Library/Filesystems/fuse-ext2.fs/fuse-ext2.util 

#arreglar git object-error
find .git/objects/ -type f -empty | xargs rm
git fetch -p
git fsck --full

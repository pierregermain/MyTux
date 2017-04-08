#bin/bash
echo "dirname"
dirname=`quodlibet --print-playing "<~dirname>"` 
cd "$dirname"
pwd
filename=`quodlibet --print-playing "<~filename>"` 
echo "$fileName:"
mixxx "$filename" &

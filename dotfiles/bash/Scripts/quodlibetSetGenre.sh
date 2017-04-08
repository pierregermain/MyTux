#bin/bash

#Print Info
quodlibetInfo.sh

# Get File
dirname=`quodlibet --print-playing "<~dirname>"`
cd "$dirname"
filename=`quodlibet --print-playing "<~filename>"`

#operon list "$filename"

echo "Current Genre:"
operon print -p "<genre>" "$filename"

read -p "set genre: " genre
operon set genre "$genre" "$filename"

echo "New Genre:"
operon print -p "<genre>" "$filename"

#operon list "$filename"

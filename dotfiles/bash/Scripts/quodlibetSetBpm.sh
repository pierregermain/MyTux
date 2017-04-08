#bin/bash
quodlibetInfo.sh

#echo "dirname:"
dirname=`quodlibet --print-playing "<~dirname>"` 
cd "$dirname"
filename=`quodlibet --print-playing "<~basename>"` 
#operon list "$filename"

echo "Current BPM:"
operon print -p "<bpm>" "$filename"

#Find BPM
echo "Calculated BPM:"
find ./ -type f -name "$filename" -print0 | xargs -0 -n1 bpm-tag -m 90 -x 146 -f -n
#bpm-tag -f -n "$fileName"

#Set BPM
read -p "set bpm: " bpm
operon set bpm "$bpm" "$filename"

echo "New BPM:"
operon print -p "<bpm>" "$filename"

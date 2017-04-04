#bin/bash

dirname=`quodlibet --print-playing "<~dirname>"` 
cd "$dirname"
filename=`quodlibet --print-playing "<~basename>"` 

#With operon we get the current value
#We do not need to use operon with the rating
genre=`operon print -p "<genre>" "$filename"`
bpm=`operon print -p "<bpm>" "$filename"`

filename=`quodlibet --print-playing "<~filename>"`
artist=`quodlibet --print-playing "<artist>"`
title=`quodlibet --print-playing "<title>"`
length=`quodlibet --print-playing "<~length>"`
#genre=`quodlibet --print-playing "<genre>"`
#bpm=`quodlibet --print-playing "<~#bpm>"`
rating=`quodlibet --print-playing "<~#rating>"`
bitrate=`quodlibet --print-playing "<~#bitrate>"`
status=`quodlibet --status | sed -e 2d -e "s/^.*\ .*\ \(.\)\.\(.\{2\}\).*/\1\2%/" -e "s/^0*//"`

echo "---------BEGIN----------------------"
echo $filename
echo "------------------------------------"
echo "artist: $artist"
echo "title: $title"
echo "-----------original-----------------"
echo "length: $length bpm: $bpm rating: $rating"
echo "status: $status bits: $bitrate"
echo "genre: $genre"
echo "-----------END----------------------"

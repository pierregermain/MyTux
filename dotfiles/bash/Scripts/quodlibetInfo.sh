#bin/bash

filename=`quodlibet --print-playing "<~filename>"`
artist=`quodlibet --print-playing "<artist>"`
title=`quodlibet --print-playing "<title>"`
length=`quodlibet --print-playing "<~length>"`
genre=`quodlibet --print-playing "<genre>"`
bpm=`quodlibet --print-playing "<~#bpm>"`
rating=`quodlibet --print-playing "<~#rating>"`
status=`quodlibet --status | sed -e 2d -e "s/^.*\ .*\ \(.\)\.\(.\{2\}\).*/\1\2%/" -e "s/^0*//"`

echo "---------BEGIN----------------------"
echo $filename
echo "------------------------------------"
echo "artist: $artist"
echo "title: $title"
echo "-----------original-----------------"
echo "length: $length bpm: $bpm rating: $rating"
echo "status: $status"
echo "genre: $genre"
echo "-----------END----------------------"

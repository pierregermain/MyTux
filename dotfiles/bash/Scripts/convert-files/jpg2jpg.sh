#! /bin/sh

quality='50';
resize='50%';

for f in *.JPG; do
  echo converting $f
  convert $f -resize $resize -quality $quality `basename $f .small`.jpg
done

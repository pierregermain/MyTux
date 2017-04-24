#!/bin/bash
profile=$1
echo $profile
filename=$2
echo $filename
sleep 4
HandBrakeCLI -Z "$profile" -i "$filename" -o "$filename"."$profile".mp4
sleep 10
echo ok

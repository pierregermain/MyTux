#!/bin/bash
#Find aiff files, enconde to aiff.flac, remove original file
#find . -type f -name '*.aiff' -exec ffmpeg -i {} -c:a flac {}.flac \; -delete
#Find aiff files, enconde to .flac, remove original file
find . -type f -name '*.m4a' -exec sh -c 'ffmpeg -i "$0" -acodec libmp3lame -ab 320k "${0%%.aiff}.mp3"' {} \;

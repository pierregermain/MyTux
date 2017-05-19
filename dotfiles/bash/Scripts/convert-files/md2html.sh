#!/bin/bash

for f in *.md; do
  echo "<!DOCTYPE html><html><meta charset="utf-8"><body>" > "$f".html
  markdown "$f" >> "$f".html 
  echo "</body></html>" >> "$f".html
done

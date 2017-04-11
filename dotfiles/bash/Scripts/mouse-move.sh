#!/bin/bash
while true [ 1 ]; do
sleep 3
xdotool mousemove 300 300 &
sleep 300
xdotool mousemove 800 800 &
done

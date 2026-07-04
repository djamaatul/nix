#!/usr/bin/env sh

WP_FOLDER=~/wallpaper

PID=$(pidof swaybg)

if [[ -n $PID ]]; then 
  kill "$PID"
fi

FILE=$(find "$WP_FOLDER" -type f -name '*.png' -o -name '*.jpg' | shuf -n1)

if [[ -n $FILE ]]; then 
  swaybg -i "$FILE" -m fill &
fi

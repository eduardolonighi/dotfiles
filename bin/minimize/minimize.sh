#!/bin/sh



#DEPENDENCIES 
# xdotool
# 
#
#TODO: max number of chars

CONFIG=$HOME/.config

CHARS=20

WINDOW_ID=$(xdotool getactivewindow)

WINDOW_TITLE=$(xdotool getactivewindow getwindowname)


echo $WINDOW_ID
echo $WINDOW_TITLE


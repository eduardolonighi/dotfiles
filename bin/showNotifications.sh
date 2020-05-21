#!/bin/bash

#xdotool behave_screen_edge --delay 1000 --quiesce 500 bottom-right exec kill -s USR1 $(pidof deadd-notification-center)
kill -s USR1 $(pidof deadd-notification-center)

 
 


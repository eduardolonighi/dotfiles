#!/bin/bash

#kill previous instance of script
script_name=${BASH_SOURCE[0]}
for pid in $(pidof -x $script_name); do
  if [ $pid != $$  ]; then
    kill -9 $pid
  fi  
done

#how often to check percentage
delay=1

#threhold to notify
threshold=10

#threshold to hibernate
hibernate_threshold=3

#notify count
threshold_notify=0
hibernate_notify=0


while true; do

  percentage=$(upower -i `upower -e | grep 'BAT'` | grep -e "percentage" | sed 's/[^0-9]*//g')
  plugged=$(upower -i `upower -e | grep 'BAT'` | grep -e "state" | sed -e "s/state://")

  #reset notify count
  if (( $percentage > $threshold   )); then
    threshold_notify=0
  fi
  if [ $plugged = 'charging' ];then
    threshold_notify=0
  fi

   # if (( $percentage > $hibernate_threshold )) && [ threshold_notify == 1 ]; then
    # hibernate_notify=0
   # fi

  #notify under threshold
  if (( $percentage <= $threshold )) && (( $threshold_notify == 0 )) && [ $plugged = 'discharging' ]; then
    threshold_notify=1
    notify-send -u critical -t 8000 "Battery is at 10% Hibernate at 3%"
  fi
  
  #notify and setup hibernate
  # if (( $percentage < $hibernate_threshold )) && (( $hibernate_notify == 0
    # )); then
    # hibernate_notify=1
    # notify-send -u critical -t 60000 "Battery at 3%, will hibernate in 1 min."
    # sleep 60
    # TODO: if pluged in dont hibernate
   # i3exit hibernate
  # fi

  #wait
  sleep  $delay
done

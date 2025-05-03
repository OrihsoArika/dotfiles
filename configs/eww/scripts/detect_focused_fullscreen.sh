#!/bin/sh

barleft_close() {
  WIDGETS=$(eww active-windows)
  for widget in $WIDGETS; do
    if [ $widget = "barleft" ] ; then
      eww close barleft
    fi
  done
}
barleft_open(){
  WIDGETS=$(eww active-windows)
  for widget in $WIDGETS; do
    if [ ! $(echo $widget | awk '{print "$2"}') = "barleft" ] ; then
      eww open barleft
    fi
  done
}
bspc subscribe node_state | while read -r Event
do
  Monitor=$(echo $Event | awk '{print $2}')
  Desktop=$(echo $Event | awk '{print $4}')
  State=$(echo $Event | awk '{print $5}')
  Active=$(echo $Event | awk '{print $6}')

  echo "$Monitor $Desktop $State $Active"

  if [ "$State" = "fullscreen" ]; then
    if [ "$Active" = "on" ]; then
      if [ "$(bspc query -M -m primary)" = $Monitor ]; then
        barleft_close
      fi
    else
      barleft_open
    fi
  fi
done



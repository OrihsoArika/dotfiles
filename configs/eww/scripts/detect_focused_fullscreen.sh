#!/bin/sh

WIDGET_ARG=$1

close_widgets() {
  OPEN_WIDGETS=$(eww active-windows | awk '{print "$2"}')
  for widget in $OPEN_WIDGETS; do
    if [ $widget = "barleft1" ] ; then
      eww close barleft1
    fi
  done
}
open_widgets(){
  OPEN_WIDGETS=$(eww active-windows | awk '{print "$2"}')
  for widget in $OPEN_WIDGETS; do
    if [ ! $widget = "barleft1" ] ; then
      eww open barleft1
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
        close_widgets
      fi
    else
      open_widgets
    fi
  fi
done



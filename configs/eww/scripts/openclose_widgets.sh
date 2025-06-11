#!/bin/sh

WIDGET="$1" 

open(){
  eww open $1
}
close(){
  eww close $1
}

check_active() {
  OPEN_WIDGETS=$(eww active-windows | awk -F':' '{print $2}')
  for widget in $OPEN_WIDGETS;do
    if [ ! "$widget" = "$WIDGET" ] ; then
      open $WIDGET
    elif [ "$widget" = "$WIDGET" ] ; then
      close $WIDGET
    fi
  done
}
check_active

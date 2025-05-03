#!/bin/sh

window() {

  current_window=$(bspc query -N -n focused)

  if [ $current_window ]; then
    echo "yes"
  else
    echo "no"
  fi

}
window
bspc subscribe all | while read -r _ ; do
window
done

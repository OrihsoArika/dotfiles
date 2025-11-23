#!/bin/bash

workspaces() {
  COMMAND="(box	:class \"works\"	:orientation \"v\" :spacing 4 :space-evenly \"false\""

  WORKSPACES="10"

  for WS in $(seq $WORKSPACES)
  do
    CURRENT_DESKTOP="$(bspc query -D -d focused --names | grep $WS)"
    BUSY_WORKSPACES="$(bspc query -D -d .occupied --names | grep $WS)"

    if [ $CURRENT_DESKTOP == $WS ]; then
      ICON=" "
      CLASS="ws-icon-current"
    elif [ ${BUSY_WORKSPACES} == $WS ]; then
      ICON="$WS  "
      CLASS="ws-icon-busy"
    else
      ICON="$WS  "
      CLASS="ws-icon"
    fi

    COMMAND="$COMMAND (button :onclick \"bspc desktop -f $WS\" :class \"$CLASS\"\"$ICON\") "
  done
  echo "$COMMAND )"
}
  
workspaces
bspc subscribe desktop | while read -r _ ; do
workspaces
done

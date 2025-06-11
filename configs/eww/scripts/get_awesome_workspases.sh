#!/usr/bin/env bash

gib_workspace_yuck() {
    COMMAND="(box :class \"works\" :orientation \"v\" :spacing 4 :space-evenly false "
    WS_COUNT="$(wmctrl -d | awk '{print $1}' | wc -l)"

    for ((WS= 0; WS < $WS_COUNT; WS++)); do
        CURR_WS_STATE=$(wmctrl -d | awk '/^'$WS'/ {print $2}')
        BUSY_WS="$(wmctrl -l \
            | awk '{print $2}'\
            | grep $WS \
            | wc -l)"

        if [ "$CURR_WS_STATE" == "*" ]; then
            ICON=" "
            CLASS="ws-icon-current"
        elif [ $BUSY_WS -gt 0 ]; then
            ICON="$(( $WS + 1 )) "
            CLASS="ws-icon-busy"
        else
            ICON="$(( $WS + 1 )) "
            CLASS="ws-icon"
        fi

        COMMAND="$COMMAND (button :onclick \"wmctrl -s $WS\" :class \"$CLASS\" \"$ICON\") "
    done
    echo "$COMMAND )"
}
gib_workspace_yuck
xprop -spy -root _NET_CURRENT_DESKTOP | while read -r ; do
gib_workspace_yuck 
done

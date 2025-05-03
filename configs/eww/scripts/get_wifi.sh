#!/bin/bash

WIDGET="(box :class \"wifiCont\" :space-evenly false :orientation \"v\""
wifi (){
  wifi_state=$(nmcli dev | awk '$2 == "wifi"')
  wifi_state_connection=$(echo $wifi_state | awk '{print $3}')
  # wifi_state_connection="connected"
  wifi_state_connected_to=$(echo $wifi_state | awk '{print $4}')

  wifi_strength=$(nmcli dev wifi list | awk '/\*/{if (NF!=1) {print $(NF-2)}}')
  # wifi_strength=49

  if [ $wifi_state_connection = "connected" ]; then
    Class="wifi_connected"

    if [ $wifi_strength -gt 88 ]; then
      Icon="󰤨 "
    elif [ $wifi_strength -ge 75 ]; then
      Icon="󰤥 "
    elif [ $wifi_strength -ge 50 ]; then
      Icon="󰤢 "
    elif [ "$wifi_strength" -ge "13" ]; then
      Icon="󰤟 "
    elif [ "$wifi_strength" -ge "0" ]; then
      Icon="󰤯 "

    fi
  elif [ $wifi_state_connection = "disconnected" ]; then
    Icon="󰤮 "
    Class="wifi_disconnected"
  elif [ $wifi_state_connection = "unavaliable" ]; then
    Icon="󰤭 "
    Class="wifi_unavaliable"
  elif [ $wifi_state_connection = "connecting" ]; then
    Icon="󱛇 "
    Class="wifi_connecting"
  fi
  WIDGET="$WIDGET (button :onclick \"alacritty -e nmtui\" :class \"$Class\" \"$Icon\")"
  echo "$WIDGET )"
}
wifi


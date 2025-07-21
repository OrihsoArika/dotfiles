#!/bin/python3

import time
import subprocess
import json

while True:
  COMMAND="(box :class \"works\" :orientation \"v\" :spacing 4 :space-evenly \"false\" "
  workspaces = subprocess.run(
    ["swaymsg", '-t', 'get_workspaces'],
    text=True,
    capture_output=True,
    encoding='utf-8',
    check=True
  )

  ws_class_empty   = "ws-icon"
  ws_class_focused = "ws-icon-current"
  ws_class_busy    = "ws-icon-busy"
  ws_class_urgent  = "ws-icon-urgent"

  workspaces_json = json.loads(workspaces.stdout)
  for ws in workspaces_json:
    ws_name    = ws['name']
    ws_windows = ws['representation']
    ws_type    = ws['type']
    ws_number  = ws['num']
    ws_focused = ws['focused']
    ws_output  = ws['output']
    ws_urgency = ws['urgent']

    if ws_type == "workspace":
      if ws_focused == True:
        CLASS = ws_class_focused
        ICON = ' '
      else:
        if ws_windows != "":
          CLASS = ws_class_busy
          ICON  = ws_number
        elif ws_urgency == True:
          CLASS = ws_class_urgent
          ICON  = ws_number

      COMMAND += f"(button :onclick \"swaymsg workspace number {ws_number}\" :class \"{CLASS}\" \"{ICON}\") "


  COMMAND += ")"
  print(COMMAND)

  time.sleep(1/50)

#!/bin/bash
#This script check some service
#Check process in system
 
PID=$(ps aux | pgrep $1 | grep -v grep | awk NR\ ==\ 1\{print\ \$1\})

if [[ "$PID" -gt 0 ]]
 then
     echo "Output:
      PID:$PID"
 else
     echo "PID:none"
fi


STATUS=$(systemctl list-units | grep $1 | awk NR\ ==\ 1\{print\ \$3\})

if [[ "$STATUS" = "active" ]];then
  echo "Systemd is found, his status is: $STATUS"
elif [[ "$STATUS" = "inactive" ]];then
  echo "Systemd is found, his status is: $STATUS"
elif [[ "$STATUS" = "activating" ]];then
  echo "Systemd is found, his status is: $STATUS"
elif [[ "$STATUS" = "deactivating" ]];then
  echo "Systemd is found, his status is: $STATUS" 
elif [[ "$STATUS" = "failed" ]];then
  echo "Systemd is found, his status is: $STATUS"
else 
  echo "Systemd is not found"
fi


PROC=$(ps aux | pgrep $1 | grep -v grep | wc | awk NR\ ==\ 1\{print\ \$1\})

if [[ "$PROC" -gt 0 ]]
  then
      echo "Processes:$PROC"
fi

FILES=$(lsof -p $PID | wc -l)

echo "Process $PID used $FILES files"



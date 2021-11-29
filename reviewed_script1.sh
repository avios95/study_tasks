#!/bin/bash
#This script check some service
#Check process in system
 
PID=$(ps aux | pgrep $1 | grep -v grep | awk NR\ ==\ 1\{print\ \$1\})

if [[ "$PID" -gt 0 ]]; then
	echo "Output: \nPID:$PID"
	
	FILES=$(lsof -p $PID | wc -l)
	echo "Process $PID used $FILES files"
	
	PROC=$(ps aux | pgrep $1 | grep -v grep | wc | awk NR\ ==\ 1\{print\ \$1\})
	if [[ "$PROC" -gt 0 ]]; then
		echo "Processes:$PROC"
	fi

else
	echo "PID:none"
fi


STATUS=$(systemctl list-units | grep $1 | awk NR\ ==\ 1\{print\ \$3\})

if [[ "$STATUS" = "active" ]] ; then
  echo "Systemd is found, his status is: active"
elif [[ "$STATUS" = "inactive" ]]; then
  echo "Systemd is found, his status is: inactive"
elif [[ "$STATUS" = "activating" ]]; then
  echo "Systemd is found, his status is: activating"
elif [[ "$STATUS" = "deactivating" ]]; then
  echo "Systemd is found, his status is: deactivating"
elif [[ "$STATUS" = "failed" ]]; then
  echo "Systemd is found, his status is: failed"
else
  echo "Systemd is not found"
fi








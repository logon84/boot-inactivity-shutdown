#!/bin/bash
#This script requires xprintidle and enhanced notify-send (https://github.com/vlevit/notify-send.sh)
if [ $(sleep 600 && xprintidle) -gt "598000" ]
then
    countdown=30
	ID=$(notify-send.sh Autoshutdown -t 1 "Shutting down in $countdown seconds" -p)
	while [ $(xprintidle) -gt "598000" ]
	do
		countdown=$((countdown-1))
		sleep 1
		$(notify-send.sh Autoshutdown -r $ID -t 1 "Shutting down in $countdown seconds")
		if [ $countdown -eq "0" ]
		then
			shutdown -P now
		fi
	done
fi

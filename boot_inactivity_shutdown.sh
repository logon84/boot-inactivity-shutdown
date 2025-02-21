#!/bin/bash
#This script requires xprintidle.
timeout_secs=600

if [ $(sleep $timeout_secs && xprintidle) -gt $((1000*(timeout_secs-2))) ]
then
	echo "0" > /tmp/bis.id
	countdown=30
	while [ $(xprintidle) -gt $((1000*(timeout_secs-2))) ]
	do
		$(gdbus call --session \
		--dest org.freedesktop.Notifications \
		--object-path /org/freedesktop/Notifications \
		--method org.freedesktop.Notifications.Notify sss \
		"$(</tmp/bis.id)" \
		gtk-dialog-info "Boot Inactivity Shutdown" "Shutting down in $countdown seconds" [] {} 1000 | \
		sed 's/(uint32 \([0-9]\+\),)/\1/g' > /tmp/bis.id)
		if [ $countdown -eq "0" ]
		then
			shutdown -P now
			break
		fi
		sleep 1
		countdown=$((countdown-1))
	done
fi

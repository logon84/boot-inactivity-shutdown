#!/bin/bash
#This script requires xprintidle.
timeout_secs=600
countdown=30

echo "0" > /tmp/bis.id
sleep $timeout_secs
while [ $(xprintidle) -gt $((1000*(timeout_secs-2))) ]
do
	countdown=$((countdown-1))
	$(gdbus call --session \
	--dest org.freedesktop.Notifications \
	--object-path /org/freedesktop/Notifications \
	--method org.freedesktop.Notifications.Notify bis \
	"$(</tmp/bis.id)" \
	gtk-dialog-info "Boot Inactivity Shutdown" "Shutting down in $countdown seconds" [] {} 1000 | \
	sed 's/(uint32 \([0-9]\+\),)/\1/g' > /tmp/bis.id)
	sleep 1
	if [ $countdown -eq "0" ]
	then
		shutdown -P now
		break
	fi
done

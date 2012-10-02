#!/bin/sh

if ifconfig en0 | grep inet;
	then if scselect|grep '\*.*Ethernet.*'
		then echo `date` " | No changes made, Location is already set to 'Ethernet'" >> ~/Scripts/toggleLocation.log
	else
		scselect "Ethernet"
		echo `date` " | Changed Network to 'Ethernet'" >> /Users/[username]/Scripts/toggleLocation.log # Change [username] to match yours
		terminal-notifier -message "Ethernet connection detected, Location switched to 'Ethernet'" -title "toggleLocation"
	fi
else
	if scselect|grep '\*.*Automatic.*'
		then echo `date` " | No changes made, Location is already set to 'Automatic'" >> ~/Scripts/toggleLocation.log
	else
		scselect "Automatic"
		echo `date` " | Changed Network to 'Automatic'" >> /Users/[username]/Scripts/toggleLocation.log # Change [username] to match yours
		terminal-notifier -message "Ethernet connection lost, Location switched to 'Automatic'" -title "toggleLocation"
	fi
fi
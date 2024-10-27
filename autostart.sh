#!/bin/bash

# launch autostart apps
trap "" SIGHUP; bash -c 'flatpak run com.discordapp.Discord' &
trap "" SIGHUP; bash -c 'flatpak run com.todoist.Todoist' &
trap "" SIGHUP; bash -c 'flatpak run com.valvesoftware.Steam' &
trap "" SIGHUP; bash -c 'flatpak run org.mozilla.Thunderbird' &
trap "" SIGHUP; bash -c 'flatpak run org.mozilla.firefox' &
trap "" SIGHUP; cat /path/to/dolphin-autostart-tabs | sed 's/.*/"&"/' | tr '\n' ' ' | xargs dolphin &

# loop until quick starting windows initialise
i=0
while [ $i -le 5 ]
do
        sleep 1
        # check if application 2 has initialised
        window2=$(kdotool search --name "Thunderbird")
        if [ "$window2" != "" ]
        then
                # minimise the window
                for w in $window2
                do
                        kdotool windowmove "$w" 0 0 windowsize "$w" 1280 984 windowminimize "$w"
                done
        fi
        # check if application 3 has initialised
        window3=$(kdotool search --name "Discord")
        if [ "$window3" != "" ]
        then
                # minimise the window
                for w in $window3
                do
                        kdotool windowmove "$w" 0 0 windowsize "$w" 1280 984 windowminimize "$w"
                done
        fi
        # check if application 4 has initialised
        window4=$(kdotool search --name "Todoist")
        if [ "$window4" != "" ]
        then
                # minimise the window
                for w in $window4
                do
                        kdotool windowmove "$w" 0 0 windowsize "$w" 1280 984 windowminimize "$w"
                done
        fi
        # check if application 6 has initialised
        window6=$(kdotool search --name "Dolphin")
        if [ "$window6" != "" ]
        then
                # minimise the window
                for w in $window6
                do
                        kdotool windowmove "$w" 2560 0 windowsize "$w" 1280 984 windowminimize "$w"
                done
        fi
i=$((i+1))
done
# loop until slow starting windows initialise
while [ $i -le 20 ]
do
        sleep 1
        # check if application 1 has initialised
        window1=$(kdotool search --name "Mozilla Firefox")
        if [ "$window1" != "" ]
        then
                # minimise the window
                for w in $window1
                do
                        kdotool windowmove "$w" 0 0 windowsize "$w" 1280 984 windowminimize "$w"
                done
        fi
        # check if application 5 has initialised
        window5=$(kdotool search --name "Steam")
        if [ "$window5" != "" ]
        then
                # minimise the window
                for w in $window5
                do
                        kdotool windowmove "$w" 2560 0 windowsize "$w" 1280 984 windowminimize "$w"
                done
        fi
i=$((i+1))
done
exit

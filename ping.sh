#!/bin/bash

state=1;

while true; do
    if [ `ping -c4 -t4 74.125.226.232 | grep "0 packets received" | wc -l` -lt 1 ]; then
        echo -n "good: "
        date
        if [ $state -lt 1 ]; then
            echo "state change +"
            state=1;
            open good.mp3
        fi
    else
        echo -n "bad: "
        date
        if [ $state -gt 0 ]; then
            echo "state change -"
            state=0;
            open bad.mp3
        fi
    fi
done

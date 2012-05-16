#!/bin/bash

state=1;

while true; do
    if [ `host google.com 2>&1 | wc -l` -gt 1 ]; then
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

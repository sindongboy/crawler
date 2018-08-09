#!/bin/bash

total=`cat ../seeds/seeds.pages | wc -l | sed 's/  *//g'`
while :
do
    clear
    num=`find $1 -type f -name "*" | wc -l`
    echo "${num} / ${total}"
    sleep 1
done

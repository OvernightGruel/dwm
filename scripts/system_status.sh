#!/bin/bash

week=$(date '+%A')
case "$week" in
	"Monday") week_cn="一" ;;
	"Tuesday") week_cn="二" ;;
	"Wednesday") week_cn="三" ;;
	"Thursday") week_cn="四" ;;
	"Friday") week_cn="五" ;;
	"Saturday") week_cn="六" ;;
	"Sunday") week_cn="日" ;;
esac
localtime=$(date +"%Y-%m-%d(${week_cn})%H:%M")

vol=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")

hdfree=$(df -h /dev/nvme0n1p3 | awk ' /[0-9]/ {print $3 "/" $2}')

memfree=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%2.2f%\n", (( $3 / $2 ) * 100))}')

loadavg=$(cut -d " " -f 1,2,3 /proc/loadavg)

xsetroot -name " ${loadavg} | ${memfree} | ${hdfree} | ${vol} | ${localtime} "


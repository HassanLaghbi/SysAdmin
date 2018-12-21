#!/bin/bash

#Spawning Firefox
spawn_firefox()
{
firefox &
}

#Collecting Process Level Metrics for firefox
process_level_metrics_collector()
{
echo -n "$SECONDS, " >> process_metrics.csv
ps aux | grep firefox | head -1 | awk '{print $3", " $4}' >> process_metrics.csv
}

#Collecting System Level Metrics
system_level_metrics_collector()
{
#Network Bandwidth Utilization
echo -n "$SECONDS, " >> system_metrics.csv
ifstat_output=$(ifstat | grep enp0s3 | awk -v ORS='' '{ print $7 ", " $9 ", "}')
echo -n "${ifstat_output//K}" >> system_metrics.csv

#Hard Disk Access Rates
iostat | grep sda | awk -v ORS='' '{ print $4 ", "}' >> system_metrics.csv

#Hard Disk Utilization
df -m | grep 'centos-root' | awk '{print $4}' >> system_metrics.csv
}


#Running. Click ctrl+c to to Trap!
time_keeper()
{
ifstat -d 1
while [ true ]
do
	sleep 2
	process_level_metrics_collector
	system_level_metrics_collector
	echo "Seconds: " $SECONDS	
done
}


#Killing Processes
cleanup()
{
pkill firefox
pkill ifstat
}
trap cleanup EXIT

#Inserting title fields to the files
echo "SECONDS, CPU, MEMORY" > process_metrics.csv
echo "SECONDS, RX Data Rate, TX Data Rate, Disk Writes, Avaliable Disk Capacity" > system_metrics.csv

#Calling Functions
spawn_firefox
time_keeper



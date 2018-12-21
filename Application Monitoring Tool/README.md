# Application Monitoring Tool in Bash

This bash script runs firefox in background (you can set your own application instead). It then collects process level metrics (about firefox) as well as general system level metrics each two seconds. For process level metrics, the script collects 'seconds', 'CPU' and 'memory'. For system level metrics, the script collects 'seconds', 'RX Data Rate', 'TX Data Rate', 'Disk Writes' as well as 'Avaliable Disk Capacity'. The script outputs two files, 'process_metrics.csv' and 'system_metrics.csv'. To stop the script, simply click "ctrl+c". 
### How to run?
This script was tested on a VirtualBox Centos7 VM, but it is supposed to run on any system with some modifications. Make sure to delete any previous output files before running the script. Also, make sure to change the disk name as well as the network interface name; in my VM, the network interface name is "enp0s3". Your can check it using 'ifconfig'.
```bash
sudo ./applicatoin_monitoring_tool.sh
```
### Sample Output
##### process_metrics.csv
```bash
SECONDS, CPU, MEMORY
2, 47.6, 4.5
4, 30.8, 5.1
6, 25.7, 4.9
8, 0.0, 0.0
10, 0.0, 0.0
```
##### system_metrics.csv
```bash
SECONDS, RX Data Rate, TX Data Rate, Disk Writes, Avaliable Disk Capacity
2, 35, 23, 228.84, 34942
4, 33, 22, 228.68, 34942
6, 32, 22, 228.56, 34942
8, 399, 319, 229.12, 34942
10, 370, 295, 229.11, 34942
```

#!/usr/bin/python
import sys
import subprocess

if len(sys.argv) < 2 or len(sys.argv) > 2:
    print "usage: md5_data_integrity_checker.py file_name"
    quit()

file_name = sys.argv[1]

f = open (file_name, 'r')
#Reading the First Line
line = f.readline()
#Looping Through the File
while line:
    exe_name = line.partition(' ')[0]
    #Getting rid of "\n"
    if (len(line.partition(' ')[2]) == 33):
        md5_original = line.partition(' ')[2][:-1]
    else:
        md5_original = line.partition(' ')[2]
    
    #Hashing the executable
    argument = "md5sum /usr/bin/"+str(exe_name)+" | awk '{print $1}'"
    md5_new = subprocess.check_output(argument, shell=True)
    #Getting rid of "\n"
    md5_new = md5_new[:-1]
    if (md5_original != md5_new):
        print exe_name+" executable is effected!"
    #reading the next line
    line = f.readline()
f.close()


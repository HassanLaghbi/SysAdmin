#!/bin/bash
my_input_file="/home/student/Desktop/NewUserAccounts.txt"

groupadd -g 1002 "Engineering"
groupadd -g 1003 "Marketing"
groupadd -g 1004 "Manufacturing"
groupadd -g 1005 "Administrative"
groupadd -g 1006 "Sales"

while read line
do

fullname=$( echo "$line" |cut -d"    " -f 1 )
office=$( echo "$line" |cut -d"    " -f 2 )
phone=$( echo "$line" |cut -d"    " -f 3 )
department=$( echo "$line" |cut -d"    " -f 4 )

lastname=$( echo "$fullname" |cut -d ',' -f 1  )
firstname=$( echo "$fullname" |cut -d " " -f 2  )
middlename=$( echo "$fullname" |cut -d " " -f 3  )

firstletter=$( echo "$firstname" |cut -c 1  )
secondletter=$( echo "$middlename" |cut -c 1  )
thirdletter=$( echo "$lastname" |cut -c 1  )

username=$firstletter$secondletter$thirdletter

if [[ "$department" == *"Engineering"* ]]; then
useradd -m -c "$fullname,$office,$phone" -g 1002 -p 12345 $username"E"
elif [[ "$department" == *"Marketing"* ]]; then
useradd -m -c "$fullname,$office,$phone" -g 1003 -p 12345 "$username""m"
elif [[ "$department" == *"Manufacturing"* ]]; then
useradd -m -c "$fullname,$office,$phone" -g 1004 -p 12345 "$username""M"
elif [[ "$department" == *"Administrative"* ]]; then
useradd -m -c "$fullname,$office,$phone" -g 1005 -p 12345 "$username""A"
elif [[ "$department" == *"Sales"* ]]; then
useradd -m -c "$fullname,$office,$phone" -g 1006 -p 12345 "$username""S"
fi
#useradd -m -c "$fullname,$office,$phone" -p 12345 "$username"

done < "$my_input_file"


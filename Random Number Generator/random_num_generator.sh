#!/bin/bash

#cmd_args_handler() handles the command line arguments
cmd_args_handler()
{
    #in case zero (or only one of the min and max options is entered), an error msg is prompted)
    if [ $num_of_cmd_args -eq 0 ] || [ $num_of_cmd_args -eq 2 ]
    then
       echo "random_num_generator.sh: usage random_num_generator.sh [number_of_random_numbers] <min> <max>"
       exit
    #in case the optional args are left blank
    elif [ -z $min ] || [ -z $max ]
    then
       true
    #in case the user entered a min value that is >= max or if the entered min or max is zero
    elif [ $min -ge $max ] || [ $min -lt 1 ] || [ $min -gt 32767 ] || [ $max -gt 32767 ]
    then
       echo "random_num_generator.sh: max must be greater than min, and both must not be < 1 nor > 32767"
       exit
    fi
}


#random_nums_generator() generates random numbers based on user choice
random_nums_generator()
{
count=0
while [ $count -lt $num_rands ]
    do
      random_num=$RANDOM
      #in case min and max are entered
      if [ $num_of_cmd_args -eq 3 ]
      then
         if [ $random_num -ge $min ] && [ $random_num -le $max ]
         then
             #calling num_writer() function and passing the ramdom number to it
             num_writer $random_num
             (( count++ ))
         fi
       #in case min and max are not specified
       elif [ $num_of_cmd_args -eq 1 ]
       then
          num_writer $random_num
          (( count++ ))
       fi   
     done
}


#num_writer() writes each rand num to the output file
num_writer()
{
echo $"$1" >> rands_"$num_rands".txt 
}

#largest_num_calc() outputs the largest random number generated
largest_num_calc()
{
awk 'BEGIN {largest = 0} {if ($1>largest) largest=$1} END {print largest}' rands_"$num_rands".txt
}


#smallest_num_calc() outputs the smallest ramdom number generated
smallest_num_calc()
{
awk 'BEGIN {smallest = 23767 } {if ($1<smallest) smallest=$1} END {print smallest}' rands_"$num_rands".txt
}


#avg_calc() outputs the integer average of the random numbers generated
avg_calc()
{
nums_sum=$(paste -sd+ rands_"$num_rands".txt | bc)
avg=$(( $nums_sum / $num_rands ))
echo $avg
}


#msg_printer() prints messages to user about the results
msg_printer()
{
if [ $num_of_cmd_args -eq 3 ]
then
echo "You requested $num_rands numbers between $min and $max"
echo "The smallest value generated was: "; smallest_num_calc
echo "The largest value generated was: "; largest_num_calc
echo "The average value was: "; avg_calc
else
echo "You requested $num_rands numbers"
echo "The smallest value generated was: "; smallest_num_calc
echo "The largest value generated was: "; largest_num_calc
echo "The average value was: "; avg_calc
fi
}


#num_of_cmd_args is used to fix the issue that both cmd args and funciton args use the same notation
num_of_cmd_args=$#


#storing the cmd line args into 3 variables
num_rands=$1
min=$2
max=$3

#calling the functions
cmd_args_handler
random_nums_generator
msg_printer


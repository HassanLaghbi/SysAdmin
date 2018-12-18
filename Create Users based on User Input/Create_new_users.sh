#!/bin/bash

#users_adder() prompts for input and adds new users
users_adder()
{
while true
do
	read -p 'Enter A Uesrname: ' username
	read -p 'Enter the Full Name: ' full_name
	read -p 'Enter the Department: ' department
	read -p 'Enter the Job Title: ' job_title
	read -sp 'Enter A Password: ' password
	useradd $username
	#calling the three functions
	file_system_writer
	letter_writer
	permission_editor
	echo
	echo "User $username added! "
	read -p 'Would you like to add another user?(y/n): ' yes_or_no
	if [ $yes_or_no = 'y' ] || [ $yes_or_no = 'yes' ] 
	then
		continue
	elif [ $yes_or_no = 'n' ] || [ $yes_or_no = 'no' ]
	then 
		exit
	else
		echo "Create_new_users.sh: INVALID INPUT!"
		exit
	fi
done
}


#this function creates the directories and places the files in the new user's home directory
file_system_writer()
{
mkdir /home/$username/Desktop
mkdir /home/$username/Documents
mkdir /home/$username/Downloads
mkdir /home/$username/Pictures
}


#This funciton changes the permissions for users' files and directories
permission_editor()
{
#chaning ownership and group membership
chown -R $username:$username /home/$username
chmod 444 /home/$username/Documents/welcome.txt
}


#This function writes the employee welcome letter
letter_writer()
{
read -r first_name _ <<< "$full_name"
echo "
Dear $first_name,

Welcome to x company! We’re so happy to have you with us in the $department Department as a $job_title.

Sincerely,

" > /home/$username/Documents/welcome.txt
}


#calling users_adder() function
users_adder


#importing sys & paramiko modules
import sys, paramiko

#Handling the effect of entering less than two args; (first arg is the script name itself)
if len(sys.argv) < 3:
   print "usage: linux_server_orchestration.py server_addres file_to_upload"

server_address = sys.argv[1]
source_file = sys.argv[2] #to upload
dest_file = source_file

#Put the username of user server
username = ''
port = 22
#Command to be run on the server
cmd1 = 'sudo ls -la > output.txt'

#SFTPing to and from server
#Put the link to your SSH key
mykey = paramiko.RSAKey.from_private_key_file('/home/.../.ssh/id_rsa')
#Creating a Transport object with the IP address of the server and the port (Port 22 for SSH)
t = paramiko.Transport((server_address, port))
#Connecting to the server
t.connect(username=username, pkey=mykey)
#creating an SFTP client from the Transport socket object
sftp = paramiko.SFTPClient.from_transport(t)
#Uploading the source file
sftp.put(source_file, dest_file)

#SSHing to the server
#Creating an SSHClient object
client = paramiko.SSHClient()
#Loading any local SSH keys, if they exist
#client.load_system_host_keys()
#Create a policy for logging a warning in Python if local SSH keys do not exist
client.set_missing_host_key_policy(paramiko.WarningPolicy)
#Connecting to the server
client.connect(server_address, port=port, username=username, pkey=mykey)
#Running the contents of command cmd1
stdin, stdout, stderr = client.exec_command(cmd1)
#Downloading the output file from the server
sftp.get("output.txt")
#Closing the socket and connections
client.close()
t.close()



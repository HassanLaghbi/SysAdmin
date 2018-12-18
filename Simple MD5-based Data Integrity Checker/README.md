# Simple MD5-based Data Integrity Checker

## ?
This Python script takes an input file, as a CLI argument, which should contain the MD5 message digests for all exeutables in CentOS's "/usr/bin" directory along with their names. The script then calculates the MD5 message digest for each executable in the "/usr/bin" directory and compares it with that in the original input file. If they are not identical, the script outputs the name of the executable as an effected executable. 

## Input File Format
<executable_name> <md5_message_digest>

#### Example:

* teamnl 280f365eb43ed637a8ccbfc5e2a8436c
* tee a759c711e743367462ea13bba7a5b1db
* telepathy-gabble-xmpp-console e5a3df009b1a87ff80df2fd2e984aa0a
* test 302c9dffc1782aefaba625ab449f233d
testgdbm f60ff41eb9b17e49c08e88e3c368e610 . 
testlibraw f98540ebf64f5373a4ab6dac9ce3a3eb . 
testparm 7021ee6f52e5f550f90a75371e9ebcf5 . 
test_ppa ac4e795fe3c0aee28abbedd96ee950a5 . 
text2wave 947975cd1569665a82b8d1b233bd8161 . 
tgz 69d1895cc03b650c9cccdd69570a55b8 . 
tic be596c0be1593d521be35ecb66353fa5 . 
time 059ff0ad8440fad965a5eb84906f4c2f . 

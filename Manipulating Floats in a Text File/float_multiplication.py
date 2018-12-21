
f = open ('textFile.txt', 'r')
nf = open ('newTextFile', 'w')

resulting_list = []

#Reading the first line
line = f.readline()
while line:
    #Getting rid of \n after each line
    without_newline = line[:-1]
    #Splitting the string line to a list called "splitted"
    splitted_list = without_newline.split(',')
    #Muliplying the first four floats by 2 and replacing them with the muliplication results
    for i in range(len(splitted_list)-1):
        num = float(splitted_list[i])*2
        splitted_list[i] = num
    #Adding the "splitted_list" to the "resulting_list"
    resulting_list.extend(splitted_list)
    #Converting the list to string
    the_line = ','.join(str(e) for e in splitted_list)
    #Getting rid of the "," at the end of the string
    the_line = the_line[:-1]+'\n'
    #Writing the line to the new file
    nf.write(the_line)
    #Reading the next line
    line = f.readline()

#Closing the files
f.close()
nf.close()


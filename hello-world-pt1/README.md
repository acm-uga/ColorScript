# Hello World.sh
## Activity Outline
Create your first bash script!
In the script have it print out text to the terminal when you run it

## Concepts 

### Why is it useful?
Bash scripts can be really useful when you want to run a certain set of commands but don't feel like typing it out everytime.\
Example: A script to compile your java code
```
#!/bin/bash
rm -rf bin
mkdir bin
javac -d bin src/*
java -cp bin filename
echo "Java program successfully executed!"
```

### .sh file extension and shebang
The .sh file is a bash scripting file and is typically interpretted by the shell you are running.\
Very portable and runnable by most computers\
Every file needs to start with the shebang line.\
```
#!/path/to/interpreter
```
For most computers this line will actually be
```
#!/bin/bash
```
Adding this line to the beginning of the file notifies the computer to look inside of the /bin directory to find the bash command.

### Running a bash script
Bash scripts are very simple to run. Suppose you have a script called\ 
```helloWorld.sh```
If you wanted to run this script you would type:
```./helloWorld.sh```
The computer would execute the file read the shebang and know to execute bash and then the script commands that follow\
If you get a permission denied error when you try to run the script\
```chmod 700 scriptName.sh```

### Echo
echo is a command that takes in a string as an argument and then prints it back out to you
``` echo "The string you want to print out ```
This code will execute and return 
```"The string you want to print out```
This is useful for printing out things to the user in a bash script.

### Example
Provided below is a bash script that prints out multiple lines of text
```
!#/bin/bash

echo "Hello World!"
echo "I really dislike bash programming"
echo "Terminal is stupid."
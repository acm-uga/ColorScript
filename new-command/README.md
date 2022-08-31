# Create Command Activity

## Activity Outline
Create a shell script that can be ran from anywhere./
In order to do this you will need to add to your PATH environment variable where your script is located.\

## Concepts

### Create script that does something
For this tutorial you should create a script that does something and can execute\
so you can test if you were able to add it to your path

### PATH
PATH contains a string of directories separated by colons. The way that PATH is used is that any executable files in the directories listed in PATH can be executed without specifying the full path to the file. This allows you to run those executables with only the file name from the command line

```
echo $PATH
```

### Adding the script to your path temporarily
To update the PATH temporarily (in the terminal session you are using and only that session), you can just use export from the command line. For example, if you have created a directory called /home/local/bin, and put your executable hello.sh in that directory, you could update the PATH in your current terminal session like this:
```
export PATH=$PATH:/home/local/bin
```

### Adding the script to your path "PERMANENTLY"
In order to add it to your path permanently you have to modify the initialization process of your terminal to run:
```
export PATH=$PATH:/home/local/bin
```
whenever you create a new one.\
Locate your .zshrc or .bashrc files and paste
```
export PATH=$PATH:/home/local/bin
```
At the bottom of your file\
This file will automatically run whatever commands you put in it when you load up a new terminal


### Testing
Change to a different directory and try to run the script
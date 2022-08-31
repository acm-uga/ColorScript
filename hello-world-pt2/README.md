# Hello World.sh

## Activity Outline
In the hello-world-pt1 activity you should have created a script that prints text in the terminal when you run it.
For the second part of this activity your script should prompt the user to type in a string/
You should save their input into a variable and then print out their input with text in the terminal.

## Concepts 

### read Command (save user input into a variable)
The read command provides a prompt in the terminal for the user to type in a string. This command can also be used to save\
the input into a variable for later use.
```
read -r variableName
```

### How to use a variable in a string
In bash if we want to print a variable we need to enclose it in special syntax
In the example above we read input into variableName.
Now we will print out to the screen what that variable was
```
echo "Enter the value of your variable:"
read -r variableName
echo "${variableName} this is the printed variable!"
```
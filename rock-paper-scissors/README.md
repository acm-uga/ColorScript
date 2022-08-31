# Rock Paper Scissors Shoot game

## Activty Outline

In this activity your challenge is to make a rock-paper-scissors game from scratch.\
1. Welcome the user to the game
2. Prompt the user to pick rock, paper, or scissors
3. Generate computer's choice
4. Compare user and computer choice
5. Print out who wins

## Core Concepts

### How to declare and store a variable
```
randomString="Hello World!"
```
### How to read user input
Reads the user input into a variable name
```
read -r variableName
```

### How to use a variable in a string
In bash if we want to print a variable we need to enclose it in special syntax
In the example above we read input into variableName.
Now we will print out to the screen what that variable was
```
echo "${variableName} this is the printed variable!"
```
### How to make an if statement for comparison
This is a basic template for how to run a simple if statement for string comparison
Assume we read in a variable called selection that is 1 - 3
In this block, we are checking if selection = 1
Inside of the outside if block we are using a nested if statement for further comparison
```
if [ "${selection}" = "1" ]; then 
        echo "You chose 1."
        # Nested if statements to determine who won
        if [ "${otherSelection}" = "2" ]; then
            echo "Your other selection was 2"
        elif [ "${otherSelection}" = "3" ]; then
            echo "Your other selection was 3"
        else 
            echo "oops?"
        fi
```

### Random number generation
This will show you how to generate a random number and then save it to a variable
The $RANDOM will automatically generate a random number and we use % 3 to limit it to 3 choices.
Then we add + 1 to provide a lower bound. So the range of numbers this will generate is 1 - 3.
```
computerChoice=$(($RANDOM % 3 + 1))
```


### Psuedocode

Print out a few lines saying hello and what the game is
Print out a selection box
Take in user input (I use numbers for this makes it easier) and store it in variable
Generate the computers random choice
Compare user and computer choice and determine who won
Print out in terminal who won
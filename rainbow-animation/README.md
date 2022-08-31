# ColorScript

## Core Concepts
### How to declare and store a variable
```
randomString="Hello World!"
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

### For statements:
- ```
    for num in {0..50}; do
        commands
    done
  ```
- for loops using variables
  ```
    for i in $(eval echo "{0..$RANGE}"); do
        commands
    done
  ```

### String Manipulation
The only thing needed for this is getting the length of the string `${#varName}` and string slicing. The syntax is `${varName:index:length}` where the index is the index (from 0 to `${#varName}` - 1) and the length is the amount of characters you want sliced from it. This does nothing to the original string
```
name="Hello"
echo ${name:0:2} => "He"
echo ${name:1:1} => "e" 
echo ${#name} => 5
```

### Arguments:
Arguments are given by `$1`, `$2`, etc., `$#` is the number of arguments given, and `$*`/`$@` is all the arguments. This is true for both functions in bash scripting and the script itself (from giving arguments in the command line)

### Arrays
Although not needed for this, it may make it easier, so here is some brief syntax on them.
- Creating one: `arr=()` for an empty one, `arr=("Hello" "World")` for a populated array of length 2.
- Using one: `${arr[index]}` where the index is the index of the array holding the value you want.
- Appending one: `arr+=("Hello")`
- Overriding a value in an array: `arr[index]="Hello"` where the index is the index of the array holding the value you want to override.

### Terminal Colors
There are 3 main ways to do colors on the terminal. The easiest way is to insert `\033[(30-38)m`. This is the code for each color:
| Color | Number |
| ----------- | ----------- |
| Black | 30 |
| Red | 31 |
| Green | 32 |
| Yellow | 33 |
| Blue | 34 |
| Magenta | 35 |
| Cyan | 36 |
| White | 37 |

For more info on this, please [refer to this](https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit)

If the color is more complex, I recommend inserting `\033[38;2;<r>;<g>;<b>m` where the letters in <> are the color's respective rgb values.

For more info on the real colors, please [refer to this](https://en.wikipedia.org/wiki/ANSI_escape_code#24-bit)

For either one, insert at the beginning of where you want the text to have the color, and at the end of the desired text, insert either another color or `\033[0m` to go to default colors.

### Psuedocode

Create a function that inserts the color codes in the given string, with an offset option. Then make a function to change the offset, thus giving the impression that it is being animated.

### More
[Here is a bash cheat sheet](https://devhints.io/bash#conditionals)
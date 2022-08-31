# ColorScript

## Core Concepts

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

### Bash Cheat Sheet
[Here is a bash cheat sheet](https://devhints.io/bash#conditionals)
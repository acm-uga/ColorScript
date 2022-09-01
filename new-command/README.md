# Create Command Activity

## Activity Outline
Create a shell script that can be ran from anywhere./
In order to do this you will need to add to your PATH environment variable where your script is located.\

## Concepts

### Make the .sh file targetable
In order to target the new .sh command you created you need to add it to your path and also change the file extension.
First create a new directory for your command to go into.
Then move your command script in there and change the name to remove the .sh part

### Create script that does something
For this tutorial you should create a script that does something and can execute\
so you can test if you were able to add it to your path\
Feel free to use copy and paste this script into a .sh file:
```
RED='\033[38;2;255;0;0m'
RED_TO_ORANGE_1='\033[38;2;255;77;0m'
RED_TO_ORANGE_2='\033[38;2;255;112;0m'
ORANGE='\033[38;2;255;140;0m'
ORANGE_TO_YELLOW_1='\033[38;2;255;178;0m'
ORANGE_TO_YELLOW_2='\033[38;2;255;216;0m'
YELLOW='\033[38;2;255;255;0m'
YELLOW_TO_GREEN_1='\033[38;2;206;255;0m'
YELLOW_TO_GREEN_2='\033[38;2;144;255;0m'
GREEN='\033[38;2;0;255;0m'
GREEN_TO_BLUE_1='\033[38;2;0;213;216m'
GREEN_TO_BLUE_2='\033[38;2;0;155;255m'
BLUE='\033[38;2;0;0;255m'
BLUE_TO_INDIGO_1='\033[38;2;66;0;210m'
BLUE_TO_INDIGO_2='\033[38;2;77;0;168m'
INDIGO='\033[38;2;75;0;130m'
INDIGO_TO_VIOLET_1='\033[38;2;93;0;169m'
INDIGO_TO_VIOLET_2='\033[38;2;111;0;211m'
VIOLET='\033[38;2;127;0;255m'
VIOLET_TO_RED_1='\033[38;2;240;0;173m'
VIOLET_TO_RED_2='\033[38;2;255;0;89m'
NC='\033[0m'

# The list of colors available
colors=(
    "red::${RED}"
    "blue::${BLUE}"
    "orange::${ORANGE}"
)
# The current selected color
selectedColor="${NC}"

# Sets the selectedColor variable to the correct color code
get_color() {
    for i in ${colors[@]}; do
        if [ "${1}" = "${i%%::*}" ]; then 
            selectedColor="${i##*::}"
        fi
    done
}
# Prompts the user for file or text input
printf "${BLUE}Welcome ${VIOLET}to ${GREEN}the ${YELLOW}Terminal ${ORANGE}Text${RED} Colorer ${NC}\n"
printf "Print file or input text in color?\n\t 1. File \n\t 2. Input Text \nPlease enter your selection: "
# Reads the user input
read -r selection
# If statement to switch between file or input text mode
if [ "$selection" = "1" ] ; then
    echo "Not ready yet ;)"
elif [ "$selection" = "2" ] ; then
    printf "\n\nAvailable colors: \n"
    for i in ${colors[@]}; do
        printf "${i##*::}${i%::*} - looks like this ${NC}\n"
    done
    printf "Which color would you like to select:\t"
    read -r colorInput
    get_color "${colorInput}"
    printf "Enter ${YELLOW}below${NC} the text that you want to be colored ${selectedColor}${colorInput}${NC}:\n"
    read inputText
    echo "Your Colored Text: "
    printf "${selectedColor}${inputText}\n"
fi
```

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
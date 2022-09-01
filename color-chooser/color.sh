#!/bin/bash
# This chunk of code at the top is to define what each of the colors are, as stored by your system.
# More Info on colors: https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
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
# Since bash is weird and data structures are a pain for it we are storing the values of our colors like this
# colorName::<the color code value for the color>
# DO NOT PUT COMMAS IN HERE
colors=(
    "red::${RED}"
    "blue::${BLUE}"
    "orange::${ORANGE}"
)
# The current selected color
selectedColor="${NC}"

# Sets the selectedColor variable to the correct color code (IGNORE THIS IS NOT WHAT YOU WANT TO LOOK FOR)
get_color() {
    for i in ${colors[@]}; do
        if [ "${1}" = "${i%%::*}" ]; then 
            selectedColor="${i##*::}" # make selected color the desired color
        fi # if input matches color name (red, taking out chars past ::)
    done # for every element of colors array
}
# Prompts the user for file or text input
printf "${BLUE}Welcome ${VIOLET}to ${GREEN}the ${YELLOW}Terminal ${ORANGE}Text${RED} Colorer ${NC}\n"
printf "Print file or input text in color?\n\t 1. File \n\t 2. Input Text \nPlease enter your selection: "
# Reads the user input
read -r selection
# If statement to switch between file or input text mode
if [ "$selection" = "1" ] ; then
    echo "Not ready yet ;)" # prints string to terminal
elif [ "$selection" = "2" ] ; then
    printf "\n\nAvailable colors: \n"
    for i in ${colors[@]}; do
        printf "${i##*::}${i%::*} - looks like this ${NC}\n" # gives example of color
    done # for every element in colors array
    printf "Which color would you like to select:\t"
    read -r colorInput # gets color from user
    get_color "${colorInput}" # parses user color
    printf "Enter ${YELLOW}below${NC} the text that you want to be colored ${selectedColor}${colorInput}${NC}:\n"
    read inputText # gets colored text
    echo "Your Colored Text: " # prints the text
    printf "${selectedColor}${inputText}\n" # prints colored text
fi
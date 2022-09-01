#!/usr/bin/bash -e
#To create color: add '\033[38;2;r;g;bm'
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

#make array of colors
declare -a rainbowArray
rainbowArray+=($RED)
rainbowArray+=($RED_TO_ORANGE_1)
rainbowArray+=($RED_TO_ORANGE_2)
rainbowArray+=($ORANGE)
rainbowArray+=($ORANGE_TO_YELLOW_1)
rainbowArray+=($ORANGE_TO_YELLOW_2)
rainbowArray+=($YELLOW)
rainbowArray+=($YELLOW_TO_GREEN_1)
rainbowArray+=($YELLOW_TO_GREEN_2)
rainbowArray+=($GREEN)
rainbowArray+=($GREEN_TO_BLUE_1)
rainbowArray+=($GREEN_TO_BLUE_2)
rainbowArray+=($BLUE)
rainbowArray+=($BLUE_TO_INDIGO_1)
rainbowArray+=($BLUE_TO_INDIGO_2)
rainbowArray+=($INDIGO)
rainbowArray+=($INDIGO_TO_VIOLET_1)
rainbowArray+=($INDIGO_TO_VIOLET_2)
rainbowArray+=($VIOLET)
rainbowArray+=($VIOLET_TO_RED_1)
rainbowArray+=($VIOLET_TO_RED_2)

#Makes the text given to it rainbow color
#@pre: must be given a string argument
#@post: returns a rainbow string
#@param $1: string to make rainbow color
#@param $2: integer to control how many 
#           characters in a group get the
#           same color
#@param $3: integer to control the offset
#           location of where the color
#           is inserted
#returns: 1 if error, string if success
function rainbowColor() {
    STEPS=2 #width of color group
    OFFSET=0 #offset
    if [[ $# -eq 0 || $# -gt 3 ]]; then
        return 1 #if number of args is unacceptabe
    elif [[ $# -eq 3 ]]; then
        STEPS=$2
        let OFFSET=$3 #if filled, pass args to vars
    elif [[ $# -eq 2 ]]; then
        STEPS=$2 #if filled, pass arg to steps
    fi
    let LIM=${#1}/$STEPS #limit of the loop
    if [[ `expr ${#1} % $STEPS` -ne 0 ]]; then
        let LIM=$LIM+1 
    fi # if there is leftover chars, icorporate them
    let ELEM=-$OFFSET/$STEPS #color picker
    let OFFLIM=$OFFSET%$STEPS # minimize range of offset
    arr=() #new array
    if [[ $OFFLIM -ne 0 ]]; then
        let TEMP=$ELEM-1
        let ELEMWRAP=$TEMP%${#rainbowArray[@]}
        arr=("${rainbowArray[$ELEMWRAP]}${1:0:$OFFLIM}")
    fi #if offset leaves out first chars, get them in first
    INDEX=0 #index for while loop
    while [ $INDEX -lt $LIM ]; do
        let POINT=$INDEX*$STEPS+$OFFLIM #get index of string
        let ELEMWRAP=$ELEM+$INDEX #get the wrap arounf of the color
        let ELEMWRAP=$ELEMWRAP%${#rainbowArray[@]}
        if [[ $ELEMWRAP -lt 0 ]]; then
            let ELEMWRAP=${#rainbowArray[@]}+$ELEMWRAP
        fi
        arr=("${arr[@]}${rainbowArray[$ELEMWRAP]}${1:$POINT:$STEPS}")
        let INDEX=$INDEX+1 # push to array and increment index
    done #while there are still chars left
    arr=(${arr[@]}${NC})
    echo ${arr[@]} #output array when done
}

#Animates the rainbow effect
#@pre: must be given a string argument
#@post: returns an animated string
#@param $1: string to make animated
#returns: strings
function rainbowAnimate() {
    # You do this
}

#From stackoverflow
function cleanup() {
    tput cnorm
} #Makes the cursor normal

trap cleanup EXIT #stackoverflow (guessing it runs when the script is killed)

tput civis #Makes the cursor disappear

echo -e "$(rainbowColor 'alallalalalalalalalalalalalallalalalalala' 2 1)"
rainbowAnimate "rainbow" 1 60
echo -en "\n"
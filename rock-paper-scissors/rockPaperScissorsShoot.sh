printf "\n\nWelcome to Rock Paper Scissors Shoot!\n"

printf "Available options:\n 1. Rock \n 2. Scissors \n 3. Paper\n Your Choice: "
# Generates random number 1 - 3
computerChoice=$(($RANDOM % 3 + 1))
# Read input from the user
read -r selection
# If statements to determine user choice
if [ "${selection}" = "1" ]; then 
        echo "You chose rock."
        # Nested if statements to determine who won
        if [ "${computerChoice}" = "2" ]; then
            echo -e "The computer chose ... scissors.\nYou win!"
        elif [ "${computerChoice}" = "3" ]; then
            echo -e "The computer chose ... paper.\nYou lose!"
        else 
            echo -e "The computer chose ... rock. \nYou tied!"
        fi
    elif [ "${selection}" = "2" ]; then
        echo "You chose scissors."
        if [ "${computerChoice}" = "2" ]; then
            echo -e "The computer chose ... scissors.\nYou tied!"
        elif [ "${computerChoice}" = "3" ]; then
            echo -e "The computer chose ... paper.\nYou win!"
        else 
            echo -e "The computer chose ... scissors. \nYou tied!"
        fi
    elif [ "${selection}" = "3" ]; then
        echo "You chose paper."
        if [ "${computerChoice}" = "2" ]; then
            echo -e "The computer chose ... scissors.\nYou lose!"
        elif [ "${computerChoice}" = "3" ]; then
            echo -e "The computer chose ... paper.\nYou tied!"
        else 
            echo -e "The computer chose ... rock. \nYou won!"
        fi
    else 
        echo "Invalid Choice."
fi
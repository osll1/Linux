#!/bin/bash

# Function to check if a number is a perfect square
is_perfect_square() {
    n=$1
    sqrt=$(echo "sqrt($n)" | bc)
    squared=$((sqrt * sqrt))

    [ $squared -eq $n ]
}

# Function to check if a number is a Fibonacci number and find its index
is_fibonacci() {
    num=$1

    # Calculate two possible values that indicate Fibonacci numbers
    option1=$((5 * num * num + 4))
    option2=$((5 * num * num - 4))

    # Check if either of the calculated values is a perfect square
    if (is_perfect_square $option1) || (is_perfect_square $option2); then
        echo "$num is a Fibonacci number."

        # Find the index of the Fibonacci number
        a=0
        b=1
        index=0

        # Iterate through Fibonacci numbers until a match is found
        while [ $a -ne $num ]; do
            temp=$a
            a=$b
            b=$((temp + b))
            index=$((index + 1))
        done

        echo "$num is at index $index in the Fibonacci."
    else
        echo "$num is not a Fibonacci number."
    fi
}

# Prompt the user to enter a number
#read -p "Enter a number: " user_input
user_input=$1

# Check if the input is a positive integer
if [[ $user_input =~ ^[0-9]+$ ]]; then
    # Call the is_fibonacci function with the user input
    is_fibonacci $user_input
else
    echo "Invalid input. Please enter a positive integer."
fi

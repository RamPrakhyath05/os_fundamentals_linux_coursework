#!/bin/bash

allowed_characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*_-+=[]{|}:<>?/"
len=${#allowed_characters}
read -p "Enter number between 12 & 32: " length
if (( length >= 12 && length <= 32 )); then
    password=""
    for (( i=0; i<length; i++ )); do
        rand=$((RANDOM % (len - 0 + 1) + 0))
        password+="${allowed_characters:$rand:1}"
    done    
    echo "Here's the password: $password"
    echo "Length you asked for: ${#password}"
else
    echo "That ain't a valid input you doofus, enter a number between 12 and 32."
fi


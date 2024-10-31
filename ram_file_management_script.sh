#!/bin/bash
echo "1) List files in alphabetical order"
echo "2) Copy file"
echo "3) Move file"
echo "4) Delete a particular file"
read -p "Enter your choice: " choice

case $choice in
    1)
        ls -a | sort
        ;;
    2)
        read -p "Enter file/directory: " src
        read -p "Enter destination directory: " dest
        if [[ ! -e "$src" ]]; then
            echo "File doesn't exist"
        else
            destination = "$dest/$(basename "$src")" # Searching whether the file is already there in destination
            if [[ -e "$destination" ]]; then
                read -p "File already exists at destination dir, do you wanna overwrite?[y/n] " ans
                if [[ "$ans" == "$y" || "$ans" == "$Y" ]]; then
                    cp "$src" "$dest"
                else
                    echo "Did not copy"
                fi
            else
                cp -r "$src" "$dest"
            fi
        fi
        ;;
    3)
        read -p "Enter file/directory: " src
        read -p "Enter destination directory: " dest
        if [[ ! -e "$src" ]]; then
            echo "File doesn't exist"
        else
            destination = "$dest/$(basename "$src")" # Searching whether the file is already there in destination
            if [[ -e "$destination" ]]; then
                read -p "File already exists at destination dir, do you wanna overwrite?[Y/n] " ans
                if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
                    mv "$src" "$dest"
                else
                    echo "Did not move"
                fi
            else
                mv "$src" "$dest"
            fi
        fi
        ;;
    4)
        read -p "Enter file to delete: " file
        if [[ -f "$file" && "$file" != .* ]]; then
            read -p "Are you sure you want to delete $file? [Y/n] " ans
            if [[ "$ans" == "y" || "$ans" == "Y" ]]; then
                rm "$file"
                echo "$file deleted"
            else
                echo "Did not delete the file"
            fi
        else
            echo "Either file doesn't exist, or you are trying to delete a '.' file. Please try something else"
        fi
        ;;
    *)
        echo "Invalid input."
        ;;
esac



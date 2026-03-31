#!/bin/bash
# Shebang: specifies Bash shell for execution

# Script 5: Open Source Manifesto Generator
# Title of the script

# Author: Atharv | Course: Open Source Software
# Author information

echo "=================================================="
# Prints separator

echo "     The Open Source Manifesto Generator"
# Displays title

echo "=================================================="
# Prints separator

echo "Answer three questions to generate your personalized manifesto."
# Instructions for user

echo ""
# Prints empty line

read -p "1. Name one open-source tool you use every day: " TOOL
# Takes user input for tool name

read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
# Takes user input for meaning of freedom

read -p "3. Name one thing you would build and share freely: " BUILD
# Takes user input for what they would build

DATE=$(date '+%d %B %Y')
# Stores current date

USER_NAME=$(whoami)
# Gets current username

OUTPUT="manifesto_${USER_NAME}.txt"
# Defines output file name

# Alias concept demonstrated via a comment
# alias read_manifesto="cat $OUTPUT"
# Example alias to quickly read manifesto file

echo "=================================================="
# Prints separator

echo "Generating your manifesto..."
# Displays generation message

sleep 1
# Adds delay for effect

# Compose paragraph using variables, utilizing redirection
# Writes content into output file

echo "                    ==== THE OPEN SOURCE MANIFESTO ====" > "$OUTPUT"
# Creates file and writes title (overwrite)

echo "Date: $DATE" >> "$OUTPUT"
# Appends date to file

echo "Author: $USER_NAME" >> "$OUTPUT"
# Appends author name

echo "" >> "$OUTPUT"
# Adds empty line

echo "I believe that software should be treated as a foundation for collective human progress, rather than a walled garden. Every single day, tools like $TOOL empower me to learn, create, and solve complex problems simply because their creators chose to share them with the world. To me, the core of open source is about $FREEDOM. It represents the inherent right to study, the freedom to tinker without boundaries, and the flexibility to adapt existing systems to fit our unique, evolving requirements." >> "$OUTPUT"
# Writes first paragraph using user inputs

echo "" >> "$OUTPUT"
# Adds empty line

echo "Standing directly on the shoulders of giants, I recognize that my own technological journey is fueled entirely by community contributions. In the true spirit of the free software movement, if given the opportunity and resources, I would actively build a $BUILD and distribute it freely under an open-source license. By contributing back to the FOSS ecosystem, we collectively ensure that technology continues to serve everybody, governed by transparent collaboration rather than proprietary control." >> "$OUTPUT"
# Writes second paragraph using user input

echo "Success! Your manifesto has been saved to '$OUTPUT'."
# Displays success message

echo "--------------------------------------------------"
# Prints separator

echo "          Preview of your Manifesto:"
# Displays preview header

echo "--------------------------------------------------"
# Prints separator

cat "$OUTPUT"
# Displays content of the generated file

echo "=================================================="
# Final separator

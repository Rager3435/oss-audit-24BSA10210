#!/bin/bash
# Shebang: specifies Bash shell for execution

# Script 4: Log File Analyzer
# Title of the script

# Usage: ./script4.sh /var/log/syslog "error"
# Shows how to run the script with arguments

# Author: Atharv | Course: Open Source Software
# Author information

LOGFILE=$1
# Takes log file path as first argument

KEYWORD=${2:-"error"} # Default keyword is 'error'
# Takes keyword as second argument, defaults to "error" if not provided

COUNT=0
# Initializes match counter

if [ -z "$LOGFILE" ]; then
# Checks if logfile argument is missing

    echo "Usage: ./script4.sh <path_to_log_file> [keyword]"
    # Displays correct usage

    exit 1
    # Exits script with error code
fi

if [ ! -f "$LOGFILE" ]; then
# Checks if file does not exist

    echo "Error: File $LOGFILE not found."
    # Displays error message

    exit 1
    # Exits script
fi

if [ ! -r "$LOGFILE" ]; then
# Checks if file is not readable

    echo "Error: Cannot read $LOGFILE. You might need sudo permissions."
    # Displays permission error

    exit 1
    # Exits script
fi

# Do-while style retry if the file is empty
# Keeps asking user until a non-empty file is provided

while [ ! -s "$LOGFILE" ]; do
# Checks if file is empty

    echo "The file $LOGFILE is empty."
    # Displays empty file message

    read -p "Would you like to analyze a different file? (Enter path or 'exit'): " LOGFILE
    # Prompts user for new file or exit

    if [ "$LOGFILE" == "exit" ]; then
        exit 0
        # Exits script normally
    fi

    if [ ! -f "$LOGFILE" ]; then
        echo "Error: File $LOGFILE not found."
        # Checks new file existence
        exit 1
    fi

    if [ ! -r "$LOGFILE" ]; then
        echo "Error: Cannot read $LOGFILE. Please try again."
        # Checks read permission
        exit 1
    fi
done

# Read file line by line
# Processes each line in the log file

while IFS= read -r LINE; do
# Reads file safely line by line

    if echo "$LINE" | grep -iq "$KEYWORD"; then
    # Checks if line contains keyword (case-insensitive)

        COUNT=$((COUNT + 1))
        # Increments match counter
    fi

done < "$LOGFILE"
# Redirects file content into loop

echo "=================================================="
# Prints separator

echo " Log Analysis Result"
# Displays result title

echo "=================================================="
# Prints separator

echo "Analyzed File : $LOGFILE"
# Displays file analyzed

echo "Keyword       : '$KEYWORD'"
# Displays keyword used

echo "Total Matches : $COUNT"
# Displays total number of matches

echo "=================================================="
# Prints separator

if [ $COUNT -gt 0 ]; then
# Checks if any matches were found

    echo "Last 5 occurrences recorded in the log:"
    # Displays section header

    echo "--------------------------------------------------"
    # Prints separator

    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
    # Shows last 5 matching lines (case-insensitive)

    echo "=================================================="
    # Prints separator
fi

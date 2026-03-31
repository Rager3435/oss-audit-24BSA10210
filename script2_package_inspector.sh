#!/bin/bash
# Shebang: specifies Bash shell for execution

# Script 2: FOSS Package Inspector
# Title of the script

# Author: Atharv | Course: Open Source Software
# Author information

PACKAGE=$1
# Takes package name as command-line argument

# Default to git if no package is provided
# Checks if input argument is empty

if [ -z "$PACKAGE" ]; then
    PACKAGE="git" 
    # Assigns default package as git
fi

echo "=================================================="
# Prints separator

echo " Checking FOSS Package: $PACKAGE"
# Displays package being checked

echo "=================================================="
# Prints separator

# Check if package is installed
# First checks for dpkg (Debian-based systems)

if command -v dpkg &>/dev/null && dpkg -l "$PACKAGE" &>/dev/null; then
    echo "[+] $PACKAGE is installed."
    # Confirms package is installed

    # Extract version and description
    dpkg -s "$PACKAGE" | grep -E 'Version|Description' | head -n 2
    # Shows version and description (first 2 lines)

elif command -v rpm &>/dev/null && rpm -q "$PACKAGE" &>/dev/null; then
    # Checks for rpm (RedHat-based systems)

    echo "[+] $PACKAGE is installed."
    # Confirms package is installed

    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary'
    # Shows version, license, and summary

else
    echo "[-] $PACKAGE is NOT installed on this system."
    # Message if package is not installed
fi

echo "--------------------------------------------------"
# Prints separator

echo "FOSS Tool Philosophy:"
# Section header

# A case statement to print a short description of its purpose
# Matches package name to predefined descriptions

case $PACKAGE in
    httpd|apache2) 
        echo "Apache: The web server that built the open internet." 
        # Description for Apache
        ;;
    mysql|mysql-server|mariadb-server) 
        echo "MySQL/MariaDB: Open source at the heart of millions of dynamic web apps." 
        # Description for MySQL/MariaDB
        ;;
    git)
        echo "Git: The tool Linus built when proprietary failed him - decentralizing modern software development."
        # Description for Git
        ;;
    vlc)
        echo "VLC: A global media player born from a student project."
        # Description for VLC
        ;;
    firefox)
        echo "Firefox: A nonprofit championing an open, accessible web for everyone."
        # Description for Firefox
        ;;
    python|python3)
        echo "Python: A language shaped entirely by community."
        # Description for Python
        ;;
    *)
        echo "An open-source tool serving the greater FOSS ecosystem."
        # Default description
        ;;
esac

echo "=================================================="
# Final separator

#!/bin/bash
# Shebang: tells the system to use the Bash shell to execute this script

# Script 1: System Identity Report
# A descriptive title for the script

# Author: Atharv | Course: Open Source Software
# Author name and course information

# --- Variables ---
# Section header for variable declarations

STUDENT_NAME="Atharv"
# Stores the student's name in a variable

SOFTWARE_CHOICE="Git"
# Stores the chosen open-source software name

# --- System info ---
# Section header for collecting system information

KERNEL=$(uname -r)
# Gets the Linux kernel version using 'uname -r'

USER_NAME=$(whoami)
# Gets the current logged-in username

UPTIME=$(uptime -p)
# Gets system uptime in a human-readable format (e.g., "up 2 hours")

# Using a fallback mechanism for distribution name
# Comment explaining that we check for OS details safely

if [ -f /etc/os-release ]; then
# Checks if the file /etc/os-release exists (contains OS info)

    DISTRO=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '=' -f 2 | tr -d '"')
    # Extracts the OS name

else
# If the file does not exist

    DISTRO="Linux Distribution"
    # Sets a default fallback value

fi
# Ends the if-else condition

DATE=$(date "+%A, %B %d, %Y %T")
# Gets current date and time in a formatted way

# --- Display ---
# Section header for output display

echo "=================================================="
# Prints a separator line

echo "    Open Source Audit — $STUDENT_NAME"
# Prints report title with student name

echo "=================================================="

echo "Software Choice: $SOFTWARE_CHOICE"
# Displays selected software

echo "Kernel         : $KERNEL"
# Displays kernel version

echo "Distribution   : $DISTRO"
# Displays OS distribution name

echo "User           : $USER_NAME"
# Displays current user

echo "Uptime         : $UPTIME"
# Displays system uptime

echo "Current Date   : $DATE"
# Displays current date and time

echo "=================================================="

echo "License Info   : This operating system is powered by the Linux kernel,"
# Prints first line of license information

echo "                 released under the GNU General Public License v2 (GPL-2.0)."
# Prints second line of license information

echo "=================================================="
# Final separator line

#!/bin/bash
# Shebang: specifies Bash shell for execution

# Script 1: System Identity Report
# Title of the script

# Author: Atharv | Course: Open Source Software
# Author information

# --- Variables ---
# Variable section

STUDENT_NAME="Atharv"
# Stores student name

SOFTWARE_CHOICE="Git"
# Stores chosen software name

# --- System info ---
# System information section

KERNEL=$(uname -r)
# Gets kernel version

USER_NAME=$(whoami)
# Gets current user name

UPTIME=$(uptime -p)
# Gets system uptime

# Using a fallback mechanism for distribution name
# Checks if OS info file exists

if [ -f /etc/os-release ]; then
    DISTRO=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d '=' -f 2 | tr -d '"')
    # Extracts distribution name from os-release file
else
    DISTRO="Linux Distribution"
    # Fallback value if file not found
fi

DATE=$(date "+%A, %B %d, %Y %T")
# Gets formatted current date and time

# --- Display ---
# Output display section

echo "=================================================="
# Prints separator

echo "    Open Source Audit — $STUDENT_NAME"
# Prints title with name

echo "=================================================="
# Prints separator

echo "Software Choice: $SOFTWARE_CHOICE"
# Displays software choice

echo "Kernel         : $KERNEL"
# Displays kernel version

echo "Distribution   : $DISTRO"
# Displays distribution name

echo "User           : $USER_NAME"
# Displays user name

echo "Uptime         : $UPTIME"
# Displays uptime

echo "Current Date   : $DATE"
# Displays date and time

echo "=================================================="
# Prints separator

echo "License Info   : This operating system is powered by the Linux kernel,"
# License info line 1

echo "                 released under the GNU General Public License v2 (GPL-2.0)."
# License info line 2

echo "=================================================="
# Final separator

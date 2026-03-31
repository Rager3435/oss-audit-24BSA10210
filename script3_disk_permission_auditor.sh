#!/bin/bash
# Shebang: specifies Bash shell for execution

# Script 3: Disk and Permission Auditor
# Title of the script

# Author: Atharv | Course: Open Source Software
# Author information

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")
# Array of directories to audit

echo "=================================================="
# Prints separator

echo " Directory Audit Report"
# Displays report title

echo "=================================================="
# Prints separator

for DIR in "${DIRS[@]}"; do
# Loops through each directory in the array

    if [ -d "$DIR" ]; then
    # Checks if the directory exists

        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')
        # Extracts permissions, owner, and group

        SIZE=$(du -sh "$DIR" 2>/dev/null | awk '{print $1}')
        # Gets directory size (suppresses errors)

        echo "Dir: $DIR"
        # Prints directory name

        echo " -> Permissions: $PERMS"
        # Displays permissions info

        echo " -> Size: $SIZE"
        # Displays directory size

        echo "--------------------------------------------------"
        # Prints separator

    else
    # If directory does not exist

        echo "Dir: $DIR does not exist on this system."
        # Displays missing directory message

        echo "--------------------------------------------------"
        # Prints separator
    fi
done

echo "=================================================="
# Prints separator

echo " Software Specific Config Check (Git)"
# Section header for Git config check

echo "=================================================="
# Prints separator

GIT_CONFIG="/etc/gitconfig"
# Path to system-wide Git config file

if [ -f "$GIT_CONFIG" ]; then
# Checks if system-wide config exists

    GIT_PERMS=$(ls -ld "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    # Extracts permissions, owner, and group

    echo "[FOUND] System-wide config: $GIT_CONFIG"
    # Displays found message

    echo "        Permissions: $GIT_PERMS"
    # Displays permissions

else
    echo "[MISSING] System-wide $GIT_CONFIG does not exist."
    # Displays missing message
fi

GIT_USER_CONFIG="$HOME/.gitconfig"
# Path to user-specific Git config file

if [ -f "$GIT_USER_CONFIG" ]; then
# Checks if user config exists

    GIT_USER_PERMS=$(ls -ld "$GIT_USER_CONFIG" | awk '{print $1, $3, $4}')
    # Extracts permissions, owner, and group

    echo "[FOUND] User config: $GIT_USER_CONFIG"
    # Displays found message

    echo "        Permissions: $GIT_USER_PERMS"
    # Displays permissions

else
    echo "[MISSING] User $GIT_USER_CONFIG does not exist."
    # Displays missing message
fi

echo "=================================================="
# Final separator

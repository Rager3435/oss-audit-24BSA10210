#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author : ATHARV U. KONDURKAR | Reg No: 24BSA10210
# Course : Open Source Software | OSS NGMC Capstone Project
# Purpose: Loops through key Linux directories and reports
#          their permissions, ownership, and disk usage.
#          Also checks Firefox's config directory specifically.
# =============================================================

# --- List of important system directories to audit ---
# These are standard Linux directories every OSS admin should know
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr/share")

# --- Display report header ---
echo "================================================================"
echo "         DISK AND PERMISSION AUDITOR                            "
echo "         Student: ATHARV U. KONDURKAR | Reg: 24BSA10210        "
echo "================================================================"
echo ""
echo "Auditing standard system directories..."
echo "----------------------------------------------------------------"
printf "%-20s %-25s %-10s\n" "DIRECTORY" "PERMISSIONS (type/owner/group)" "SIZE"
echo "----------------------------------------------------------------"

# --- Loop through each directory in the DIRS array ---
# The for loop iterates over every directory path in the list
for DIR in "${DIRS[@]}"; do

    if [ -d "$DIR" ]; then
        # Directory exists — gather its info

        # ls -ld lists the directory itself (not its contents)
        # awk extracts fields: $1=permissions, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; 2>/dev/null suppresses errors
        # cut -f1 extracts just the size column
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row for this directory
        printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "${SIZE:-N/A}"

    else
        # Directory does not exist on this system
        printf "%-20s %-25s\n" "$DIR" "[does not exist on this system]"
    fi

done

# --- Firefox-specific config directory check ---
# Firefox stores user profiles in ~/.mozilla/firefox
echo ""
echo "================================================================"
echo "Firefox Configuration Directory Audit"
echo "================================================================"

# Common locations for Firefox config/data on Linux
FIREFOX_DIRS=(
    "$HOME/.mozilla/firefox"           # User profile directory (most common)
    "/etc/firefox"                     # System-wide Firefox config (some distros)
    "/usr/lib/firefox"                 # Firefox installation directory
    "/usr/lib64/firefox"               # Firefox on 64-bit RPM systems
    "/usr/share/firefox"               # Shared Firefox resources
)

FOUND=0   # Counter to track if any Firefox directory was found

for FDIR in "${FIREFOX_DIRS[@]}"; do
    if [ -d "$FDIR" ]; then
        # Firefox directory found — show its permissions and size
        FPERMS=$(ls -ld "$FDIR" | awk '{print $1, $3, $4}')
        FSIZE=$(du -sh "$FDIR" 2>/dev/null | cut -f1)
        echo ""
        echo "✔ Found: $FDIR"
        echo "  Permissions : $FPERMS"
        echo "  Size        : ${FSIZE:-N/A}"
        FOUND=$((FOUND + 1))
    fi
done

# If no Firefox directories were found at all
if [ $FOUND -eq 0 ]; then
    echo ""
    echo "✘ No Firefox configuration directories found."
    echo "  Firefox may not be installed, or it hasn't been launched yet."
    echo "  Expected location after first launch: $HOME/.mozilla/firefox"
fi

echo ""
echo "================================================================"
echo "Audit complete."
echo "================================================================"

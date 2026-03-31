#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author : ATHARV U. KONDURKAR | Reg No: 24BSA10210
# Course : Open Source Software | OSS NGMC Capstone Project
# Purpose: Displays a welcome screen with key system information
# =============================================================

# --- Student and software details ---
STUDENT_NAME="ATHARV U. KONDURKAR"
REG_NO="24BSA10210"
SOFTWARE_CHOICE="Firefox"

# --- Gather system information using command substitution $() ---
KERNEL=$(uname -r)                         # Kernel version (e.g. 5.15.0-91-generic)
USER_NAME=$(whoami)                        # Currently logged-in username
HOME_DIR=$HOME                             # Home directory of current user
UPTIME=$(uptime -p)                        # Human-readable uptime (e.g. up 2 hours)
CURRENT_DATE=$(date '+%A, %d %B %Y')      # Formatted date (e.g. Monday, 01 January 2025)
CURRENT_TIME=$(date '+%H:%M:%S')          # Current time in HH:MM:SS format

# --- Get Linux distribution name from /etc/os-release ---
# The file /etc/os-release contains distro metadata
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"   # Fallback if file doesn't exist
fi

# --- Determine the OS license message ---
# Linux (the OS kernel) is licensed under GPL v2
OS_LICENSE="GPL v2 (GNU General Public License, Version 2)"

# --- Display the system identity report ---
echo "================================================================"
echo "        OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT             "
echo "================================================================"
echo " Student  : $STUDENT_NAME"
echo " Reg No   : $REG_NO"
echo " Software : $SOFTWARE_CHOICE (Licensed under Mozilla Public License 2.0)"
echo "----------------------------------------------------------------"
echo " Distribution : $DISTRO"
echo " Kernel       : $KERNEL"
echo " Logged in as : $USER_NAME"
echo " Home Dir     : $HOME_DIR"
echo " Uptime       : $UPTIME"
echo " Date         : $CURRENT_DATE"
echo " Time         : $CURRENT_TIME"
echo "----------------------------------------------------------------"
echo " OS License   : $OS_LICENSE"
echo " Note         : This Linux OS is free software — you are free to"
echo "                run, study, modify, and distribute it."
echo "================================================================"

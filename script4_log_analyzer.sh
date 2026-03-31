#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author : ATHARV U. KONDURKAR | Reg No: 24BSA10210
# Course : Open Source Software | OSS NGMC Capstone Project
# Purpose: Reads a log file line by line, counts occurrences
#          of a keyword (default: "error"), and prints a
#          summary with the last 5 matching lines.
# Usage  : ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# =============================================================

# --- Accept command-line arguments ---
# $1 is the first argument: path to the log file
# $2 is the optional second argument: keyword to search for
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if not provided

# --- Counter variable to track keyword matches ---
COUNT=0

# --- Display header ---
echo "================================================================"
echo "         LOG FILE ANALYZER                                      "
echo "         Student: ATHARV U. KONDURKAR | Reg: 24BSA10210        "
echo "================================================================"

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo ""
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    echo ""
    echo "Tip: Common log files on Linux:"
    echo "  /var/log/syslog       — General system log (Debian/Ubuntu)"
    echo "  /var/log/messages     — General system log (RHEL/Fedora)"
    echo "  /var/log/auth.log     — Authentication events"
    echo "  ~/.mozilla/firefox/*/firefox.log — Firefox logs (if enabled)"
    exit 1
fi

# --- Check if the log file exists and is a regular file ---
if [ ! -f "$LOGFILE" ]; then
    echo ""
    echo "Error: File '$LOGFILE' not found or is not a regular file."
    echo "Please provide a valid path to an existing log file."
    exit 1
fi

# --- Retry logic: check if the file is empty ---
# This simulates a do-while style retry — checks up to 3 times
RETRY=0
MAX_RETRIES=3

while [ ! -s "$LOGFILE" ] && [ $RETRY -lt $MAX_RETRIES ]; do
    RETRY=$((RETRY + 1))
    echo "⚠ Warning: '$LOGFILE' appears to be empty. Retry $RETRY of $MAX_RETRIES..."
    sleep 1   # Wait 1 second before retrying (in real use, file might be writing)
done

# If still empty after retries, inform the user and exit
if [ ! -s "$LOGFILE" ]; then
    echo "✘ File is empty after $MAX_RETRIES retries. Nothing to analyze."
    exit 1
fi

echo ""
echo "Log File : $LOGFILE"
echo "Keyword  : '$KEYWORD' (case-insensitive)"
echo "----------------------------------------------------------------"
echo "Scanning file line by line..."
echo ""

# --- Read the log file line by line using a while-read loop ---
# IFS= prevents stripping of leading/trailing whitespace
# -r prevents backslash interpretation
while IFS= read -r LINE; do

    # if-then: check if the current line contains the keyword
    # grep -iq = case-insensitive (-i) and quiet mode (-q, no output)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter for each matching line
    fi

done < "$LOGFILE"   # Redirect file content as input to the while loop

# --- Print summary ---
echo "----------------------------------------------------------------"
echo "SUMMARY"
echo "----------------------------------------------------------------"
echo "Total lines scanned : $(wc -l < "$LOGFILE")"
echo "Keyword matches     : $COUNT lines contain '$KEYWORD'"
echo ""

# --- Show the last 5 matching lines for context ---
# Uses grep to filter matching lines, tail to get last 5
echo "Last 5 lines containing '$KEYWORD':"
echo "----------------------------------------------------------------"

MATCHES=$(grep -i "$KEYWORD" "$LOGFILE")

if [ -z "$MATCHES" ]; then
    echo "(No matching lines found)"
else
    # pipe grep output into tail to get only the last 5 matches
    echo "$MATCHES" | tail -5
fi

echo ""
echo "================================================================"
echo "Analysis complete."
echo "================================================================"

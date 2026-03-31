#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author : ATHARV U. KONDURKAR | Reg No: 24BSA10210
# Course : Open Source Software | OSS NGMC Capstone Project
# Purpose: Asks the user three interactive questions and
#          generates a personalised open source philosophy
#          statement, saved to a .txt file.
# =============================================================

# --- Alias demonstration (as required by the task) ---
# alias is a shell feature that creates shorthand for commands
# alias today='date +%d-%B-%Y'
# We demonstrate the concept here via a comment, since aliases
# defined inside scripts don't persist beyond the script's shell.

# --- Display welcome banner ---
echo "================================================================"
echo "         OPEN SOURCE MANIFESTO GENERATOR                       "
echo "         Student: ATHARV U. KONDURKAR | Reg: 24BSA10210        "
echo "         Software Audited: Firefox (MPL 2.0)                   "
echo "================================================================"
echo ""
echo "Answer three questions to generate your personal open source"
echo "philosophy manifesto."
echo ""

# --- Collect user input interactively using 'read' ---
# -p flag displays a prompt on the same line as input

read -p "1. Name one open-source tool you use every day: " TOOL
echo ""

read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
echo ""

read -p "3. Name one thing you would build and share freely: " BUILD
echo ""

# --- Validate that the user actually entered something ---
# If any field is empty, use a default placeholder
if [ -z "$TOOL" ]; then
    TOOL="Firefox"
fi
if [ -z "$FREEDOM" ]; then
    FREEDOM="openness"
fi
if [ -z "$BUILD" ]; then
    BUILD="a useful tool for everyone"
fi

# --- Get current date using the date command ---
DATE=$(date '+%d %B %Y')           # e.g. 01 January 2025
TIMESTAMP=$(date '+%Y%m%d_%H%M%S') # e.g. 20250101_143022 (for filename)

# --- Define output file name using string concatenation ---
# whoami returns current username; combined with timestamp for uniqueness
OUTPUT="manifesto_$(whoami)_${TIMESTAMP}.txt"

# --- Compose the manifesto paragraph using string concatenation ---
# Each echo >> appends a new line to the output file
# > creates/overwrites the file; >> appends to it

echo "Writing your manifesto to: $OUTPUT"
echo ""

# Write the manifesto to the file
echo "================================================================" > "$OUTPUT"
echo "        MY OPEN SOURCE MANIFESTO                               " >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"
echo "Author    : ATHARV U. KONDURKAR (24BSA10210)"                   >> "$OUTPUT"
echo "Generated : $DATE"                                               >> "$OUTPUT"
echo "Software  : Firefox — Mozilla Public License 2.0"               >> "$OUTPUT"
echo "----------------------------------------------------------------" >> "$OUTPUT"
echo ""                                                                >> "$OUTPUT"

# The main manifesto paragraph — built from user's answers
echo "I believe in the power of open source." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool that exists not because" >> "$OUTPUT"
echo "a corporation decided to sell it, but because someone chose to" >> "$OUTPUT"
echo "build it in the open and share it with the world." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "To me, freedom means $FREEDOM. In the context of software, that" >> "$OUTPUT"
echo "freedom is not just philosophical — it is practical. It means I" >> "$OUTPUT"
echo "can read the code, understand what it does, trust it, fix it," >> "$OUTPUT"
echo "and pass it on. That is what the open source movement stands for." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Inspired by projects like Firefox, which Mozilla built to keep" >> "$OUTPUT"
echo "the internet open and protect users from corporate monopolies," >> "$OUTPUT"
echo "I commit to giving back. Someday, I will build $BUILD and share" >> "$OUTPUT"
echo "it freely — because the best ideas grow when everyone can see" >> "$OUTPUT"
echo "them, question them, and improve them." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Open source is not just a license. It is a philosophy." >> "$OUTPUT"
echo "It is the belief that knowledge shared is knowledge multiplied." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "----------------------------------------------------------------" >> "$OUTPUT"
echo "\"Given enough eyeballs, all bugs are shallow.\"" >> "$OUTPUT"
echo "                                    — Eric S. Raymond"           >> "$OUTPUT"
echo "================================================================" >> "$OUTPUT"

# --- Confirm the file was saved ---
echo "================================================================"
echo "✔ Manifesto saved successfully to: $OUTPUT"
echo "================================================================"
echo ""

# --- Display the manifesto on screen using cat ---
cat "$OUTPUT"

echo ""
echo "================================================================"
echo "Done. Your manifesto is ready for submission."
echo "================================================================"

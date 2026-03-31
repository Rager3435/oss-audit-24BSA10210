#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author : ATHARV U. KONDURKAR | Reg No: 24BSA10210
# Course : Open Source Software | OSS NGMC Capstone Project
# Purpose: Checks if Firefox (and other FOSS packages) are
#          installed, shows version/license, and prints a
#          philosophy note about each package.
# =============================================================

# --- Define the primary package to inspect ---
PACKAGE="firefox"   # Our chosen open-source software for the audit

# --- Function to detect package manager and check installation ---
# Different Linux distros use different package managers (apt vs rpm)
check_package() {
    local pkg=$1

    if command -v rpm &>/dev/null; then
        # RPM-based systems: Fedora, RHEL, CentOS
        if rpm -q "$pkg" &>/dev/null; then
            echo "✔ '$pkg' is INSTALLED (RPM-based system detected)"
            echo ""
            echo "--- Package Details ---"
            rpm -qi "$pkg" | grep -E 'Version|License|Summary|URL'
            return 0
        else
            echo "✘ '$pkg' is NOT installed on this system."
            return 1
        fi

    elif command -v dpkg &>/dev/null; then
        # DEB-based systems: Ubuntu, Debian, Linux Mint
        if dpkg -l "$pkg" 2>/dev/null | grep -q "^ii"; then
            echo "✔ '$pkg' is INSTALLED (DEB-based system detected)"
            echo ""
            echo "--- Package Details ---"
            dpkg -l "$pkg" | grep "^ii" | awk '{print "Package: "$2"\nVersion: "$3}'
            # Get additional info if apt-cache is available
            if command -v apt-cache &>/dev/null; then
                apt-cache show "$pkg" 2>/dev/null | grep -E 'Version|License|Description' | head -5
            fi
            return 0
        else
            echo "✘ '$pkg' is NOT installed on this system."
            return 1
        fi

    else
        # Neither rpm nor dpkg found — try checking if binary exists in PATH
        echo "⚠ No known package manager found. Checking if '$pkg' binary exists..."
        if command -v "$pkg" &>/dev/null; then
            echo "✔ '$pkg' binary found at: $(command -v $pkg)"
            "$pkg" --version 2>/dev/null | head -1
            return 0
        else
            echo "✘ '$pkg' not found in PATH either."
            return 1
        fi
    fi
}

# --- Run the package check for Firefox ---
echo "================================================================"
echo "         FOSS PACKAGE INSPECTOR                                 "
echo "         Student: ATHARV U. KONDURKAR | Reg: 24BSA10210        "
echo "================================================================"
echo ""
echo "Inspecting package: $PACKAGE"
echo "----------------------------------------------------------------"
check_package "$PACKAGE"

# --- Philosophy note using a case statement ---
# case statement matches the package name and prints a relevant note
echo ""
echo "----------------------------------------------------------------"
echo "Open Source Philosophy Note:"
echo "----------------------------------------------------------------"

case $PACKAGE in
    firefox)
        echo "Firefox (MPL 2.0): Built by Mozilla, a nonprofit dedicated to"
        echo "keeping the internet open and accessible to everyone. Firefox"
        echo "proves that a community-driven browser can compete with"
        echo "billion-dollar corporations — and protect your privacy while doing it."
        ;;
    httpd | apache2)
        echo "Apache (Apache 2.0): The web server that built the open internet."
        echo "In the late 1990s, Apache powered over 50% of all websites,"
        echo "proving that open collaboration could outperform proprietary software."
        ;;
    mysql | mysql-server)
        echo "MySQL (GPL v2 / Commercial): Open source at the heart of millions"
        echo "of apps. Its dual-license model sparked deep debates about whether"
        echo "open source and commercial interests can truly coexist."
        ;;
    vlc | vlc-bin)
        echo "VLC (LGPL/GPL): Born in a French university dorm room, VLC plays"
        echo "anything you throw at it. It embodies the hacker spirit — built"
        echo "to solve a real problem, then shared with the whole world."
        ;;
    git)
        echo "Git (GPL v2): Created by Linus Torvalds in just two weeks after a"
        echo "proprietary version control tool failed him. Now the entire world's"
        echo "software development depends on it — a true open source triumph."
        ;;
    python3 | python)
        echo "Python (PSF License): A language shaped entirely by community."
        echo "Its guiding principle — 'batteries included' — reflects the open"
        echo "source belief that powerful tools should be freely available to all."
        ;;
    *)
        echo "This is an open-source package. Its existence represents the"
        echo "belief that knowledge and tools should be freely shared, so that"
        echo "anyone — anywhere — can learn, build, and contribute."
        ;;
esac

echo ""
echo "================================================================"

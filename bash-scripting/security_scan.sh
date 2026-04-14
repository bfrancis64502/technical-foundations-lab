#!/bin/bash
# Smart Security Scan - Auto-detects network range

echo "--- [1] Detecting Local Network Range ---"
# This line finds your active IP range (e.g., 192.168.1.0/24) automatically
NETWORK=$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -n 1)

if [ -z "$NETWORK" ]; then
    echo "❌ Error: Could not detect an active network connection."
    exit 1
else
    echo "✅ Network detected: $NETWORK"
fi

echo -e "\n--- [2] Searching for Active Devices on $NETWORK ---"
# Uses the detected range to find live hosts
nmap -sn "$NETWORK" | grep "Nmap scan report"

echo -e "\n--- [3] Checking for Open Ports on this Pi (Localhost) ---"
nmap -F localhost

echo -e "\n--- [4] Active Listening Services ---"
# Shows what's currently open to the network
ss -tln

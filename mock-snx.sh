#!/bin/bash
# This script only mocks the output of snx without the fingerprint.
# It can be used to replace the spawn snx cmd inside the connect_snx.exp.
# Replace it so it looks like this:
# spawn ./mock-snx.sh -s $::env(SNX_SERVER) -u $::env(SNX_USER)

# Simulate SNX banner
echo "Check Point's Linux SNX"
echo "build 800010003"
echo "Please enter your password:"

# Read password (simulate SNX password prompt)
read -s password
sleep 1
# Simulate successful login
echo "SNX - connected."
echo ""
echo "Session parameters:"
echo "==================="
echo "Office Mode IP      : 192.168.0.164"
echo "DNS Server          : 192.168.0.100"
echo "DNS Suffix          : domain.internal;domain.com;something.domain.com"
echo "Timeout             : 3 hours"
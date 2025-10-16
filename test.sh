#!/bin/bash
# IMPORTANT!
# When using this test script to test snx without using the actual snx
# we need to first replace the snx process in the spawn command inside the connnect_snx.exp script
# to the mock-snx.sh
# The mock-snx.sh only tests without the fingerprint
set -e
set -a
source .env
set +a

truncate -s 0 /tmp/snx_output.log
expect ./connect_snx.exp

OFFICE_IP=$(grep "Office Mode IP" /tmp/snx_output.log | awk -F': ' '{print $2}')
DNS_SERVER=$(grep "DNS Server" /tmp/snx_output.log | awk -F': ' '{print $2}')
DNS_SUFFIX=$(grep "DNS Suffix" /tmp/snx_output.log | awk -F': ' '{print $2}')
TIMEOUT=$(grep "Timeout" /tmp/snx_output.log | awk -F': ' '{print $2}')


echo "Office IP: $OFFICE_IP"
echo "DNS Server: $DNS_SERVER"
echo "DNS Suffix: $DNS_SUFFIX"
echo "Timeout: $TIMEOUT"
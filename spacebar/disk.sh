#!/bin/bash

DISK_SIZE_TOTAL=$(df -kh . | tail -n1 | awk '{print $2}')
DISK_SIZE_FREE=$(df -kh . | tail -n1 | awk '{print $4}')
DISK_PERCENT_USED=$(df -kh . | tail -n1 | awk '{print $5}')

# Convert GiB to GB and round down to nearest whole number
DISK_SIZE_TOTAL_GB=$(printf "%.0f" $(echo "$DISK_SIZE_TOTAL" | awk '{$1=$1/1.07374; print $1}'))
DISK_SIZE_FREE_GB=$(printf "%.0f" $(echo "$DISK_SIZE_FREE" | awk '{$1=$1/1.07374; print $1}'))

echo "${DISK_SIZE_FREE_GB}" GB of "${DISK_SIZE_TOTAL_GB}" GB total "(""${DISK_PERCENT_USED}"" used)|"



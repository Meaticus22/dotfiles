#!/bin/bash

# Execute both scripts and combine their outputs
output="$(sh $HOME/.config/spacebar/network_speed.sh)"
output="$output | $(sh $HOME/.config/spacebar/cpu.sh)"
output="$output | $(sh $HOME/.config/spacebar/disk.sh)"
echo $output


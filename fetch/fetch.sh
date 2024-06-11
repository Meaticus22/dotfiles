#!/bin/bash

# Custom Fetch: thanks to indyjoenz for the idea

# Display the ANSI art
clear
cat << EOF
    ______________________________________________________________________________
    │                                                                             │
    │              _____________                                                  │
    │             ▕╲            ╲                                                 │
    │             ▕ █████████████               ::                                │
    │             ▕ ██ #_      ██             :::::                               │
    │             ▕ ██         ██             ::  :               ::              │
    │       ______▕ ██         ██______       :   :                               │
    │      ▕╲      ╲█████████████      ╲      :  ::               ::    : :::     │
    │      ▕ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       ::: :::: :::::    :::   ::::::     │
    │      ▕ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓     ::::  : :::::  ::  :: :: :::  ::     │
    │       ╲▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ::  ::::::: :::::: ::  ::::     ::::: │
    │                                                        ::                   │
    │    AT&T UNIX System III                              :::                    │
    │    Login: _                                         ::::                    │
    │                                                    :::                      │
    │_____________________________________________________________________________│

EOF

# Wait for the user to enter a username
read -p "Enter your username: " username

# Echo the entered username back to the user
echo "Hello, $username!"

# Set TERM_PROGRAM to Kitty
export TERM_PROGRAM="Kitty"

# read system info
host=$(hostname)

# get OS name and version
os_name=$(sw_vers | awk 'NR==1{print $2 " " $3 " " $4}')
os_ver=$(sw_vers | awk 'NR==2{print $2 " " $3 " " $4}')

# get kernel name and version
kernel=$(uname -rs)

# Get terminal
term_full="$TERM ${TERM_PROGRAM//_/ }"
terminal=$(echo $term_full | awk '{print $2 " " $3 " " $4}')

# Check if the terminal is Kitty
if [ "$TERM_PROGRAM" = "Kitty" ]; then
    terminal="Kitty"
fi



# Output with custom ASCII art and system information
cat << EOF
    ${c5}     ${c6}os${c0}        ${os_name}${os_ver}
    ${c5}     ${ARTR3}${c6}kernel ${c0}   ${kernel}
    ${c5}     ${c6}shell${c0}     ${SHELL##*/}
    ${c5}     ${c6}trm${c0}       ${terminal}
EOF

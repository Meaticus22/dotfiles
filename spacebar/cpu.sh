#! /usr/bin/env bash

ps -axro pcpu | awk '{sum+=$1} END {print "%"sum}'

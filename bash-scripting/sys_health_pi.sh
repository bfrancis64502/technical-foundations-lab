#!/bin/bash
echo "--- SYSTEM HEALTH CHECK ---"
date
echo "--- CPU TEMP ---"
vcgencmd measure_temp
echo "--- MEMORY USAGE ---"
free -h
echo "--- DISK SPACE ---"
df -h | grep '^/dev/'

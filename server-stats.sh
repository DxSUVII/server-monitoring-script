#!/bin/bash
echo "===== Server Performance Stats ====="

# CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'

# Memory usage
echo "Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB (%.2f%%) | Free: %sMB (%.2f%%)\n", $3, $3*100/$2, $4, $4*100/$2 }'

# Disk usage
echo "Disk Usage:"
df -h --total | grep 'total' | awk '{print "Used: " $3 " | Free: " $4 " | Usage: " $5}'

# Top 5 processes by CPU
echo "Top 5 Processes by CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory
echo "Top 5 Processes by Memory:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
# Uptime
echo "Uptime:"
uptime -p

# OS Version
echo "OS Version:"
lsb_release -d

# Load Average
echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'


# Logged-in Users
echo "Logged in Users:"
who



# Failed Login Attempts
echo "Failed Login Attempts:"
grep "Failed password" /var/log/auth.log | wc -l


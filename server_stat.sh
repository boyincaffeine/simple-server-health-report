#!/bin/bash

# Fancy-Looking Server Health Report (Text-Only)

cpu_usage() {
    top -bn1 | grep "%Cpu(s)" | awk '{printf "│ CPU Usage        │ %.2f%% used\n", 100 - $8}'
}

memory_usage() {
    free -m | awk 'NR==2{printf "│ Memory Usage     │ %dMB / %dMB (%.2f%% used)\n", $3, $2, $3/$2*100}'
}

disk_usage() {
    df -h / | awk 'NR==2{printf "│ Disk Usage       │ %s / %s (%s used)\n", $3, $2, $5}'
}

top5_cpu() {
    echo "├───────────────────────────────────────────────"
    echo "│ Top 5 CPU-consuming Processes:"
    echo "│ PID    COMMAND              %CPU"
    ps -eo pid,comm,%cpu --sort=-%cpu --no-headers | head -n 5 | awk '{printf "│ %-6s %-20s %s\n", $1, $2, $3}'
}

top5_mem() {
    echo "├───────────────────────────────────────────────"
    echo "│ Top 5 Memory-consuming Processes:"
    echo "│ PID    COMMAND              %MEM"
    ps -eo pid,comm,%mem --sort=-%mem --no-headers | head -n 5 | awk '{printf "│ %-6s %-20s %s\n", $1, $2, $3}'
}

os_version() {
    grep -w PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'
}

uptime_info() {
    uptime -p
}

load_average() {
    uptime | awk -F'load average:' '{print $2}' | xargs | awk '{printf "│ Load Average     │ %s\n", $0}'
}

logged_in_users() {
    echo "│ Logged-in Users  │ $(who | wc -l)"
}

# Print the report
echo "┌───────────────────────────────────────────────┐"
echo "│           SERVER HEALTH REPORT                │"
echo "├───────────────────────────────────────────────"
echo "│ Generated On      │ $(date)"
echo "│ OS Version        │ $(os_version)"
echo "│ Uptime            │ $(uptime_info)"
cpu_usage
memory_usage
disk_usage
load_average
logged_in_users
top5_cpu
top5_mem
echo "└───────────────────────────────────────────────┘"



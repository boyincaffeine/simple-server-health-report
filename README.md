# Simple Server Health Report

A simple Bash script to check essential Linux server health stats at a glance. It shows CPU, memory, disk usage, uptime, load average, logged-in users, and top resource-hungry processes — all formatted cleanly for easy reading in the terminal.

---

## What it Does

- Shows current CPU usage (%)
- Shows memory usage (MB and %)
- Shows disk usage of root partition `/`
- Displays system uptime (human-readable)
- Displays load average (1, 5, 15 min)
- Shows number of users currently logged in
- Lists top 5 processes by CPU usage
- Lists top 5 processes by memory usage

---

## Requirements

- Linux OS with Bash shell
- Common Linux tools: `top`, `free`, `df`, `ps`, `uptime`, `who`, `grep`, `awk`

---

## How to Use

1. Clone or download the script:
    ```bash
    git clone https://github.com/yourusername/simple-server-health-report.git
    cd simple-server-health-report
    ```

2. Make the script executable:
    ```bash
    chmod +x server_health_report.sh
    ```

3. Run the script:
    ```bash
    ./server_health_report.sh
    ```

---

## Sample Output


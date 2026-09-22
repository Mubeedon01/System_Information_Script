#!/bin/bash
# Based on: "System Information Scripts" by Yusuf Shehu

# ==========================================================
#  SYSTEM INFORMATION SCRIPT
#  Author: Mubeedon
#  Purpose: To understand system architecture & current process status
# ==========================================================
# Set the log file path inside your project's logs directory
LOG_FILE="logs/sys_report_$(date +'%Y-%m-%d_%H-%M-%S').log"

# Save all output to the log file AND display live on screen
exec > >(tee -a "$LOG_FILE") 2>&1

echo "=========================================="
echo "🟢 SYSTEM INFORMATION REPORT"
echo "Generated on: $(date)"
echo "Saving report to: $LOG_FILE"
echo "=========================================="

# -------------------------
# 1-OS Information
# -------------------------
echo "🟢 OS INFORMATION:"
if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a
else
    cat /etc/os-release
fi
echo
# -------------------------
# 2-Kernel Version
# -------------------------
echo "🟢 KERNEL VERSION:"
uname -r
echo
# -------------------------
# 3-CPU Information
# -------------------------
echo "🟢 CPU INFORMATION:"
lscpu | grep -E 'Model name|CPU\(s\)|Thread|Core|MHz'
echo
# -------------------------
# 4-Memory Usage
# -------------------------
echo "🟢 MEMORY (RAM) USAGE:"
free -h
echo
# -------------------------
# 5-Disk Usage
# -------------------------
echo "🟢 DISK USAGE:"
df -h --total | grep -E "Filesystem|total"
echo
# -------------------------
# 5-Top Running Processes
# -------------------------
echo "🟢 TOP 10 RUNNING PROCESSES (by CPU usage):"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head
echo
# -------------------------
# 6-Logged-in Users
# -------------------------
echo "🟢 LOGGED-IN USERS:"
who
# -------------------------
echo
# 7-Networkings
# -------------------------
echo "🟢 LISTENING PORTS"
sudo ss -tulnp
echo
echo "===================================================="
echo "            END OF SYSTEM INFORMATION REPORT         "
echo "===================================================="


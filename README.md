````markdown
# Title: sytem information scripts

## description

this projects provides key system information about a server/system which helps to understand the architecture, system design and the amount of workload the system can bear with one click.

## Features:

1. **OS Information**

   Shows the Linux distribution and version.

   Helpful when determining:

   •	Package manager  
   •	Kernel compatibility  
   •	Installation methods

2. **Kernel Version**

   The kernel controls memory, networking, drivers, and process scheduling.

   Knowing the kernel helps diagnose:

   •	software compatibility and nodes failures  
   •	Network driver bugs  
   •	System crashes

3. **CPU Information**

   Displays:

   •	Total cores  
   •	Threads  
   •	Clock speed  
   •	CPU model

   Used for:

   •	Performance analysis  
   •	Capacity planning

4. **RAM Usage**

   If a server is swapping or memory is full, everything slows down.

   This helps identify:

   •	Memory leaks  
   •	Heavy applications  
   •	Under-provisioned servers

5. **Disk Usage**

   Running out of disk is one of the most common production issues.

   This helps you catch:

   •	Full Docker volumes  
   •	Logs consuming space  
   •	Application uploads filling storage

6. **Running Processes**

   Shows the top processes using the most CPU.

   Critical for troubleshooting:

   •	Rogue processes  
   •	High CPU usage

7. **Logged-In Users**

   You can see:

   •	Who is connected  
   •	Whether someone is troubleshooting  
   •	Unauthorized access

## How to use the scripts

1-	Create the script file  “nano sys_report.sh”

2-	Paste the script below, save and exit 

```bash
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
````

3-	Make the file executable “chmod +x sys_report.sh”

4-	Run it by “./sys_report.sh”

That will generate the system report for evaluation.

<img width="596" height="670" alt="sys_report" src="https://github.com/user-attachments/assets/302451ca-a84b-443c-b6cb-f3eb5099ff94" />


## Project structure

<img width="449" height="146" alt="project structure" src="https://github.com/user-attachments/assets/c6a90b4f-344e-4ad6-8ddf-ad6eba32666d" />


![]()

<br><br><br><br>

## Credits

This project is based on " System Information Script (Linux + Shell Scripting for DevOps)
" by [Yusuf Shehu](https://medium.com/@shehuyusuf/system-information-script-linux-shell-scripting-for-devops-1e502ca014ef).

Modified by [Mubarak Abubakar] in sept, 2026. Changes: added networking details and modidfied structure.

```
```

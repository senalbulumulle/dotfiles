#!/usr/bin/env bash
#
# 03-find-processes-that-make-mac-slow-because-of-memory-leaks.sh
#
# Find processes using excessive memory that might be causing your Mac to slow down.
# Helps identify potential memory leaks and resource hogs.
#
# Usage:
#   ./03-find-processes-that-make-mac-slow-because-of-memory-leaks.sh
#
# Notes:
# - This script NEVER terminates any processes. It only shows information.
# - High memory usage doesn't always mean a leak, but it can indicate problems.
# - System processes (kernel_task, etc.) are normal and should not be terminated.

set -euo pipefail

TOP_N="${TOP_N:-15}"   # Number of top processes to show
MIN_MEMORY_MB="${MIN_MEMORY_MB:-500}"  # Only show processes using more than this (in MB)

echo "🔍 Analyzing processes for memory issues..."
echo "   Showing top $TOP_N processes by memory usage."
echo

###############################################################################
# System Memory Overview
###############################################################################

echo "=== System Memory Overview ==="
echo

# Get memory stats (works on macOS)
if command -v vm_stat >/dev/null 2>&1; then
  # Calculate total and free memory
  TOTAL_MEM=$(sysctl -n hw.memsize)
  TOTAL_MEM_GB=$((TOTAL_MEM / 1024 / 1024 / 1024))
  
  # Get memory pressure info (macOS 10.9+)
  if command -v memory_pressure >/dev/null 2>&1; then
    echo "Memory Pressure Status:"
    memory_pressure 2>/dev/null | head -n 5 || echo "  (Unable to get memory pressure info)"
    echo
  fi
  
  echo "Total Physical Memory: ${TOTAL_MEM_GB} GB"
  echo
fi

###############################################################################
# Top Memory-Consuming Processes
###############################################################################

echo "=== Top $TOP_N Processes by Memory Usage ==="
echo "(RSS = Resident Set Size, the actual physical memory used)"
echo

# Use ps to get memory info, sorted by RSS
# Format: PID, %CPU, %MEM, RSS (in KB), TIME, COMMAND
ps aux | awk -v min_mb="$MIN_MEMORY_MB" '
  NR == 1 {
    # Print header
    printf "%-8s %6s %6s %10s %12s %s\n", "PID", "%CPU", "%MEM", "RSS (MB)", "TIME", "COMMAND"
    next
  }
  {
    rss_mb = $6 / 1024  # Convert KB to MB
    if (rss_mb >= min_mb) {
      printf "%-8s %6.1f %6.1f %10.1f %12s %s\n", $2, $3, $4, rss_mb, $10, $11
      for (i = 12; i <= NF; i++) {
        printf " %s", $i
      }
      printf "\n"
    }
  }
' | sort -k4 -rn | head -n "$((TOP_N + 1))"

echo

###############################################################################
# Processes with High CPU Usage (can also slow things down)
###############################################################################

echo "=== Top $TOP_N Processes by CPU Usage ==="
echo "(High CPU usage can also cause slowdowns)"
echo

ps aux | awk '
  NR == 1 {
    printf "%-8s %6s %6s %10s %12s %s\n", "PID", "%CPU", "%MEM", "RSS (MB)", "TIME", "COMMAND"
    next
  }
  {
    rss_mb = $6 / 1024
    printf "%-8s %6.1f %6.1f %10.1f %12s %s\n", $2, $3, $4, rss_mb, $10, $11
    for (i = 12; i <= NF; i++) {
      printf " %s", $i
    }
    printf "\n"
  }
' | sort -k2 -rn | head -n "$((TOP_N + 1))"

echo

###############################################################################
# Long-Running Processes with High Memory (Potential Leaks)
###############################################################################

echo "=== Long-Running Processes with High Memory Usage ==="
echo "(Processes running > 1 hour with > ${MIN_MEMORY_MB}MB - potential memory leaks)"
echo

# Get processes with high memory that have been running for a while
ps -eo pid,etime,rss,comm,args | awk -v min_mb="$MIN_MEMORY_MB" '
  NR == 1 {
    printf "%-8s %12s %10s %-20s %s\n", "PID", "ELAPSED", "RSS (MB)", "COMMAND", "ARGS"
    next
  }
  {
    rss_mb = $3 / 1024
    if (rss_mb >= min_mb) {
      # Check if elapsed time contains hours or days
      if ($2 ~ /-/ || $2 ~ /:/) {
        # Parse time: format is [[DD-]HH:]MM:SS or HH:MM:SS
        split($2, time_parts, /[-:]/)
        has_days = ($2 ~ /-/)
        has_hours = (length(time_parts) >= 3)
        
        if (has_days || (has_hours && length(time_parts) >= 3)) {
          printf "%-8s %12s %10.1f %-20s", $1, $2, rss_mb, $4
          for (i = 5; i <= NF; i++) {
            printf " %s", $i
          }
          printf "\n"
        }
      }
    }
  }
' | head -n "$TOP_N"

echo

###############################################################################
# Recommendations
###############################################################################

echo "=== Recommendations ==="
echo
echo "If you see processes using excessive memory:"
echo "  1. Try quitting the application normally first"
echo "  2. If that doesn't work, you can force quit:"
echo "     kill <PID>              # Graceful termination"
echo "     kill -9 <PID>           # Force quit (use as last resort)"
echo "  3. Or use Activity Monitor (GUI):"
echo "     open -a 'Activity Monitor'"
echo
echo "⚠️  WARNING:"
echo "  - Do NOT terminate system processes (kernel_task, WindowServer, etc.)"
echo "  - Do NOT terminate processes you don't recognize without researching them"
echo "  - Some processes may restart automatically if terminated"
echo
echo "Common culprits for memory leaks:"
echo "  - Web browsers (Chrome, Safari, Firefox) with many tabs"
echo "  - Development tools (Xcode, VS Code, Docker)"
echo "  - Electron apps (Slack, Discord, etc.)"
echo "  - Background services that haven't been restarted in a while"
echo


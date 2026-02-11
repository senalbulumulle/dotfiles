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

# Table: collect data, sort by RSS, then print with box-drawing
ps aux | awk -v min_mb="$MIN_MEMORY_MB" -v top_n="$TOP_N" '
BEGIN {
  DELIM = "\034"
  w_pid=8; w_cpu=7; w_mem=7; w_rss=10; w_time=12; w_cmd=44
  b="│"; tl="┌"; tr="┐"; ml="├"; mr="┤"; bl="└"; br="┘"; h="─"
}
NR == 1 { next }
{
  rss_mb = $6 / 1024
  if (rss_mb >= min_mb) {
    cmd = $11
    for (i = 12; i <= NF; i++) { cmd = cmd " " $i }
    if (length(cmd) > w_cmd) cmd = substr(cmd, 1, w_cmd-3) "..."
    key = sprintf("%012.1f", 10000 - rss_mb)
    idx = key SUBSEP NR
    row[idx] = $2 DELIM $3 DELIM $4 DELIM rss_mb DELIM $10 DELIM cmd
    keys[++n] = idx
  }
}
END {
  if (n == 0) { print "No processes above " min_mb " MB."; exit }
  for (i = 1; i < n; i++)
    for (j = i + 1; j <= n; j++)
      if (keys[i] > keys[j]) { t = keys[i]; keys[i] = keys[j]; keys[j] = t }
  len = w_pid+w_cpu+w_mem+w_rss+w_time+w_cmd+14
  printf "%s%-*s%-*s%-*s%-*s%-*s%-*s%s\n", tl, w_pid+2, " PID " b, w_cpu+2, " %CPU " b, w_mem+2, " %MEM " b, w_rss+2, " RSS(MB) " b, w_time+2, " TIME " b, w_cmd+2, " COMMAND " b, tr
  printf "%s", ml; for (i = 0; i < len; i++) printf "%s", h; printf "%s\n", mr
  for (i = 1; i <= n && i <= top_n; i++) {
    split(row[keys[i]], a, DELIM)
    printf "%s %-*s %s %*.1f %s %*.1f %s %*.1f %s %*s %s %-*s %s\n", b, w_pid, a[1], b, w_cpu, a[2]+0, b, w_mem, a[3]+0, b, w_rss, a[4]+0, b, w_time, a[5], b, w_cmd, a[6], b
  }
  printf "%s", bl; for (i = 0; i < len; i++) printf "%s", h; printf "%s\n", br
}
'

echo

###############################################################################
# Processes with High CPU Usage (can also slow things down)
###############################################################################

echo "=== Top $TOP_N Processes by CPU Usage ==="
echo "(High CPU usage can also cause slowdowns)"
echo

ps aux | awk -v top_n="$TOP_N" '
BEGIN {
  DELIM = "\034"
  w_pid=8; w_cpu=7; w_mem=7; w_rss=10; w_time=12; w_cmd=44
  b="│"; tl="┌"; tr="┐"; ml="├"; mr="┤"; bl="└"; br="┘"; h="─"
}
NR == 1 { next }
{
  rss_mb = $6 / 1024
  cmd = $11
  for (i = 12; i <= NF; i++) { cmd = cmd " " $i }
  if (length(cmd) > w_cmd) cmd = substr(cmd, 1, w_cmd-3) "..."
  cpu = $3 + 0
  key = sprintf("%08.2f", 1000 - cpu)
  idx = key SUBSEP NR
  row[idx] = $2 DELIM $3 DELIM $4 DELIM rss_mb DELIM $10 DELIM cmd
  keys[++n] = idx
}
END {
  for (i = 1; i < n; i++)
    for (j = i + 1; j <= n; j++)
      if (keys[i] > keys[j]) { t = keys[i]; keys[i] = keys[j]; keys[j] = t }
  len = w_pid+w_cpu+w_mem+w_rss+w_time+w_cmd+14
  printf "%s%-*s%-*s%-*s%-*s%-*s%-*s%s\n", tl, w_pid+2, " PID " b, w_cpu+2, " %CPU " b, w_mem+2, " %MEM " b, w_rss+2, " RSS(MB) " b, w_time+2, " TIME " b, w_cmd+2, " COMMAND " b, tr
  printf "%s", ml; for (i = 0; i < len; i++) printf "%s", h; printf "%s\n", mr
  for (i = 1; i <= n && i <= top_n; i++) {
    split(row[keys[i]], a, DELIM)
    printf "%s %-*s %s %*.1f %s %*.1f %s %*.1f %s %*s %s %-*s %s\n", b, w_pid, a[1], b, w_cpu, a[2]+0, b, w_mem, a[3]+0, b, w_rss, a[4]+0, b, w_time, a[5], b, w_cmd, a[6], b
  }
  printf "%s", bl; for (i = 0; i < len; i++) printf "%s", h; printf "%s\n", br
}
'

echo

###############################################################################
# Long-Running Processes with High Memory (Potential Leaks)
###############################################################################

echo "=== Long-Running Processes with High Memory Usage ==="
echo "(Processes running > 1 hour with > ${MIN_MEMORY_MB}MB - potential memory leaks)"
echo

# Long-running processes table
ps -eo pid,etime,rss,comm,args | awk -v min_mb="$MIN_MEMORY_MB" -v top_n="$TOP_N" '
BEGIN {
  DELIM = "\034"
  w_pid=8; w_elapsed=12; w_rss=10; w_cmd=50
  b="│"; tl="┌"; tr="┐"; ml="├"; mr="┤"; bl="└"; br="┘"; h="─"
}
NR == 1 { next }
{
  rss_mb = $3 / 1024
  if (rss_mb >= min_mb && ($2 ~ /-/ || $2 ~ /:/)) {
    split($2, time_parts, /[-:]/)
    has_days = ($2 ~ /-/)
    has_hours = (length(time_parts) >= 3)
    if (has_days || (has_hours && length(time_parts) >= 3)) {
      cmd = $4
      for (i = 5; i <= NF; i++) { cmd = cmd " " $i }
      if (length(cmd) > w_cmd) cmd = substr(cmd, 1, w_cmd-3) "..."
      row[++n] = $1 DELIM $2 DELIM rss_mb DELIM cmd
    }
  }
}
END {
  if (n == 0) { print "No long-running processes above " min_mb " MB."; exit }
  len = w_pid+w_elapsed+w_rss+w_cmd+10
  printf "%s%-*s%-*s%-*s%-*s%s\n", tl, w_pid+2, " PID " b, w_elapsed+2, " ELAPSED " b, w_rss+2, " RSS(MB) " b, w_cmd+2, " COMMAND " b, tr
  printf "%s", ml; for (i = 0; i < len; i++) printf "%s", h; printf "%s\n", mr
  for (i = 1; i <= n && i <= top_n; i++) {
    split(row[i], a, DELIM)
    printf "%s %-*s %s %-*s %s %*.1f %s %-*s %s\n", b, w_pid, a[1], b, w_elapsed, a[2], b, w_rss, a[3]+0, b, w_cmd, a[4], b
  }
  printf "%s", bl; for (i = 0; i < len; i++) printf "%s", h; printf "%s\n", br
}
'

echo

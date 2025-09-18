# Server Performance Monitoring System

## Overview

This project provides a comprehensive server performance monitoring solution that collects and displays real-time system statistics. The system is designed to help system administrators and DevOps engineers monitor server health, resource utilization, and identify potential performance bottlenecks.

## Features

- **Real-time CPU Usage Monitoring** - Tracks current CPU utilization percentage
- **Memory Usage Analysis** - Shows used and free memory with percentage breakdown
- **Disk Space Monitoring** - Displays total disk usage across all mounted filesystems
- **Process Analysis** - Lists top 5 processes by CPU and memory consumption
- **System Uptime Tracking** - Shows how long the server has been running
- **Load Average Monitoring** - Displays system load metrics
- **User Session Tracking** - Lists currently logged-in users
- **Security Monitoring** - Counts failed login attempts for security analysis
- **OS Information** - Displays current operating system version

## Files Structure

```
server-performance-monitoring/
├── server-stats.sh          # Main monitoring script
├── server perfomance set report.pdf  # Performance analysis report
└── README.md               # Project documentation
```

## Prerequisites

- Linux-based operating system (Ubuntu, CentOS, RHEL, etc.)
- Bash shell environment
- Standard Linux utilities: `top`, `free`, `df`, `ps`, `uptime`, `who`, `grep`
- Read access to `/var/log/auth.log` for security monitoring

## Installation & Setup

1. **Clone or download the project files**
   ```bash
   git clone <repository-url>
   cd server-performance-monitoring
   ```

2. **Make the script executable**
   ```bash
   chmod +x server-stats.sh
   ```

3. **Verify prerequisites**
   ```bash
   which top free df ps uptime who grep
   ```

## Usage

### Basic Execution
```bash
./server-stats.sh
```

### Sample Output
```
===== Server Performance Stats =====
CPU Usage:
15.2%

Memory Usage:
Used: 2048MB (25.60%) | Free: 5952MB (74.40%)

Disk Usage:
Used: 45G | Free: 210G | Usage: 18%

Top 5 Processes by CPU:
  PID COMMAND         %CPU
 1234 firefox         12.5
 5678 chrome          8.3
 9012 node            3.2

Top 5 Processes by Memory:
  PID COMMAND         %MEM
 1234 firefox         15.2
 5678 mysql           12.8
 9012 apache2         8.5

Uptime:
up 2 days, 14 hours, 23 minutes

OS Version:
Description: Ubuntu 20.04.3 LTS

Load Average:
 0.85, 1.02, 0.95

Logged in Users:
user1    pts/0    2023-10-15 09:30
admin    pts/1    2023-10-15 10:15

Failed Login Attempts:
23
```

## Monitoring Metrics Explained

### CPU Usage
- Shows percentage of CPU currently being utilized
- Combines user and system CPU time

### Memory Usage
- **Used**: Currently allocated memory
- **Free**: Available memory for new processes
- Percentages help identify memory pressure

### Disk Usage
- Shows total disk space utilization across all filesystems
- Helps prevent disk space exhaustion

### Process Information
- **CPU Top 5**: Processes consuming most CPU resources
- **Memory Top 5**: Processes using most RAM
- Useful for identifying resource-intensive applications

### System Metrics
- **Uptime**: Server stability indicator
- **Load Average**: System load over 1, 5, and 15-minute intervals
- **OS Version**: System identification

### Security Monitoring
- **Logged Users**: Current active sessions
- **Failed Logins**: Security breach attempts indicator

## Automation Options

### Cron Job Setup
Run monitoring every 5 minutes:
```bash
# Add to crontab
*/5 * * * * /path/to/server-stats.sh >> /var/log/server-performance.log 2>&1
```

### Continuous Monitoring
```bash
# Run every 30 seconds
watch -n 30 ./server-stats.sh
```

## Customization

### Adding New Metrics
You can extend the script by adding:
- Network statistics (`netstat`, `ss`)
- Service status checks (`systemctl status`)
- Temperature monitoring (`sensors`)
- Custom application metrics

### Output Formatting
- Modify output format for integration with monitoring tools
- Add JSON output option for API consumption
- Include timestamps for log analysis

## Use Cases

- **System Administration**: Regular server health checks
- **DevOps Monitoring**: Automated performance tracking
- **Troubleshooting**: Quick system overview during issues
- **Capacity Planning**: Historical resource usage analysis
- **Security Auditing**: Failed login attempt monitoring

## Technical Skills Demonstrated

- **Bash Scripting**: Advanced shell scripting techniques
- **Linux System Administration**: Deep understanding of system utilities
- **Performance Monitoring**: Knowledge of key system metrics
- **Security Awareness**: Implementation of security monitoring
- **Documentation**: Professional project documentation
- **Automation**: Script designed for automated execution

## Future Enhancements

- [ ] Add historical data storage (database integration)
- [ ] Create web dashboard for visualization
- [ ] Implement alerting system for threshold breaches
- [ ] Add remote monitoring capabilities
- [ ] Include network performance metrics
- [ ] Docker containerization support

## Troubleshooting

### Common Issues

**Permission Denied on /var/log/auth.log**
```bash
# Run with appropriate privileges or modify the path
sudo ./server-stats.sh
```

**Command Not Found Errors**
```bash
# Install missing utilities (Ubuntu/Debian)
sudo apt-get update
sudo apt-get install procps util-linux coreutils
```

**Script Not Executable**
```bash
chmod +x server-stats.sh
```

## Performance Impact

This monitoring script is designed to be lightweight:
- Minimal CPU overhead (< 1% during execution)
- No persistent background processes
- Quick execution time (typically < 2 seconds)
- Safe for production environments



---

**Note**: This monitoring solution demonstrates practical Linux administration skills, bash scripting proficiency, and understanding of system performance metrics essential for DevOps and system administration roles.

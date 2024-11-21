







































cd /var/log
tail -50 boot.log
grep "OK" /var/log/boot.log
LogParser "SELECT TimeGenerated,EventID,Message FROM Security WHERE EventID=4624" -i:EVT
-o:CSV > log_report.csv

logwatch --detail High --range today
journalctl --list-boots
journalctl -b
journalctl | grep -i reboot






#!/bin/bash

if [ "$1" == "-help" ]; then
    echo "Usage: dig_custom <option> <domain>"
    echo
    echo "Options:"
    echo "  query <domain>        - Perform a DNS query for the given domain"
    echo "  reverse <IP address>  - Perform a reverse DNS lookup on the given IP"
    echo "  mx <domain>           - Query for MX records of the given domain"
    echo "  ns <domain>           - Query for NS records of the given domain"
    echo "  -help                 - Get help with usage information"
    exit 0
fi

if [ $# -lt 2 ]; then
    echo "Invalid arguments. Use 'dig_custom -help' for usage information."
    exit 1
fi

case "$1" in
    query)
        echo "Querying DNS records for domain: $2"
        dig $2
        ;;
    reverse)
        echo "Performing reverse DNS lookup for IP: $2"
        dig -x $2
        ;;
    mx)
        echo "Querying MX records for domain: $2"
        dig $2 MX
        ;;
    ns)
        echo "Querying NS records for domain: $2"
        dig $2 NS
        ;;
    *)
        echo "Invalid command. Use 'dig_custom -help' for usage information."
        ;;
esac



















#!/bin/bash
if [ "$1" == "-help" ]; then
    echo "Usage: ip_custom <option> [interface]"
    echo
    echo "Options:"
    echo "  addr show [interface] - Show IP addresses for the specified interface"
    echo "  link show [interface] - Show link status for the specified interface"
    echo "  route show            - Show the current routing table"
    echo "  -help                 - Get help with usage information"
    exit 0
fi

case "$1" in
    addr)
        if [ "$2" == "show" ]; then
            if [ -z "$3" ]; then
                echo "Showing IP addresses for all interfaces..."
                ip addr show
            else
                echo "Showing IP addresses for interface: $3"
                ip addr show $3
            fi
        else
            echo "Invalid command. Use 'ip_custom -help' for usage information."
        fi
        ;;
    link)
        if [ "$2" == "show" ]; then
            if [ -z "$3" ]; then
                echo "Showing link status for all interfaces..."
                ip link show
            else
                echo "Showing link status for interface: $3"
                ip link show $3
            fi
        else
            echo "Invalid command. Use 'ip_custom -help' for usage information."
        fi
        ;;
    route)
        if [ "$2" == "show" ]; then
            echo "Showing the current routing table..."
            ip route show
        else
            echo "Invalid command. Use 'ip_custom -help' for usage information."
        fi
        ;;
    *)
        echo "Invalid command. Use 'ip_custom -help' for usage information."
        ;;
esac



















#!/bin/bash

if [ "$1" == "-help" ]; then
    echo "Usage: kill_custom <option> <pid>"
    echo
    echo "Options:"
    echo "  list         - List all running processes"
    echo "  kill <pid>   - Kill the process with the given PID"
    echo "  force <pid>  - Force kill the process with the given PID"
    echo "  -help        - Get help with usage information"
    exit 0
fi

case "$1" in
    list)
        echo "Listing all running processes..."
        ps aux
        ;;
    kill)
        if [ -z "$2" ]; then
            echo "Please provide a PID to kill."
            exit 1
        fi
        echo "Killing process with PID: $2"
        kill $2
        ;;
    force)
        if [ -z "$2" ]; then
            echo "Please provide a PID to force kill."
            exit 1
        fi
        echo "Force killing process with PID: $2"
        kill -9 $2
        ;;
    *)
        echo "Invalid command. Use 'kill_custom -help' for usage information."
        ;;
esac
a





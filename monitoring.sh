#!/bin/bash

arch=$(uname -a)

cpuf=$(grep "physical id" /proc/cpuinfo | wc -l)
cpuv=$(grep "^processor" /proc/cpuinfo | wc -l)

ram_total=$(free -m | grep Mem: | awk '{print $2}')
ram_use=$(free -m | grep Mem: | awk '{print $3}')
ram_percent=$((ram_use * 100 / ram_total))

disk_total=$(df -m --total | tail -1 | awk '{print $2}')
disk_use=$(df -m --total | tail -1 | awk '{print $3}')
disk_percent=$((disk_use * 100 / disk_total))

cpul_idle=$(vmstat 1 2 | tail -1 | awk '{print $15}')
cpu_load=$((100 - cpul_idle))

lb=$(who -b | awk '{print $3 " " $4}')

if lsblk | grep -q "lvm"; then
  lvmu="yes"
else
  lvmu="no"
fi

tcpc=$(ss -ta | grep ESTAB | wc -l)
ulog=$(users | wc -w)

ip=$(hostname -I | awk '{print $1}')
mac=$(ip link | awk '/link\/ether/ {print $2; exit}')

cmnd=$(journalctl _COMM=sudo 2>/dev/null | grep COMMAND | wc -l)

wall "Architecture: $arch
CPU physical: $cpuf
vCPU: $cpuv
Memory Usage: ${ram_use}/${ram_total}MB (${ram_percent}%)
Disk Usage: ${disk_use}/${disk_total}MB (${disk_percent}%)
CPU load: ${cpu_load}%
Last boot: $lb
LVM use: $lvmu
Connections TCP: $tcpc ESTABLISHED
User log: $ulog
Network: IP $ip ($mac)
Sudo: $cmnd cmd"


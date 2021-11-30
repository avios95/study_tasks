#!/bin/bash
#System info
HN=$(hostname)
IP=$(ip a | grep inet | awk NR\ ==\ 3\{print\ \$2\})
KRNL=$(hostnamectl | awk NR\ ==\ 8\{print\ \$2\$3\})
ARCH=$(arch)
OS=$(hostnamectl | awk NR\ ==\ 7\{print\ \$3\$4\$5\$6})
CPU=$(cat /proc/cpuinfo | awk NR\==\ 5\ '{print $4" "$5" "$6" "$7" "$8" "$9" "$10}')
#disks
D=$(ls /dev/ | grep sd | awk NR\==\ 1)
D1=$(ls /dev/ | grep sd | awk NR\==\ 2)
D2=$(ls /dev/ | grep sd | awk NR\==\ 3)
D3=$(ls /dev/ | grep sd | awk NR\==\ 4)
D4=$(ls /dev/ | grep sd | awk NR\==\ 5)
D5=$(ls /dev/ | grep sd | awk NR\==\ 6)
#ram
T=$(free -m | awk NR\==\ 2\ {print\ \$2})
U=$(free -m | awk NR\==\ 2\ {print\ \$3})
F=$(free -m | awk NR\==\ 2\ {print\ \$4})
#cpu used
LA=$(cat /proc/loadavg)
#hdd used
K=$(df -m | grep sd | awk NR\==\ 1\ {print\ \$6})
UK=$(df -m | grep sd | awk NR\==\ 1\ {print\ \$5})
E=$(df -m | grep sd | awk NR\==\ 2\ {print\ \$6})
UE=$(df -m | grep sd | awk NR\==\ 2\ {print\ \$5})



echo "HOSTNAME: $HN"
echo "IPADDRESS: $IP"
echo "KERNEL: $KRNL"
echo "ARCHITECTURE: $ARCH"
echo "OS: $OS"
echo "HDD: $D $D1 $D2 $D3 $D4 $D5"
echo "RAM: $T MB"
echo "CPU: $CPU"


echo "Memory used: $U MB"
echo "CPU used: $LA" 
echo "HDD used: $K $UK, $E $UE"

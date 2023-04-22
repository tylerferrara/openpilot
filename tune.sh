#!/usr/bin/bash

# affine IRQs away from our cores
for irq in $(ls /proc/irq/); do
  if [ -f /proc/irq/$irq/smp_affinity_list ]; then
    echo $irq
    echo 0-1 | sudo tee /proc/irq/$irq/smp_affinity_list
  fi
done
echo 3 | sudo tee /proc/irq/default_smp_affinity


# cpuset
#CPUSET=/sys/fs/cgroup/cpuset/lowprio
#sudo mkdir -p $CPUSET
#echo 0-1 | sudo tee $CPUSET/cpuset.cpus
#while read i; do sudo su -c "echo $i > $CPUSET/tasks"; done < /sys/fs/cgroup/cpuset/tasks #2>/dev/null

#sudo mount -o rw,remount /
#sudo su -c "echo 'CPUAffinity=0 1' >> /etc/systemd/system.conf"


# make sure display is all good


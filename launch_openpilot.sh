#!/usr/bin/bash

if ! cmp --silent /usr/comma/power_drop_monitor.py /data/openpilot/scripts/power_drop_monitor.py; then
  echo "updating power drop monitor"
  sudo mount -o rw,remount /
  sudo cp /data/openpilot/scripts/power_drop_monitor.py /usr/comma/
  sudo mount -o ro,remount /
else
  echo "power drop monitor up to date"
fi

export PASSIVE="0"
exec ./launch_chffrplus.sh


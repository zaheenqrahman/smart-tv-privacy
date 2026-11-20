#!/bin/sh
# disables everything in packages.txt except what's in keep.txt
# usage: TV_IP=192.168.1.50 ./debloat.sh
# nothing gets uninstalled, rollback.bat turns it all back on
cd "$(dirname "$0")"
: "${TV_IP:?set TV_IP to your fire tv ip}"

adb connect "$TV_IP:5555"
grep -vxFf keep.txt packages.txt | while read -r pkg; do
  echo "disabling $pkg"
  adb shell pm disable-user --user 0 "$pkg"
done

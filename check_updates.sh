#!/usr/bin/env bash
started=$(date)
echo $started: "Started check_updates.sh" >> /home/michael/.config/scripts/check_updates.log

result=$(dnf updateinfo) 

security="Security"
updates="Updates Information Summary"
details=$(echo "$result"|grep "$updates" -A 4 |grep -v "$updates")
message="Software updates available.
$details"

if [[ $result =~ $security ]]
then
  found_security_time=$(date)
  echo $found_security_time "Found security updates." >> /home/michael/.config/scripts/check_updates.log
  notify-send -u critical "Security updates available."
  elif [[ $result =~ $updates ]]; then
    found_updates_time=$(date)
    echo $found_updates_time $message
    notify-send "$message"
fi
finished=$(date)
echo $finished: "Finished check_updates.sh" >> /home/michael/.config/scripts/check_updates.log

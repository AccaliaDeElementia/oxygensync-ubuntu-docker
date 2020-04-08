#!/bin/bash
cd /app/
nohup ./cloudd_oxygen_toolkit  > /dev/null &
clouddpid="$!"

sleep 5
if [ -z "${clouddpid}" ]; then 
  echo Cloudd service did not start
  exit 1
fi

nohup ./syncd_oxygen_toolkit > /dev/null &
syncdpid=$!

sleep 5
if [ -z "${syncdpid}" ]; then 
  echo Syncd service did not start
  exit 1
fi

nohup ./filed_oxygen_toolkit > /dev/null &
filedpid=$!

sleep 5
if [ -z "${filedpid}" ]; then 
  echo Filed service did not start
  exit 1
fi

echo Startup Complete

while [ -d "/proc/${clouddpid}" -a -d "/proc/${syncdpid}" -a -d "/proc/${filedpid}" ]; do
  sleep 60;
done

if [ ! -d "/proc/${clouddpid}" ]; then
  echo Cloudd Service stopped
fi

if [ ! -d "/proc/${syncdpid}" ]; then
  echo Syncd Service stopped
fi

if [ ! -d "/proc/${filedpid}" ]; then
  echo Filed Service stopped
fi
exit 0
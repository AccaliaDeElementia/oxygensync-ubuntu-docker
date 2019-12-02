#!/bin/bash
cd /app/explorer
nohup ./cloudd  > /dev/null &
clouddpid="$!"

sleep 5
if [ -z "${clouddpid}" ]; then 
  echo Cloudd service did not start
  exit 1
fi

cd /app/syncd
nohup ./syncd > /dev/null &
syncdpid=$!

sleep 5
if [ -z "${syncdpid}" ]; then 
  echo Syncd service did not start
  exit 1
fi

echo Startup Complete

while [ -d "/proc/${clouddpid}" -a -d "/proc/${syncdpid}" ]; do
  sleep 60;
done

if [ ! -d "/proc/${clouddpid}" ]; then
  echo Cloudd Service stopped
fi

if [ ! -d "/proc/${syncdpid}" ]; then
  echo Syncd Service stopped
fi
exit 0
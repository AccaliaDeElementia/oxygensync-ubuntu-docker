#!/bin/bash

echo -n $"Stopping Sync Daemon"
echo
pid=$(ps -ef | grep syncd | grep -v grep | awk '{print $2}' | tail -n 1)
echo $pid
if [ ! -z "$pid" ]
then
   kill -15 $pid
fi
sleep 5
echo
echo 'Stopped'

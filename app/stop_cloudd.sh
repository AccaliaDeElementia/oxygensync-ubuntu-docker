#!/bin/bash

echo -n $"Stopping Cloud Gateway"
echo
pid=$(ps -ef | grep cloudd_oxygen_toolkit | grep -v grep | awk '{print $2}' | tail -n 1)
echo $pid
if [ ! -z "$pid" ]
then
   kill -15 $pid
fi
sleep 5
echo
echo 'Stopped'

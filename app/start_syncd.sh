#!/bin/bash

echo -n $"Starting Sync Daemon"
echo
nohup ./syncd_oxygen_toolkit > /dev/null 2>&1 &
sleep 5
echo
echo "Started on port 27501"

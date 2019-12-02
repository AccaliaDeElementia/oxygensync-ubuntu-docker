#!/bin/bash

echo -n $"Starting Sync Daemon"
echo
nohup ./syncd > /dev/null 2>&1 &
sleep 5
echo
echo 'Started on port 26511'

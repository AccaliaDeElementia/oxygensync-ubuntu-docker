#!/bin/bash

echo -n $"Starting File Gateway"
echo
nohup ./filed_oxygen_toolkit > /dev/null 2>&1 &
sleep 5
echo
echo "Started on port 27505"

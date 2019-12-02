#!/bin/bash

echo -n $"Starting Cloud Gateway"
echo
nohup ./cloudd > /dev/null 2>&1 &
sleep 5
echo
echo 'Started on port 26504'

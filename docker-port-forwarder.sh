#!/bin/bash

# Check if exactly 3 arguments are provided
if [ "$#" -lt 3 ]; then
  echo "Usage: $0 <host> <container> <port> [local_port]"
  exit 1
fi

# Assign arguments to variables for better readability
host=$1
container=$2
port=$3
local_port=${4:-$port}

# SSH into the host and run docker inspect on the container
container_ip=$(ssh $host "docker inspect $container" | jq -r '.[0].NetworkSettings.Networks[].IPAddress' | head -n 1)

echo "Forwarding port $port from $container ($container_ip) on $host to localhost..."

ssh -L localhost:$local_port:$container_ip:$port $host 'echo "Press Ctrl+C to stop forwarding" && sleep 365d'

#!/bin/bash

services=(
  "https://api.ipify.org"
  "https://ipv4-internet.yandex.net/api/v0/ip"
  "https://chek.zennolab.com/proxy.php"
  "https://ifconfig.me/ip"
  "https://icanhazip.com"
)

for service in "${services[@]}"; do
  ip=$(curl -s --max-time 5 "$service")
  if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "$ip"
    exit 0
  fi
done

exit 1

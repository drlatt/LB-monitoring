#!/bin/bash
#This script configures prometheus and starts the prometheus process in the background
cd ~/Prometheus/server

cat <<DOH >> prometheus.yml
scrape_configs:
  - job_name: "node"
    scrape_interval: "15s"
    target_groups:
    - targets: ['localhost:9100','server1.lat.com:9100','server2.lat.com:9100']
DOH

nohup ./prometheus > /var/log/prometheus.log 2>&1 &

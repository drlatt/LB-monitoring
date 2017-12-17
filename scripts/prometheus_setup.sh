#!/bin/bash
#This script installs prometheus software
cd /tmp

wget "https://github.com/prometheus/prometheus/releases/download/0.15.1/prometheus-0.15.1.linux-amd64.tar.gz"

mkdir -p ~/Prometheus/server && cd ~/Prometheus/server

tar -xvzf /tmp/prometheus-0.15.1.linux-amd64.tar.gz

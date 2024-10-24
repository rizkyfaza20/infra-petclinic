# Monitoring Infrastructure Documentation

## Overview
This monitoring setup implements a robust observability stack using:
- Prometheus - Metrics collection and storage
- Node Exporter - System metrics collection
- cAdvisor - Container metrics collection
- Promtail - Log collection and forwarding to Grafana Loki

## Components

### 1. Prometheus
- Scrapes metrics every 5 seconds
- Configured to collect metrics from:
  - Itself (localhost:9090)
  - Node Exporter (node-exporter:9100)
- Remote write enabled to Grafana Cloud
- Data persistence through local volume mount

### 2. Node Exporter
- Collects system-level metrics
- Mounted volumes:
  - /proc (process information)
  - /sys (system information)
  - /rootfs (root filesystem)
- Excludes unnecessary mount points
- Exposes metrics on port 9100

### 3. cAdvisor
- Container metrics collection
- Runs in privileged mode for full container access
- Monitors:
  - Container resource usage
  - Performance characteristics
  - Filesystem metrics
- Exposes metrics on port 8090

### 4. Promtail
- Log collection agent for Grafana Loki
- Collects logs from:
  - System logs (/var/log/*.log)
  - Container logs (/var/lib/docker/containers)
- Parses container logs with:
  - JSON parsing
  - Custom regex for container metadata
  - Label extraction

## Setup Instructions

1. Configure Grafana Cloud credentials:
   - Add your Grafana Cloud API token in `promtail.yml`
   - Update Prometheus remote_write credentials in `prometheus.yml`

> ## NOTES

The scopes needed for Prometheus is `Metrics Publisher`

For Loki Instances you need the following scopes:
- metrics:write
- metrics:import
- logs:write
- traces:write
- alerts:write
- rules:write
- profiles:write

2. Start the monitoring stack:
```bash
docker-compose -f observability/docker-compose.yml up -d

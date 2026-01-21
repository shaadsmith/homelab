# Caddy Reverse Proxy Architecture

## 1. Purpose

Caddy provides a centralized access layer for internal services by mapping hostnames to internal services behind a single entry point. Internal proxy to avoid memorization of IPs+ports for services. 

This is an internal-only reverse proxy, there is no exposure to WAN.

---

## 2. High-Level Design

The internal access stack consists of a single Caddy instance acting as an internal ingress controller:
| Instance        | Platform       | Purpose                              | Status        |
|-----------------|----------------|--------------------------------------|---------------|
| caddy-01        | Proxmox LXC    | Internal reverse proxy               | Active        |


This instance:
- Provides hostname-based routing for internal services
- Eliminates the need to access services by IP address and port
- Is not exposed to the WAN and has no public-facing role
- Operates only on the Secured VLAN

## 3. Platform Justification

### Why LXC instead of VM?
- Reverse proxying is lightweight
- Low memory and CPU footprint
- Fast startup and easy recovery

### LXC Resource Allocation

| Resource | Value |
|------|------|
| CPU  | 1 core |
| RAM  | 512 MB |
| Disk | 4 GiB |
| OS   | Ubuntu 22.04 container |
| VLAN | 20, Secure network |


## 4. Future Growth / Current Limitations
- No failover
- Manual update management
- Single Proxmox host
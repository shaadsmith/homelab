# Home Lab 💾

This repository documents the design, implementation, and ongoing evolution of my personal homelab.
The lab is used to practice virtualization, network segmentation, firewall policy design, and whatever else I'm trying to learn at the time

## Goals
- Practice real-world network segmentation using VLANs
- Enforce least-privilege traffic flow with explicit firewall rules
- Operate and manage Proxmox with multiple VMs and LXCs
- Host internal services securely

## High-Level Architecture

- **2× Proxmox hypervisors**
- **1× M1 Mac Mini**
- **Managed switches** with VLAN support
- **VLAN-aware access point(s)**
- **Dedicated VLANs** for:
  - Secure
  - Guest
  - IoT
  - Homelab
  - Management traffic
- **Internal services** hosted on VMs and LXCs  

## Technologies
- Proxmox VE
- Linux (Debian/Ubuntu)
- Pi-hole
- Caddy reverse proxy
- VLANs, firewall rules, Wifi

## What This Is **Not**
- Not production infrastructure
- Not fully automated (yet)
- Not cloud-hosted

## Roadmap
See `roadmap.md`.
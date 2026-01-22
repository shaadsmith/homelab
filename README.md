# Home Lab 💾

This repository documents the design, implementation, and ongoing evolution of my personal homelab.

The lab is used to practice virtualization, network segmentation, firewall policy design, and whatever else I'm trying to learn at the time.

## Table of Contents

- [Hardware](#hardware)
  - [Bill of Materials](hardware/bill-of-materials.md)
  - [Hardware Rationale](hardware/hardware-rationale.md)
- [Network](#network)
  - [VLAN Plan](network/vlan-plan.md)
  - [IP Addressing](network/ip-addressing.md)
  - [Firewall Rules](network/firewall-rules.md)
- [Proxmox](#proxmox)
  - [Proxmox Environment Overview](proxmox/proxmox-environment-overview.md)
  - [VM and LXC Inventory](proxmox/vm-lxc-inventory.md)
- [Security](#security)
  - [Security Model](security/security-model.md)
- [Services](#services)
  - [Pi-hole](services/pihole/architecture.md)
  - [Caddy (Reverse Proxy)](services/caddy/architecture.md)



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

- [ ] Add third Proxmox host and begin cluster design
- [ ] Migrate hardware documentation to UniFi ecosystem (v2 BOM + rationale)
- [ ] Add new VLAN to support UniFi network design
- [ ] Evaluate alternative DNS and monitoring stacks
- [ ] Introduce infrastructure automation (Terraform + Ansible)
- [ ] Add network diagrams to documentation

See (Roadmap)[#roadmap.md].
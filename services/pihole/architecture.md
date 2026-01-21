# Pi-hole + Unbound Architecture

## 1. Purpose

Pi-hole provides centralized DNS filtering, domain blocking, and DNS policy enforcement for internal networks.  
It is paired with Unbound to provide local recursive DNS resolution, reducing reliance on external resolvers and improving privacy, resilience, and control.

This deployment is currently in a **validation phase** and exists only in the **Secured VLAN** before being deploying to the Guest network.

---

## 2. High-Level Design

The DNS stack consists of two Pi-hole instances:

| Instance        | Platform        | Purpose                              | Status        |
|-----------------|----------------|--------------------------------------|---------------|
| pihole-01       | Proxmox LXC     | Primary DNS service                  | Active        |
| pihole-02       | Raspberry Pi 3  | Redundancy / failover                | Active        |

Both instances:
- Run Pi-hole + Unbound
- Provide DNS filtering and recursive resolution
- Only on the Secured VLAN until further notice

## 3. Platform Justification

### Why LXC instead of VM?
- DNS services are lightweight
- Minimal compute needs
- LXC provides:
  - Lower overhead
  - Faster startup
  - Easier snapshotting
  - Less resource waste

### LXC Resource Allocation

| Resource | Value |
|--------|------|
| CPU    | 1 core |
| Memory | 1 GiB |
| Disk   | 10 GiB |
| OS     | Ubuntu 22.04 (container) |
| VLAN   |  20, Secure |

## 4. Future Growth / Current Limitations
- No failover
- Manual update management
- Single Proxmox host


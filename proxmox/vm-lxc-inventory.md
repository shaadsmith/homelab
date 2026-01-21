# VM and LXC Inventory

This document inventories virtual machines and containers across the Proxmox environment.
Workloads are grouped by host.

---

## Host 1 – Infrastructure Host (Trusted Zone)

**Purpose**
Stable host for internal services with low tolerance for disruption.

**Network Placement**
- Trusted VLAN
- Management access restricted
- No experimental workloads 

### Current Workloads

| Name            | Type | Purpose               | Network Zone | Notes |
|-----------------|------|-----------------------|--------------|-------|
| pihole-01       | LXC  | DNS filtering         | Trusted      | Core internal service |
| caddy-01        | LXC  | Internal reverse proxy| Trusted      | Entry point for services |

**Policy**
- Services should be long-lived
- Configuration drift minimized
- Changes documented before deployment

---

## Host 2 – Lab / Experimentation Host (Untrusted Zone)

**Purpose**
Isolated environment for learning, testing, and experimentation without risk to internal services.

**Network Placement**
- Homelab VLAN
- Restricted east-west access
- Treated as untrusted by default

### Current Workloads

| Name         | Type | Purpose                 | Network Zone | Notes |
|--------------|------|-------------------------|--------------|-------|
| kali-01      | VM   | Security experimentation| Homelab     | Disposable |
| ubuntu-lab-01| VM   | General experimentation | Homelab     | Disposbale |

---

## Naming Conventions

- Suffix `-01`, `-02` used for role-based scaling
- Hostnames reflect function, not OS
- Temporary labs may use descriptive but non-permanent names

---

# Homelab Security Model

This document defines threat assumptions and baseline hardening controls for the homelab.

Security is enforced primarily through network isolation and intentional service exposure.

---

## 1. Trust Boundaries

The environment is segmented into explicit trust zones.

| Zone          | Trust Level | Purpose |
|--------------|------------|--------|
| Secured VLAN | High        | Core services, infrastructure, management |
| Homelab VLAN | Low         | Experimental systems, learning, testing |
| Guest VLAN   | Untrusted   | Visitors, unmanaged devices, etc |
| IoT VLAN     | Low         | Smart TVs/speakers, sensor, security cameras |
| VPN Clients  | Mixed       | Remote access to Trusted VLAN & NAS |
| WAN          | Untrusted   | External networks |

### VPN access is role-based:

| VPN Role     | Access Scope |
|-------------|-------------|
| VPN-Admin   | Full access to Trusted VLAN infrastructure and services |
| VPN-Limited | Access only to specific services (e.g., NAS file shares) |

Boundary principles:
- No implicit trust between VLANs
- Inter-VLAN traffic is allowed by default
- Experimental systems are treated as compromised & isolated by default
- Trusted infrastructure never depends on untrusted systems

---

## 2. Threat Model

### Assets
- Proxmox hypervisors and management interfaces
- Core services (Pi-hole, Caddy, NAS)
- Trusted Desktop/Laptop
- VPN access endpoint
- VLAN segmentation and firewall configuration

### Trust Assumptions
- Secure VLAN devices are owned and maintained
- VPN credentials are protected
- Firewall rules are correctly implemented
- No WAN exposure of internal services exists

### Primary Threats
- Credential reuse: Same creds across zones (Privilege escalation)
- Misconfiguration: Exposed management interfaces (System compromise)
- Control-plane compromise: Pi-hole, Caddy, or VPN failure (Network control loss)

Out of scope:
- Physical compromise

Risk posture:
Isolation failures are higher risk than service outages.

---

## 3. Hardening Controls

### Network Controls
- Default deny between VLANs
- No WAN port forwarding to internal services
- Management interfaces reachable only from Trusted VLAN

### Host Controls
- Proxmox:
  - UI access IP restricted
  - Strong authentication
  - No access from untrusted VLANs
- LXCs / VMs:
  - Minimal packages
  - Unique credentials per trust zone
  - Regular manual patching for workloads

### Service Controls
- Pi-hole:
  - Web UI restricted to trusted VLAN
- Caddy:
  - No WAN binding
  - Secure VLAN only
  - No public certificate issuance

### Credential Controls
- No credential reuse across trust zones
- VPN credentials separate from infrastructure credentials
- Password manager for admin accounts
- Credentials backed up monthly

### Change Discipline
- Snapshot before major infrastructure changes
- Config backups for:
  - Edgerouter 4
  - Proxmox
  - Pi-hole
  - Caddy
  - Password manager

---

## Design Philosophy

This homelab prioritizes:
- Isolation over flat network
- Intentional exposure over default access

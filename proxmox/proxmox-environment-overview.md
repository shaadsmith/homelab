# Proxmox Environment Overview

This document describes the current Proxmox virtualization environment.
At present, the environment consists of two independent Proxmox VE installations.
Clustering with a third installation is planned but not yet implemented.

The separation is intentional and aligned with risk isolation goals.

---

## Environment Purpose

The Proxmox environment serves two primary purposes:

1. Host stable internal services required for day-to-day operation
2. Provide an isolated platform for experimentation and skill development

These goals are intentionally separated to avoid cross-impact between stable services and experimental workloads.

---

## Current Topology 

- Number of Proxmox hosts: 2
- Cluster status: Not clustered
- Management model: Independent hosts with no shared state

There is no shared storage, no live migration, and no dependency between hosts.

This is a deliberate design choice, not a limitation.

---

## Host Roles and Trust Zones

### Host 1: Infrastructure Host

**Purpose**
- Runs internal and semi-critical services
- Intended to remain stable and minimally changed

**Typical Workloads**
- Pi-hole (DNS filtering)
- Reverse proxy

- Potential future services:
  - Monitoring and logging
  - Network controllers
  - RADIUS / authentication services

**Network Placement**
- Primarily attached to the Secured VLAN
- Management access restricted to trusted devices

**Risk Profile**
- Low tolerance for disruption
- Changes are intentional and infrequent

---

### Host 2: Lab / Experimentation Host

**Purpose**
- Safe environment for testing new technologies
- Skill development without risking core services

**Typical Workloads**
- Temporary VMs and LXCs
- OS and service experimentation

**Network Placement**
- Homelab VLAN
- Isolated from secure and infrastructure networks via firewall rules

**Risk Profile**
- High tolerance for failure
- Frequent rebuilds and configuration changes expected

---

## Rationale for Separation

The decision to run independent Proxmox installations provides:

- Strong fault isolation between stable and experimental workloads
- Reduced disruptions from misconfiguration or compromise
- Clear trust boundaries aligned with network segmentation
- Poor man's separation of Prod & Dev

---

## Security Considerations

- No implicit trust between hosts
- No shared credentials or storage
- Management interfaces exposed only on appropriate VLANs
- Experimental workloads treated as untrusted by default

---

## Known Limitations

- No live migration between hosts
- No centralized management
- Manual workload placement

These limitations are accepted in exchange for stronger isolation.

---

## Planned Evolution

### Phase 1 (Current)
- Two independent Proxmox hosts
- Role-based separation
- Network-enforced isolation

### Phase 2 (Planned)
- Introduction of a third Proxmox host
- Formation of a Proxmox cluster
- Exploration of:
  - Quorum management
  - Shared or replicated storage
  - Controlled migration between nodes

---
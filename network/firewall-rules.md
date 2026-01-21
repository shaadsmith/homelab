# Firewall Policy Overview

## Default Policy
- Deny inter-VLAN traffic by default
- All VLANs → WAN 

## Explicit Allows
- Secure → Management
- Secure → Homelab
- Homelab → Secure: Established & Related
- Guest → IoT: Ability to play music on network attached speakers
- IoT → Guest: Established & Related

## Rationale
Rules are written to minimize blast radius in the event of device compromise.

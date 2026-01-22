# VPN Architecture – L2TP/IPsec and Zero-Trust Overlays

## Purpose

The VPN infrastructure provides secure remote access into the homelab while enforcing separation of trust levels. Designed to support both traditional network-level access (L2TP/IPsec) and application-level access models (Zero Trust VPN overlays).

---

## VPN Types in Use

| VPN Type         | Role                                   | Status      |
|------------------|----------------------------------------|------------|
| L2TP/IPsec       | Primary administrative access tunnel   | Active     |
| Tailscale        | Zero-trust access for limited clients  | Active     |
| NetBird          | Zero-trust model evaluation            | Testing    |

---

## Architecture Overview

### L2TP/IPsec Tunnel

- Using PSK
- Terminates on the network gateway/firewall  
- Assigns IPs from a reserved static pool carved out of the Secured VLAN  
- Acts as a full network-level entry point  
- Used exclusively for my administrative access  

### Zero-Trust Overlay VPNs (Tailscale / NetBird)

- Do not expose full network access
- Drop users directly onto specific services
- Identity and device-based access enforcement

## Access Model

| Client            | VPN Type     | Assigned Network          | Allowed Access                       | Restrictions                       |
|------------------|-------------|---------------------------|--------------------------------------|----------------------------------------|
| Personal VPN     | L2TP/IPsec  | Secured VLAN (static IPs) | Full management and infrastructure   | None                                   |
| Family's VPN     | Tailscale   | Direct to NAS only        | File access on Synology NAS          | No VLAN access, no lateral movement    |
| Personal VPN     | Netbird     | Overlay VPN               | Access to random pi nodes for testing| Zero trust, no lateral movement        |
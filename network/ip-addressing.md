# IP Addressing Strategy (Sanitized)

This document describes the IP addressing design used in the homelab.
Actual IP addresses have been replaced with sanitized ranges.

## Addressing Principles
- One subnet per VLAN
- DHCP ranges start at a fixed offset for predictability
  - Lease pool begins at .100 to prevent overlap with static assignments
- Sufficient room for growth
- Predictable gateway placement

## Subnet Layout (Illustrative)

| VLAN | Name        | Subnet              | Static Range        | DHCP Range        |
|------|-------------|---------------------|---------------------|-------------------|
| 10   | Management  | 192.0.2.0/24        | .2 – .99            | .100 – .254       |
| 20   | Trusted     | 198.51.100.0/24     | .2 – .99            | .100 – .254       |
| 30   | Guest       | 203.0.113.0/24      | .2 – .99            | .100 – .254       |
| 40   | IoT         | 192.168.123.0/24    | .2 – .99            | .100 – .254       |
| 50   | Homelab     | 192.168.132.0/24    | .2 - .99            | .100 - .254       |

## Gateway Strategy
- Default gateway is first usable address per subnet (.1)
- No inter-VLAN routing without explicit rules

## Notes
- Address ranges are illustrative only
- Real environment uses equivalent private ranges
- The 192.168.x.0/24+ ranges were chosen to reduce the likelihood of overlap with corporate VPN routes, which commonly consume 10.0.0.0/8
- Lower 192.168.x.0/24 ranges were intentionally avoided to prevent conflicts with consumer defaults
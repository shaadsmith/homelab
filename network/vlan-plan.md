# VLAN Design

| VLAN | Name        | Purpose                        |
|------|-------------|--------------------------------|
| 10    | Management  | Gateway, Switches, APs, etc    |
| 20   | Secure      | Personal laptop/desktop, Proxmox |
| 30   | Guest       | Wifi for friends & family      |
| 40   | IoT         | Smart devices of all shapes and sizes |
| 50   | Homelab     | Testing new tech                 |

Design principles:
- Management traffic isolated from user traffic
- IoT devices restricted
- No implicit inter-VLAN trust
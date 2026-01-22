# Homelab Roadmap

---

## Infrastructure

- [ ] Add third Proxmox host  
  - Define role in future cluster  

- [ ] v2 Bill of Materials  
  - Remove Omada hardware  
  - Add UniFi APs, switches, and gateway  

- [ ] v2 Hardware Rationale  
  - Document reasons for Omada → UniFi migration  
  - Compare management model differences  
  - Note tradeoffs (vendor lock-in vs operational simplicity)  

---

## Networking

- [ ] Add new VLAN to support UniFi design constraints  
  - Update `network/vlan-plan.md`  
  - Update `network/ip-addressing.md`  
  - Add VLAN references to firewall rules  
  - Validate routing and isolation behavior  

- [ ] Review firewall rules for VLAN expansion  
  - Ensure least-privilege inter-VLAN access  
  - Confirm management plane isolation  

---

## Services

- [ ] Explore Technitium DNS  
  - Evaluate as Pi-hole + Unbound replacement  
  - Test DoH and DoT support  
  - Compare performance and management overhead  

- [ ] Explore Prometheus + Grafana  
  - Collect Proxmox metrics  
  - Track VM/LXC resource usage  
  - Collect Synology metrics

- [ ] Explore NetAlert  
  - Validate usefulness independent of gateway vendor  
  - Test alerting and anomaly detection features  

---

## Platform Automation

- [ ] Introduce Terraform for Proxmox  
  - Automate VM and LXC provisioning  
  - Define base templates  
  - Version infrastructure definitions  

- [ ] Introduce Ansible for system configuration  
  - Standard SSH configuration  
    - Deploy SSH keys  
    - Disable password authentication  
  - Baseline package installation  
  - Hardened default system settings  
  - Consistent user and permission management  

---

## Documentation

- [ ] Add network diagrams  
  - Physical topology  
  - VLAN segmentation  

---
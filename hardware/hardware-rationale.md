# Hardware Selection Rationale

## Router
EdgeRouter 4 offers gigabit routing performance with hardware offloading while supporting enterprise-grade features such as VLANs, firewalling, NAT, and VPNs. Can be provisioned via CLI or GUI making it well-suited for learning and experimentation. Additionally, the ER4 offers strong stability, low power consumption, and a favorable price tag compared to similar spec'd hardware.

## Proxmox Nodes
 Hardware consists of used, readily available x86 thin clients to minimize acquisition and replacement costs. Lenovo ThinkCentre are commonly available on the secondary market (eBay) for under $70, and upgrading NVMe storage and RAM represents a relatively small additional expense. While not a primary goal, this hardware closely resembles configurations potentially found in small-business virtualization environments.

## Managed Switch
TP-Link Omada managed switches were selected to balance cost and capability for a starter homelab. Staying within the Omada ecosystem provides exposure to business-oriented networking hardware while remaining affordable. The switches support VLANs and trunking, enabling network segmentation. An existing Netgear XS748T was not used due to noise levels unsuitable for a small homelab environment.

## Access Points
Wireless access points are TP-Link Omada devices to remain within a single ecosystem. The APs support multiple SSIDs mapped to multiple VLANs, enabling segmented wireless networks. An EAP773 serves as the primary access point, while an EAP650 is deployed using wireless backhaul to extend coverage to the garage.

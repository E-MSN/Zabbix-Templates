# E-MSN Zabbix Templates

Community Zabbix templates maintained and shared by **E-MSN**.

This repository provides ready-to-use Zabbix templates for monitoring network switches, Wi-Fi access points and controllers, servers, storage systems, UPS devices and network video recorders through SNMP, API or agent-based checks.

The goal of this project is to make practical, tested and reusable Zabbix templates available to the community.

## Contents

- [Available templates](#available-templates)
  - [Network switches](#network-switches)
  - [Wi-Fi access points and controllers](#wi-fi-access-points-and-controllers)
  - [Servers and management controllers](#servers-and-management-controllers)
  - [Virtualization and Hypervisors](#virtualization-and-hypervisors)
  - [Storage systems](#storage-systems)
  - [UPS devices](#ups-devices)
  - [NVR devices](#nvr-devices)
  - [Telephony](#telephony)
- [Zabbix compatibility](#zabbix-compatibility)
- [How to use](#how-to-use)
- [About this project](#about-this-project)
- [Disclaimer](#disclaimer)
- [License](#license)
- [About E-MSN](#about-e-msn)

---

## Available templates

Browse the templates by device category below. Click a template name to open its directory and documentation.

Template directories are named using the convention **Vendor Device by Method**. Each directory should contain:

- An importable template in YAML format
- A README with installation and configuration instructions
- Screenshots

Refer to each template's README for tested models, firmware versions, monitored metrics, triggers and required macros. A product family listed below does not imply that every model in that family has been tested.

### Network switches

Zabbix templates for Ethernet switches and Fibre Channel SAN switches.

| Template | Monitoring method |
| --- | --- |
| [Alcatel-Lucent Enterprise OmniSwitch](Zabbix%20Templates/Alcatel-Lucent%20Enterprise%20OmniSwitch%20by%20SNMP) | SNMP |
| [Alcatel-Lucent Enterprise WebSmart](Zabbix%20Templates/Alcatel-Lucent%20Entreprise%20WebSmart%20switch%20by%20SNMP) | SNMP |
| [Aruba CX 6000 series](Zabbix%20Templates/Aruba%20CX%206000%20series%20by%20SNMP) | SNMP |
| [Aruba Instant On 1830 Series](Zabbix%20Templates/Aruba%20Instant%20On%201830%20Series%20by%20SNMP) | SNMP |
| [D-Link DGS / DXS switches](Zabbix%20Templates/D-Link%20DGS_DXS%20Switch%20by%20SNMP) | SNMP |
| [Lenovo ThinkSystem DB610S FC SAN Switch](Zabbix%20Templates/Lenovo%20ThinkSystem%20DB610S%20FC%20SAN%20Switch%20by%20SNMP) | SNMP |

### Wi-Fi access points and controllers

Zabbix templates for wireless access points and WLAN controllers.

| Template | Monitoring method |
| --- | --- |
| [Alcatel & Aruba Instant AP Controller](Zabbix%20Templates/Alcatel%20%26%20Aruba%20Instant%20AP%20Controller%20by%20SNMP) | SNMP |
| [Alcatel-Lucent Enterprise OmniAccess Stellar](Zabbix%20Templates/Alcatel-Lucent%20Enterprise%20OmniAccess%20Stellar%20by%20SNMP) | SNMP |
| [Cisco Wireless LAN Controller](Zabbix%20Templates/Cisco%20Wireless%20LAN%20Controller%20by%20SNMP) | SNMP |
| [Ruckus Unleashed](Zabbix%20Templates/Ruckus%20Unleashed%20by%20SNMP) | SNMP |

### Servers and management controllers

Zabbix templates for server hardware and management controllers.

| Template | Monitoring method |
| --- | --- |
| [Lenovo XCC](Zabbix%20Templates/Lenovo%20XCC%20by%20SNMP) | SNMP |
| [NVIDIA DGX Spark and vLLM](Zabbix%20Templates/NVIDIA%20DGX%20Spark%20by%20Zabbix%20agent%202%20active) | Zabbix agent 2 active |

### Virtualization and Hypervisors

Zabbix templates for virtualization platforms, hypervisors, and virtual infrastructure monitoring.

| Template | Monitoring method |
| --- | --- |
| [Vates Virtualization Management Stack](Zabbix%20Templates/Xen%20Orchestra%20by%20HTTP) | Web API |

### Storage systems

Zabbix templates for storage arrays and NAS systems.

| Template | Monitoring method |
| --- | --- |
| [Lenovo ThinkSystem DE Series](Zabbix%20Templates/Lenovo%20ThinkSystem%20DE%20Series%20by%20web%20API%20%28SANtricity%29) | Web API (SANtricity) |
| [Lenovo ThinkSystem DM Series](Zabbix%20Templates/Lenovo%20ThinkSystem%20DM%20Series%20by%20Web%20API%20%28NetApp%29) | Web API (NetApp) |
| [QNAP QTS](Zabbix%20Templates/QNAP%20QTS%20by%20SNMP) | SNMP |
| [Synology DiskStation](Zabbix%20Templates/Synology%20DiskStation%20by%20SNMP) | SNMP |

### UPS devices

Zabbix templates for uninterruptible power supplies.

| Template | Monitoring method |
| --- | --- |
| [Eaton UPS](Zabbix%20Templates/Eaton%20UPS%20by%20SNMP) | SNMP |
| [SOCOMEC UPS NetVision](Zabbix%20Templates/SOCOMEC%20UPS%20NetVision%20by%20SNMP) | SNMP |

### NVR devices

Zabbix templates for network video recorders.

| Template | Monitoring method |
| --- | --- |
| [Dahua NVR](Zabbix%20Templates/Dahua%20NVR%20by%20web%20API%20and%20SNMP) | Web API and SNMP |
| [Hikvision NVR](Zabbix%20Templates/Hikvision%20NVR%20by%20web%20API) | Web API |

### Telephony

Zabbix templates for telephony systems.

| Template | Monitoring method |
| --- | --- |
| [Yeastar P-Series Cloud](Zabbix%20Templates/Yeastar%20P-Series%20Cloud%20by%20HTTP) | Web API |

[Back to contents](#contents)

---

## Zabbix compatibility

Templates are designed and tested with **Zabbix 7.4.x**.

Some templates may also work with earlier or later Zabbix versions, but compatibility is not guaranteed. Check the individual template's README for any specific requirements or compatibility notes.

---

## How to use

1. Select a template from the [catalogue](#available-templates) and read its README.
2. Download its `.yaml` file.
3. Import the file into Zabbix: **Data collection → Templates → Import**.
4. Configure the host interfaces, access permissions and other prerequisites described in the template's README.
5. Configure the required and optional host macros, such as `{$API.USER}` and `{$API.PASSWORD}`, where applicable.
6. Link the template to the host.
7. Verify that the expected items are collecting data correctly, and review any discovery rules and triggers.

Adjust thresholds and optional settings to match your environment.

---

## About this project

E-MSN uses Zabbix in real-world production environments to monitor a wide range of IT infrastructure equipment.

The templates published in this repository are designed to be:

- Easy to import
- Based on standard MIBs or documented vendor APIs whenever possible
- Delivered with clear and practical dashboards
- Suitable for production monitoring
- Useful as a base for customization

Most templates published here started from an existing template found during our research: forums, GitHub repositories, official templates or templates shared by the Zabbix community.

Some templates are fairly generic and have been tested on several devices, such as Lenovo XCC or Alcatel switches. Others are more specific because we did not always have access to enough different hardware models to validate them broadly.

As a result, these templates may not perfectly match the exact model you are looking for. However, they should provide a solid starting point for your own monitoring setup.

---

## Disclaimer

These templates are provided by E-MSN to help the Zabbix community. They are provided **as-is, without warranty of any kind**.

Always test templates in a non-production environment before deploying them widely.

Some devices may expose different SNMP OIDs, API fields or values depending on the model, firmware version or hardware revision. Adjust thresholds, macros and triggers according to your environment.

---

## License

See the [LICENSE](LICENSE) file for license information.

---

## About E-MSN

E-MSN provides IT infrastructure, monitoring and managed services.

This repository is part of E-MSN's contribution to the open-source and monitoring community.

[![Email](https://img.shields.io/badge/Email-contact%40e--msn.fr-00698E?style=flat-square)](mailto:contact@e-msn.fr)
[![Website](https://img.shields.io/badge/Website-www.e--msn.fr-00698E?style=flat-square)](https://www.e-msn.fr)
[![Phone](https://img.shields.io/badge/Phone-%2B33%204%2048%2027%2003%2045-00698E?style=flat-square)](tel:+33448270345)

[Back to contents](#contents)

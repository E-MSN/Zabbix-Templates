# E-MSN Zabbix Templates
Community Zabbix templates maintained and shared by **E-MSN**.<br>
This repository provides ready-to-use Zabbix templates for monitoring many different devices through SNMP, API or agent-based checks.<br>
The goal of this project is to make practical, tested and reusable Zabbix templates available to the community.

Most templates published here started from an existing template found somewhere on the Internet during our research: forums, GitHub repositories, official templates, or templates shared by the Zabbix community.<br>
Some templates are fairly generic and have been tested on several devices, such as Lenovo XCC or Alcatel switches. Others are more specific, simply because we did not always have access to enough different hardware models to validate them broadly.<br>
As a result, these templates may not perfectly match the exact model you are looking for. However, they should still provide a solid starting point for your own monitoring setup.

---

## About this project
E-MSN uses Zabbix in real-world production environments to monitor a wide range of IT infrastructure equipment.<br>
The templates published in this repository are designed to be:
- Easy to import
- Based on standard MIBs or documented vendor APIs whenever possible
- Delivered with clear and practical dashboards
- Suitable for production monitoring
- Useful as a base for customization

---

## Available templates
Templates are organized by vendor name and are named using the following convention: **"Vendor Device by Method"**.<br>
Available templates:
- Network switches
- WiFi Access Points
- Servers and management controllers
- Storage systems
- UPS devices
- NVR devices

Each template directory should contain:
- Templates in YAML format
- README file
- Screenshots

---

## Zabbix compatibility
Templates are designed and tested with Zabbix 7.4.x<br>
Some templates may also work with earlier or later Zabbix versions, but compatibility is not guaranteed.

---

## How to use
1. Download the .yaml file from the repository
2. Import into Zabbix (Data collection → Templates → Import)
3. Configure required and optionnal host macros (for example: {$API.USER} and {$API.PASSWORD})
4. Link the template to a host
5. Verify collected data (make sure the expected items are collecting values correctly)

---

## Disclaimer
These templates are provided by E-MSN to help the Zabbix community.<br>
They are provided as-is, without warranty of any kind.<br>
Always test templates in a non-production environment before deploying them widely.<br>
Some devices may expose different SNMP OIDs, API fields or values depending on the model, firmware version or hardware revision.<br>
Adjust thresholds, macros and triggers according to your environment.

---

## License
See the LICENSE file for license information.

---
## About E-MSN
E-MSN provides IT infrastructure, monitoring and managed services.<br>
This repository is part of E-MSN’s contribution to the open-source and monitoring community.

[![Email](https://img.shields.io/badge/Email-contact%40e--msn.fr-00698E?style=flat-square)](mailto:contact@e-msn.fr)
[![Website](https://img.shields.io/badge/Website-www.e--msn.fr-00698E?style=flat-square)](https://www.e-msn.fr)
[![Phone](https://img.shields.io/badge/Phone-%2B33%204%2048%2027%2003%2045-00698E?style=flat-square)](tel:+33448270345)


# Template Lenovo ThinkSystem DB610S FC SAN Switch by SNMP
## Source
This template is based on the built-in Zabbix template *Brocade FC by SNMP*.<br>

## Compatibility
This template is designed for monitoring Lenovo ThinkSystem DB610S Fibre Channel SAN switches (based on Brocade Fabric OS) via SNMP.<br>
It has been tested on the following models:
- Lenovo ThinkSystem DB610S

## Usage
Import template as usual: **Data Collection -> Templates -> Import**<br>
Add your FC switch using SNMPv3, then adjust the macro values if needed.
> **Note:** This template uses 64-bit counters to monitor network traffic. Although these switches support SNMPv1, its use is not recommended because SNMPv1 does not support these counters.
## Dashboards preview
**Overview:**
![Overview](./images/Overview.png)
**Network:**
![Network](./images/Network.png)
**Fibre Channel:**
![Fibre Channel](./images/Fibre%20Channel.png)

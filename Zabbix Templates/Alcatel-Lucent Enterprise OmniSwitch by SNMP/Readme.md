# Template Alcatel-Lucent Enterprise OmniSwitch by SNMP
## Source
This template is based on original templates written by Alexander Bakaldin.<br>
https://github.com/zabbix/community-templates/tree/main/Network_Devices/Alcatel-Lucent_Enterprise/template_alcatel-lucent_enterprise_omniswitch_aos_release_6.x<br>
https://github.com/zabbix/community-templates/tree/main/Network_Devices/Alcatel-Lucent_Enterprise/template_alcatel-lucent_enterprise_omniswitch_aos_release_8.x
## Compatibility
This template is designed for monitoring Alcatel-Lucent OmniSwitch via SNMP.<br>
It's a unified template (1 template for both AOS v6.x and AOS v8.x).<br>
It has been tested on the following models:
- Alcatel OmniSwitch v6:
  - OS6250 series
  - OS6350 series
  - OS6450 series
- Alcatel OmniSwitch v8:
  - OS2220 series
  - OS2260 series
  - OS6360 series
  - OS6560 series 
  - OS6860 series
## Usage
Import template as usual: **Data Collection -> Templates -> Import**<br>
Add your switch using **SNMPv2** or **SNMPv3**, then adjust the macro values if needed.
## Dashboards preview
**Overview:**
![Overview](./images/Overview.png)
**Port Speed:**
![Port Speed](./images/Port%20Speed.png)
**Network Traffic:**
![Network Traffic](./images/Network%20Traffic.png)
**Network errors:**
![Network errors](./images/Network%20errors.png)
**PoE (when applicable):**
![PoE](./images/PoE.png)

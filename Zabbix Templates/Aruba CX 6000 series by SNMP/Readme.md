# Template Aruba CX 6000 series by SNMP
## Source
This template is based on the built-in Zabbix template *Aruba CX 8300s by SNMP*.<br>
## Compatibility
This template is designed for monitoring Aruba CX 6000 series via SNMP.<br>
It has been tested with firmware versions PL.10.14.x through PL.10.16.x and validated on the following models:
- CX 6100 (JL675A and JL676A)
- CX 6300M (JL658A)
## Usage
Import template as usual: **Data Collection -> Templates -> Import**<br>
Add your switch using **SNMPv2** or **SNMPv3**, then adjust the macro values if needed.<br>
> **Note:** If you are using VSF, you must set the `{$ARUBA.VSF.MEMBERS.MIN}` macro to the expected number of VSF members for the trigger to work correctly.
## Dashboards preview
**Overview:**
![Overview](./images/Overview.png)
**Port Speed:**
![Port Speed](./images/Port%20Speed.png)
**LAG (when applicable):**
![LAG](./images/LAG.png)
**Network Traffic:**
![Network Traffic](./images/Network%20Traffic.png)
**PoE (when applicable):**
![PoE](./images/PoE.png)
**VSF (when applicable):**
![VSF](./images/VSF.png)
**VSX (when applicable):**
![VSX](./images/VSX.png)

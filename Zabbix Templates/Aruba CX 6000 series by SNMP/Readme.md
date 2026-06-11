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
<img width="1872" height="1779" alt="image" src="https://github.com/user-attachments/assets/5dd0fb97-5fb9-4bc5-bc96-d87b03c82119" />
**Port Speed:**
<img width="1872" height="729" alt="image" src="https://github.com/user-attachments/assets/0a0c1ba3-e5bf-4daf-b69f-df1a4f4e1ec0" />
**LAG (when applicable):**
<img width="1872" height="446" alt="image" src="https://github.com/user-attachments/assets/ea57bcf5-9ef3-450d-b84c-1661490c12fc" />
**Network Traffic:**
<img width="1872" height="2547" alt="image" src="https://github.com/user-attachments/assets/50bd9d91-ce92-40c0-808b-11111d6451db" />
**PoE (when applicable):**
<img width="1872" height="3501" alt="image" src="https://github.com/user-attachments/assets/591fcdb0-79b2-4ca8-bda8-5348759a81ce" />
**VSF (when applicable):**
<img width="1866" height="631" alt="image" src="https://github.com/user-attachments/assets/7ecfcae1-d509-480f-8647-e39d19569318" />
**VSX (when applicable):**
<img width="1872" height="1190" alt="image" src="https://github.com/user-attachments/assets/4aee4cf2-c7eb-42b7-be36-7aa1dc565a41" />

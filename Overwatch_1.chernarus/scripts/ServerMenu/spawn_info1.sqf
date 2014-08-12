// Displays server info

// WARNING!! If you want to change the amount of info rows in here, you have to know what you are doing.

_info1 = format["Server Admin"];
_info1sub = format["|SERE|Admin"];
_info2 = format["Server Moderators"];
_info2sub = format["|SERE| IanKiller99, |SERE| Kitsune"];
_info3 = format["Server Name"];
_info3sub = format["SERE DayZ Overwatch"];
_info4 = format["Server IP"];
_info4sub = format["93.158.211.139"];
_info5 = format["Website"];
_info5sub = format["SERE-DAYZ.ENJIN.COM"];
_info6 = format["Donations"];
_info6sub = format["Donate @ SERE-DAYZ.ENJIN.COM and see the Donations information in this Server Info Menu"];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %11 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %12 </t>", _info1, _info1sub, _info2, _info2sub, _info3, _info3sub, _info4, _info4sub, _info5, _info5sub, _info6, _info6sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
// Displays server rules

// WARNING!! If you want to change the amount of rules you have to know what you are doing.

_rule1 = format["RULE #11"];
_rule1sub = format["Base Rule: No building bases outside of map area!"];
_rule2 = format["RULE #12"];
_rule2sub = format["Base Rule: Max of 20 vehicles per base!"];
_rule3 = format["RULE #13"];
_rule3sub = format["Base Rule: Do not kill your own AI Base Defenders!"];
_rule4 = format["RULE #14"];
_rule4sub = format["Base Rule: All base locations need to be registered with Admin or risk being deleted."];
_rule5 = format["RULE #15"];
_rule5sub = format["Have Fun!"];
_rule6 = format["RULE #16"];
_rule6sub = format[""];
_rule7 = format["RULE #17"];
_rule7sub = format[""];
_rule8 = format["RULE #18"];
_rule8sub = format[""];
_rule9 = format["RULE #19"];
_rule9sub = format[""];
_rule10 = format["Punishment for breaking a rule:"];
_rule10sub = format["Temporary ban for two days. After three temporary bans you will be permanently banned."];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %11 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %12 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %13 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %14 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %15 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %16 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %17 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %18 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %19 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %20 </t>", _rule1, _rule1sub, _rule2, _rule2sub, _rule3, _rule3sub, _rule4, _rule4sub, _rule5, _rule5sub, _rule6, _rule6sub, _rule7, _rule7sub, _rule8, _rule8sub, _rule9, _rule9sub, _rule10, _rule10sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
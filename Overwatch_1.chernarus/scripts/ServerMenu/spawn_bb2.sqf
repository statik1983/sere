// Displays Base Building guide

// WARNING!! If you want to change the amount of tips you have to know what you are doing.

_tip6 = format["AI Defence"];
_tip6sub = format["AI defence is automatic, once you build a flag your AI defenders will spawn. The more buildings in your base the more AI defenders will spawn. AI defenders will only attack players not added to your Base Flag."];
_tip7 = format["Base Gate"];
_tip7sub = format["Build a base gate with an Infostand (keypad). Do not stack concrete walls on top of each other. Keypads have a 15 Meter radius affect on any wall within its radius. Only members of your Base Flag can access your gate."];
_tip8 = format["Base Roof"];
_tip8sub = format["Build a base roof with Land_Ind_SawMillPen and Infostand (keypad). Keypads have a 15 Meter radius affect on any wall within its radius. Only members of your Base Flag can access your roof."];
_tip9 = format["Booby Trap"];
_tip9sub = format["The Booby Trap does not require a Base Flag. This means you can build booby traps at other people bases. The Booby Trap will always be placed just above the ground. You can attempt to disarm a Booby Trap if you have a Tool Box."];
_tip10 = format["Destroyable"];
_tip10sub = format["Pay attention to the picture of the building object to see if it destroyable or not. Most buildings can be destroyed, but will respawn after restart."];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t>", _tip6, _tip6sub, _tip7, _tip7sub, _tip8, _tip8sub, _tip9, _tip9sub, _tip10, _tip10sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
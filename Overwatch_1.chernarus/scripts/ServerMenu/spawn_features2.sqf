// Displays features guide

// WARNING!! If you want to change the amount of tips you have to know what you are doing.

_tip6 = format["Smelting"];
_tip6sub = format["Items you can create: Wire Kit, Wind Screen Glass, Tank Trap, Scrap Metal, Sand Bag, Fuel Tank, and Engine Parts. Required items to smelt: Fire pit or burning barrel, Tool Box, Filled Water Bottle, and additional specific items.  See smelting menu for specific ingredients."];
_tip7 = format["AI Patrols"];
_tip7sub = format["AI come as Bandits, Survivors, and Soldiers. AI will have rare weapons, rare clothing, and a chance to have Scrap Electronics and Floppy Cable"];
_tip8 = format["Humanity"];
_tip8sub = format["Humanity determines if you are a bandit, survivor, or hero. Bandit player < -2500 humanity, Hero player > 5000 humanity. Bandit players have a red name, and will be attacked by all AI. Hero players have a blue name and will only be attacked by bandit AI. Bandit and Hero players get custom skins and increased stats. To increase your humanity only kill bandit players and bandit AI, give blood transfusions, or wait for your humanity to automatically go up."];
_tip9 = format["Suggest A Guide"];
_tip9sub = format["??"];
_tip10 = format["Suggest A Guide"];
_tip10sub = format["??"];
_tip11 = format["Suggest A Guide"];
_tip11sub = format["??"];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t>", _tip6, _tip6sub, _tip7, _tip7sub, _tip8, _tip8sub, _tip9, _tip9sub, _tip10, _tip10sub, _tip11, _tip11sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
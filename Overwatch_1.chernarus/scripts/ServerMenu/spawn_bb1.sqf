// Displays Base Building guide

// WARNING!! If you want to change the amount of tips you have to know what you are doing.

_tip1 = format["Base Building Ingredients"];
_tip1sub = format["Tank trap kit, Wire Fencing kit, Sandbags, Wood, Scrap electronics, Frag grenade, Wooden Crate, Wooden Pallet, Rope, Scrap metal, Camo Net, Bricks, Generator, Jerry Can, Nails, Metal Sheet, Duck Tape, Glass"];
_tip2 = format["Where Can I Find The Ingredients?"];
_tip2sub = format["Best places to find these are in industrial cities like Cherno, Elektro, berezino but also the factory at polana or the factory at zelenogorsk are very good for finding these materials. The hangars at the airfields are also wealthy of some of these items. All other items can be found from AI Missions and Air Drops."];
_tip3 = format["Build Menu"];
_tip3sub = format["Have one of any ingredient in your inventory to see build menu. x/x The left number is how many you have, and the right number is how many you need. ONLY HAVE EXACT INGREDIENTS FOR WHAT YOU WANT TO BUILD IN YOUR INVENTORY, NOTHING EXTRA."];
_tip4 = format["Base Flag"];
_tip4sub = format["Most buildings require a Base Flag. You must first build a Base Flag. Base Flags have a allowable building radius of 200 Meters. Only members of the Base Flag can build within the radius of the Base Flag. Players can only be assigned to two Base Flags. Look at Base Flag to bring up menu, add players UID to base flag to give them building access."];
_tip5 = format["Player UID"];
_tip5sub = format["You can find your player UID by looking at your profile information in the Arma 2 game menu.  You can get a players UID by looking at them while next to flag and scrolling to bring up menu option."];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t>", _tip1, _tip1sub, _tip2, _tip2sub, _tip3, _tip3sub, _tip4, _tip4sub, _tip5, _tip5sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
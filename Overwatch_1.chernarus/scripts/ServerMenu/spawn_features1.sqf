// Displays features guide

// WARNING!! If you want to change the amount of tips you have to know what you are doing.

_tip1 = format["Air Drops"];
_tip1sub = format["Air drops can be called from the NE air field control tower, NW air field control tower, Balota field control tower, military base, and bandit base. To call air drop you need Scrap Electronics, Floppy Wire, Toolbox, and GPS. Fix the laptop, then wait to call either a random weapons box, or a supply box."];
_tip2 = format["Anti-Zombie Emitter"];
_tip2sub = format["The Anti-Zombie Emitter can be built any where. It has a time limit of 30 minutes, and has a radius range of 50 meters. Required ingredients: Scrap Electronics, Floppy Wire, Engine, Jerrycan, and Tool Box"];
_tip3 = format["AI Missions"];
_tip3sub = format["Green AI Missions are small, Yellow AI Missions are medium, and Red AI Missions are hard. Complete an AI Mission by killing all enemy AI and being close to one of the objects. AI Missions spawn randomly.  Rare building supplies and weapons are found from AI Missions."];
_tip4 = format["Auto Refuel"];
_tip4sub = format["Park your vehicle next to a gas tank, then get out of vehicle and look at your vehicle to bring up the menu option for Auto Refuel."];
_tip5 = format["Tow & Lift"];
_tip5sub = format["You can only tow planes and heli's.  With only large heli's, hover 8 Meters above a ground vehicle to lift. At 8 Meters you will see the menu option to lift, at 12 Meters you will see the menu option to drop."];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t>", _tip1, _tip1sub, _tip2, _tip2sub, _tip3, _tip3sub, _tip4, _tip4sub, _tip5, _tip5sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
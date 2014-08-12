// Displays donation info

// WARNING!! If you want to change the amount of info rows in here, you have to know what you are doing.

_info1 = format["Donation Info"];
_info1sub = format["Donations are in U.S. Dollars.  All donation rewards are per month expect for donations for specific vehicle or weapons."];

_info2 = format["Storage Crate"];
_info2sub = format["$10 a month = A large Storage create in location of your choice. Capacity of Storage Crate is unlimited amount of 80 different types of items. Unfortunately the Inventory capacity is not visible."];

_info3 = format["Storage SUV"];
_info3sub = format["$20 a month = A black Armoured SUV with Minigun. Inventory capacity is 5,000 / 20,000 / 2 "];

_info4 = format["Vehicle or Weapons"];
_info4sub = format["$5 = Vehicle or Weapon of your choice"];

_info5 = format["Custom Loadout"];
_info5sub = format["$10 - $20 a month = Custom loadout of your choice. Price depends on custom loadout."];

_info6 = format["Base Building Supply Box"];
_info6sub = format["$10 = Base building supply airdrop containing: 10x Tank trap, 10x Scrap Electronics, 10x Sand Bag, 10x Rope, 10x Camo Net, 10x Glass, 10x Scrap Metal, 10x Duct Tape, 10x Nails, 10x Wire Fence Kit, 10x Wood Pile, 10x Crate, 10x Pallet, 10x Metal Sheet, 10x Brick, 5x Generator, 5x Grenade, 5x Jerry Can"];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %11 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %12 </t>", _info1, _info1sub, _info2, _info2sub, _info3, _info3sub, _info4, _info4sub, _info5, _info5sub, _info6, _info6sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;
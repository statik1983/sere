// Script: smelt_scrapmetal.sqf
// Author: piggd
// Revision: 2.1
// Date: 05022013
//  Smelting is based on the boil code in standard dayz.  Modified by piggd to smelt cans into scrap metal. Modified to accomodate items in Chernaus.

private["_hasboiledbottleitem","_hasbottleitem","_itemsremoved","_hastinitem","_bottletext","_item1text","_item2text","_item3text","_item4text","_item5text","_parttext","_itemtext","_itemqty","_item1qty","_item2qty","_item3qty","_item4qty","_item5qty","_itemsreq","_dis","_sfx"];
player removeAction s_player_smelt_scrapmetal;
s_player_smelt_scrapmetal = -1;

_hasbottleitem = "ItemWaterbottle" in magazines player;
_hasboiledbottleitem = "ItemWaterbottleBoiled" in magazines player;
_hastinitem = false;
_item1qty = {_x == "TrashTinCan"} count magazines player;
_item2qty = {_x == "ItemSodaEmpty"} count magazines player;
_item3qty = {_x == "ItemSodaCokeEmpty"} count magazines player;
_item4qty = {_x == "ItemSodaPepsiEmpty"} count magazines player;
_item5qty = {_x == "ItemSodaMdewEmpty"} count magazines player;
_itemqty = _item1qty +_item2qty +_item3qty +_item4qty +_item4qty;
// The required can quanity must be between low enough to accomodate the invenotry max.
_itemsreq = 6;
_itemsremoved = 0;
if ( _hasboiledbottleitem ) then {
		_hasbottleitem = true;
};
 if (_itemqty >= _itemsreq) then {
    _hastinitem = true;
 };

_bottletext = getText (configFile >> "CfgMagazines" >> "ItemWaterbottle" >> "displayName");
_item1text = getText (configFile >> "CfgMagazines" >> "TrashTinCan" >> "displayName");
_item2text = getText (configFile >> "CfgMagazines" >> "ItemSodaEmpty" >> "displayName");
_item3text = getText (configFile >> "CfgMagazines" >> "ItemSodaCokeEmpty" >> "displayName");
_item4text = getText (configFile >> "CfgMagazines" >> "ItemSodaPepsiEmpty" >> "displayName");
_item5text = getText (configFile >> "CfgMagazines" >> "ItemSodaMdewEmpty" >> "displayName");
_itemtext = format["%1 of %2 %3 / %4 / %5 / %6 / %7 required",_itemqty,_itemsreq,_item1text,_item2text,_item3text,_item4text,_item5text];
_parttext = getText (configFile >> "CfgMagazines" >> "PartGeneric" >> "displayName");
if (!_hasbottleitem) exitWith {cutText [format[(localize "str_player_31"),_bottletext,"smelt"] , "PLAIN DOWN"]};
if (!_hastinitem) exitWith {cutText [format[(localize "str_player_31"),_itemtext,"smelt"] , "PLAIN DOWN"]};

if (_hasbottleitem and _hastinitem) then {
        player playActionNow "Medic";
        sleep 1;
        _dis=10;
        _sfx = "cook";
        [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
        [player,_dis,true,(getPosATL player)] spawn player_alertZombies;

        sleep 5;
		if ( _hasboiledbottleitem ) then {
			player removeMagazine "ItemWaterbottleBoiled";
		 } else {
			player removeMagazine "ItemWaterbottle";
		};
		for "_x" from 1 to _itemsreq do {
		
			if (_x <= _item1qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "TrashTinCan";
				_itemsremoved = _itemsremoved + 1;
			};	
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item2qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item3qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaCokeEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item4qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaPepsiEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		for "_x" from 1 to _itemsreq do {
      
			if (_x <= _item5qty and _itemsremoved < _itemsreq) then {
				player removeMagazine "ItemSodaMdewEmpty";
				_itemsremoved = _itemsremoved + 1;
			};
		};
		sleep 5;		
		player addMagazine "ItemWaterbottleUnfilled";
        player addMagazine "PartGeneric";
        cutText [format[(localize  "str_build_01"),_parttext], "PLAIN DOWN"];
} else {
        cutText [format[(localize  "str_build_failed_01"),_parttext], "PLAIN DOWN"];
};
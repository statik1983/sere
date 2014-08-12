// Script: smelt_tanktrap.sqf
// Author: piggd
// Revision: 2.1
// Date: 04252013
//  Smelting is based on the boil code in standard dayz.  Modified by piggd to smelt one item into another.

private["_hasboiledbottleitem","_hasbottleitem","_itemsremoved","_hasitems","_bottletext","_item1text","_parttext","_itemtext","_waterbottleqty","_item1qty","_itemsreq","_dis","_sfx"];
player removeAction s_player_smelt_tanktrap;
s_player_smelt_tanktrap = -1;


_hasbottleitem = "ItemWaterbottle" in magazines player;
_hasboiledbottleitem = "ItemWaterbottleBoiled" in magazines player;
_hasitems = false;
_item1qty = {_x == "PartGeneric"} count magazines player;
// The required item quanity must be between 1 to 3 due to inventory constraints. 1 WB and 3 itens is max.
_itemsreq = 1;
_itemsremoved = 0;
if ( _hasboiledbottleitem ) then {
		_hasbottleitem = true;
};
 if (_item1qty >= _itemsreq) then {
    _hasitems = true;
 };

_bottletext = getText (configFile >> "CfgMagazines" >> "ItemWaterbottle" >> "displayName");
_item1text = getText (configFile >> "CfgMagazines" >> "PartGeneric" >> "displayName");
_itemtext = format["%1 of %2 %3 required",_item1qty,_itemsreq,_item1text];
_parttext = getText (configFile >> "CfgMagazines" >> "ItemTankTrap" >> "displayName");
if (!_hasbottleitem) exitWith {cutText [format[(localize "str_player_31"),_bottletext,"smelt"] , "PLAIN DOWN"]};
if (!_hasitems) exitWith {cutText [format[(localize "str_player_31"),_itemtext,"smelt"] , "PLAIN DOWN"]};

if (_hasbottleitem and _hasitems) then {
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
				player removeMagazine "PartGeneric";
				_itemsremoved = _itemsremoved + 1;
			};
		};
sleep 5;		
		player addMagazine "ItemWaterbottleUnfilled";
        player addMagazine "ItemTankTrap";
        cutText [format[(localize  "str_build_01"),_parttext], "PLAIN DOWN"];
} else {
        cutText [format[(localize  "str_build_failed_01"),_parttext], "PLAIN DOWN"];
};
// Script: smelt_sandbag.sqf
// Author: piggd
// Revision: 2.0
// Date: 04252013
//  Smelting is based on the boil code in standard dayz.  Modified by piggd to smelt one item into another. The reason I included heat pack is so that there is a guaranteed invtory slot
// to put the sandbag into.

private["_hasboiledbottleitem","_hasbottleitem","_itemsremoved","_hasitems","_hasitems2","_bottletext","_item1text","_parttext","_item2text","_itemtext","_item2qty","_item1qty","_itemsreq","_items2req","_dis","_sfx"];
player removeAction s_player_smelt_sandbag;
s_player_smelt_sandbag = -1;

_hasbottleitem = "ItemWaterbottle" in magazines player;
_hasboiledbottleitem = "ItemWaterbottleBoiled" in magazines player;
_hasitems = false;
_hasitems2 = false;
_item1qty = {_x == "ItemBandage"} count magazines player;
_item2qty = {_x == "ItemHeatPack"} count magazines player;
//
// The required item quanity must be between less than the 12 slot invenotry requirement
_itemsreq = 5;
_items2req = 1;
_itemsremoved = 0;
if ( _hasboiledbottleitem ) then {
		_hasbottleitem = true;
};
 if (_item1qty >= _itemsreq) then {
    _hasitems = true;
 };

 if (_item2qty >= _items2req) then {
    _hasitems2 = true;
 };

_bottletext = getText (configFile >> "CfgMagazines" >> "ItemWaterbottle" >> "displayName");
_item1text = getText (configFile >> "CfgMagazines" >> "ItemBandage" >> "displayName");
_item2text = getText (configFile >> "CfgMagazines" >> "ItemHeatPack" >> "displayName");
_itemtext = format["%1 of %2 %3 / %4 of %5 %6 required",_item1qty,_itemsreq,_item1text,_item2qty,_items2req,_item2text];
_parttext = getText (configFile >> "CfgMagazines" >> "ItemSandbag" >> "displayName");
if (!_hasbottleitem) exitWith {cutText [format[(localize "str_player_31"),_bottletext,"smelt"] , "PLAIN DOWN"]};
if (!_hasitems) exitWith {cutText [format[(localize "str_player_31"),_itemtext,"smelt"] , "PLAIN DOWN"]};
if (!_hasitems2) exitWith {cutText [format[(localize "str_player_31"),_itemtext,"smelt"] , "PLAIN DOWN"]};

if (_hasbottleitem and _hasitems and _hasitems2) then {
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
				player removeMagazine "ItemBandage";
				_itemsremoved = _itemsremoved + 1;
			};
		};	
		_itemsremoved = 0;
		for "_x" from 1 to _items2req do {
		
			if (_x <= _item2qty and _itemsremoved < _items2req) then {
				player removeMagazine "ItemHeatPack";
				_itemsremoved = _itemsremoved + 1;
			};	
		};
		sleep 5;		
		player addMagazine "ItemWaterbottleUnfilled";
        player addMagazine "ItemSandbag";
        cutText [format[(localize  "str_build_01"),_parttext], "PLAIN DOWN"];
} else {
        cutText [format[(localize  "str_build_failed_01"),_parttext], "PLAIN DOWN"];
};
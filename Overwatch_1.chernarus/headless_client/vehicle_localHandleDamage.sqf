/***********************************************************
Local damage for sarge vehicles using dayz code
************************************************************/
private["_object_damage","_unit","_selection","_strH","_dam","_total","_damage","_needUpdate"];
_unit = _this select 0;
_selection = _this select 1;
_total = _this select 2;
_dam = _unit getVariable["totalDmg",0];
_needUpdate = _unit getVariable["needUpdate",false];

_object_damage = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
	_hitpoints = _object call vehicle_getHitpoints;
	_damage = damage _object;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_object setHit ["_selection", _hit]
	} forEach _hitpoints;
	_object setVariable ["needUpdate",false,true];
};

_object_killed = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
	_hitpoints = _object call vehicle_getHitpoints;
	_damage = damage _object;
	_array = [];
	{
		_hit = [_object,_x] call object_getHit;
		_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
		if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
		_hit = 1;
		_object setHit ["_selection", _hit]
	} forEach _hitpoints;
	_damage = 1;
};
if (_dam < 1 ) then {
	if ( (_selection != "") ) then {
        	_strH = "hit_" + (_selection);
	} else {
        	_strH = "totalDmg";
	};
	if (_total > 0.98) then {
        	_total = 1;
	};
	if ( _total>0 ) then {
        	_unit setVariable [_strH,_total,true];
		if ( !_needUpdate ) then {
			_unit setVariable ["needUpdate",true,true];
			call _object_damage;
		};
	};
	
};
_total
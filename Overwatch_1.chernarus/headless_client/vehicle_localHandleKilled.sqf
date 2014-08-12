private["_object_killed","_unit","_hitPoints","_selection","_killer"];

_unit = _this select 0;
_killer = _this select 1;
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
_hitPoints = _unit call vehicle_getHitpoints;
{
	_selection = getText (configFile >> "CfgVehicles" >> (typeof _unit) >> "HitPoints" >> _x >> "name");
	_unit setVariable [_selection, 1, true];
} forEach _hitPoints;

//["dayzUpdateVehicle",[_unit, "damage"]] call callRpcProcedure;
call _object_killed;

_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "GetOut";
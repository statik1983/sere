if (TOWING_local_lock) then
{
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	
	private ["_remorqueur", "_object"];
	
	_object = _this select 0;
	_remorqueur = _object getVariable "TOWING_transportedBy";
	
	if ({_remorqueur isKindOf _x} count TOWING_capableVehicles > 0) then {
		_remorqueur setVariable ["TOWING_towedObj", objNull, true];
		_object setVariable ["TOWING_transportedBy", objNull, true];
		
		detach _object;
		_object setVelocity [0, 0, 0];
		
		player playMove "AinvPknlMstpSlayWrflDnon_medic";
		sleep 7;
		
		if ({_object isKindOf _x} count TOWING_playerLiftableObjects > 0) then {if (isNull (_remorqueur getVariable "TOWING_towedObj") &&(isNull (_object getVariable "TOWING_transportedBy")) &&(isNull (_object getVariable "TOWING_isMovedBy"))) then {[_object] execVM "DamiMods\Lift\TOWandLIFT\veh_lifting\move.sqf";};} else {_txt = "Object untowed.";cutText [_txt,"PLAIN DOWN"];systemChat ("Tow&Lift: "+str _txt+"");};
	} else {
		_txt = "Only the pilot can untow this object.";
		cutText [_txt,"PLAIN DOWN"];
		systemChat ("Tow&Lift: "+str _txt+"");
	};
	
	TOWING_local_lock = false;
};
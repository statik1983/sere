if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	private ["_helicarrier", "_object"];
	_helicarrier = _this select 0;
	_object = _helicarrier getVariable "Tow_settings_heliporte";
	_helicarrier setVariable ["Tow_settings_heliporte", objNull, true];
	_object setVariable ["TOWING_transportedBy", objNull, true];
	
	detach _object;
	
	_object setPos [getPos _object select 0, getPos _object select 1, 0];
	_object setVelocity [0, 0, 0];
	
	_txt = format ["Dropping %1...", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
	TOWING_local_lock = false;
};
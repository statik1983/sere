if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	TOWING_objectSelected = objNull;
	private ["_object", "_est_calculateur", "_arme_principale", "_action_menu", "_azimut_canon"];
	
	_object = _this select 0;
																											
	_object setVariable ["TOWING_isMovedBy", player, true];
	TOWING_objMoveAttempt = _object;
	_arme_principale = primaryWeapon player;
	if (_arme_principale != "") then {
		player playMove "AidlPercMstpSnonWnonDnon04";
		sleep 2;
		player removeWeapon _arme_principale;
	} else {
		sleep 0.5;
	};

	if (!alive player) exitWith
	{
		TOWING_objMoveAttempt = objNull;
		_object setVariable ["TOWING_isMovedBy", objNull, true];
		_object setPos [getPos _object select 0, getPos _object select 1, 0];
		_object setVelocity [0, 0, 0];
		TOWING_local_lock = false;
	}
	_object attachTo [player, [0,(((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1,1]];

	if (count (weapons _object) > 0) then {
		_azimut_canon = ((_object weaponDirection (weapons _object select 0)) select 0) atan2 ((_object weaponDirection (weapons _object select 0)) select 1);
		PVOZ_setDirection_TOW = [_object, (getDir _object)-_azimut_canon];
		if (isServer) then {
			["PVOZ_setDirection_TOW", PVOZ_setDirection_TOW] spawn DAMI_TOWING_setDirection;
		} else {
			publicVariableServer "PVOZ_setDirection_TOW";
		};
	};
	
	TOWING_local_lock = false;
	_action_menu = player addAction [("<t color=""#dddd00"">" + "Release the object" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_lifting\release.sqf", nil, 5, true, true];
	while {!isNull TOWING_objMoveAttempt && alive player} do {
		if (vehicle player != player) then {
			_txt = "You are carrying an object!";
			systemChat ("Tow&Lift: "+str _txt+"");
			player playMove "AmovPpneMstpSnonWnonDnon";
			player action ["eject", vehicle player];
			sleep 1;
		};
		if ([0,0,0] distance (velocity player) > 2.8) then {
			_txt = "Moving too fast!";
			systemChat ("Tow&Lift: "+str _txt+"");
			player playMove "AmovPpneMstpSnonWnonDnon";
			sleep 1;
		};
		sleep 0.25;
	};
	
	//Exit loop
	detach _object;
	_object setPos [getPos _object select 0, getPos _object select 1, 0];
	_object setVelocity [0, 0, 0];

	player removeAction _action_menu;
	TOWING_objMoveAttempt = objNull;
	_object setVariable ["TOWING_isMovedBy", objNull, true];

	if (alive player && _arme_principale != "") then {
		player addWeapon _arme_principale;
		player selectWeapon _arme_principale;
		player selectWeapon (getArray (configFile >> "cfgWeapons" >> _arme_principale >> "muzzles") select 0);
	};
};
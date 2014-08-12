if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	private ["_helicarrier", "_object"];
	_helicarrier = _this select 0;
	_object = nearestObjects [_helicarrier, LIFTING_liftableObjects, 20];
	_object = _object - [_helicarrier];
	
	if (count _object > 0) then {
		_object = _object select 0;
		if !(_object getVariable "Tow_settings_disabled") then {
			if (isNull (_object getVariable "TOWING_transportedBy")) then {
				if !(isPlayer (driver _object)) then {
					if (isNull (_object getVariable "TOWING_isMovedBy") || (!alive (_object getVariable "TOWING_isMovedBy"))) then {
						private ["_now_TowedChk", "_remorque"];
						_now_TowedChk = true;
						_remorque = _object getVariable "TOWING_towedObj";
						if !(isNil "_remorque") then {if !(isNull _remorque) then {_now_TowedChk = false;};};
						if (_now_TowedChk) then {
							_helicarrier setVariable ["Tow_settings_heliporte", _object, true];
							_object setVariable ["TOWING_transportedBy", _helicarrier, true];
							_object attachTo [_helicarrier, [0,0,(boundingBox _helicarrier select 0 select 2) - (boundingBox _object select 0 select 2) - (getPos _helicarrier select 2) + 0.5]];
							
							_txt = format ["""%1"" has been attached.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
							cutText [_txt,"PLAIN DOWN"];
							systemChat ("Tow&Lift: "+str _txt+"");
						} else {
							_txt = format ["""%1"" is currently towing a vehicle!", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
							cutText [_txt,"PLAIN DOWN"];
							systemChat ("Tow&Lift: "+str _txt+"");
						};
					} else {
						_txt = format ["""%1"" is already being moved by another player.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
						cutText [_txt,"PLAIN DOWN"];
						systemChat ("Tow&Lift: "+str _txt+"");
					};
				} else {
					_txt = format ["""%1"" is currently being driven by another player.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
					cutText [_txt,"PLAIN DOWN"];
					systemChat ("Tow&Lift: "+str _txt+"");
				};
			} else {
				_txt = format ["""%1"" is currently being towed!", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
				cutText [_txt,"PLAIN DOWN"];
				systemChat ("Tow&Lift: "+str _txt+"");
			};
		};
	};
	
	TOWING_local_lock = false;
};
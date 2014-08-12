if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	private ["_object", "_remorqueur"];
	_object = TOWING_objectSelected;
	_remorqueur = _this select 0;
	
	if (!(isNull _object) && (alive _object) && !(_object getVariable "Tow_settings_disabled")) then {
		if (isNull (_object getVariable "TOWING_transportedBy") && (isNull (_object getVariable "TOWING_isMovedBy") || (!alive (_object getVariable "TOWING_isMovedBy")))) then {
			if (_object distance _remorqueur <= 30) then {
				_remorqueur setVariable ["TOWING_towedObj", _object, true];
				_object setVariable ["TOWING_transportedBy", _remorqueur, true];
				player attachTo [_remorqueur, [(boundingBox _remorqueur select 1 select 0),(boundingBox _remorqueur select 0 select 1) + 1,(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)]];
				player setDir 270;
				player setPos (getPos player);
				player playMove "AinvPknlMstpSlayWrflDnon_medic";
				
				sleep 2;
				
				_object attachTo [_remorqueur, [0,(boundingBox _remorqueur select 0 select 1) + (boundingBox _object select 0 select 1) + 3,(boundingBox _remorqueur select 0 select 2) - (boundingBox _object select 0 select 2)]];
				TOWING_objectSelected = objNull;
				detach player;
				sleep 5;
			} else {
				_txt = format ["""%1"" is too far to be towed to this vehicle.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
				cutText [_txt,"PLAIN DOWN"];
				systemChat ("Tow&Lift: "+str _txt+"");
			};
		}
		else
		{
			hint format ["The object ""%1"" is in transit.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
		};
	};
	
	TOWING_local_lock = false;
};
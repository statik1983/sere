if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	private ["_object", "_remorqueur"];
	_object = TOWING_objMoveAttempt;
	_remorqueur = nearestObjects [_object, TOWING_capableVehicles, 22];
	_remorqueur = _remorqueur - [_object];
	
	if (count _remorqueur > 0) then {
		_remorqueur = _remorqueur select 0;
		if (alive _remorqueur && isNull (_remorqueur getVariable "TOWING_towedObj") && ([0,0,0] distance velocity _remorqueur < 6) && (getPos _remorqueur select 2 < 2) && !(_remorqueur getVariable "Tow_settings_disabled")) then {
			_remorqueur setVariable ["TOWING_towedObj", _object, true];
			_object setVariable ["TOWING_transportedBy", _remorqueur, true];
			player attachTo [_remorqueur, [(boundingBox _remorqueur select 1 select 0),(boundingBox _remorqueur select 0 select 1) + 1,(boundingBox _remorqueur select 0 select 2) - (boundingBox player select 0 select 2)]];
			player setDir 270;
			player setPos (getPos player);
			TOWING_objMoveAttempt = objNull;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			
			sleep 2;
			
			_object attachTo [_remorqueur, [0,(boundingBox _remorqueur select 0 select 1) + (boundingBox _object select 0 select 1) + 3,(boundingBox _remorqueur select 0 select 2) - (boundingBox _object select 0 select 2)]];
			detach player;
			sleep 5;
		};
	};
	TOWING_local_lock = false;
};
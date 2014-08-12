if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	private ["_object", "_classes_transporteurs", "_transporteur", "_i"];
	_object = TOWING_objectSelected;
	_transporteur = _this select 0;
	
	if (!(isNull _object) && !(_object getVariable "Tow_settings_disabled")) then {
		if (isNull (_object getVariable "TOWING_transportedBy") && (isNull (_object getVariable "TOWING_isMovedBy") || (!alive (_object getVariable "TOWING_isMovedBy")))) then {
			private ["_objects_charges", "_chargement_actuel", "_cout_capacite_object", "_chargement_maxi"];
			_objects_charges = _transporteur getVariable "Tow_settings_objects_charges";
			_chargement_actuel = 0;
			{
				for [{_i = 0}, {_i < count TOWING_cargoObjects}, {_i = _i + 1}] do
				{
					if (_x isKindOf (TOWING_cargoObjects select _i select 0)) exitWith
					{
						_chargement_actuel = _chargement_actuel + (TOWING_cargoObjects select _i select 1);
					};
				};
			} forEach _objects_charges;
			_cout_capacite_object = 99999;
			for [{_i = 0}, {_i < count TOWING_cargoObjects}, {_i = _i + 1}] do {
				if (_object isKindOf (TOWING_cargoObjects select _i select 0)) exitWith {
					_cout_capacite_object = (TOWING_cargoObjects select _i select 1);
				};
			};
			_chargement_maxi = 0;
			for [{_i = 0}, {_i < count TOWING_VehiclesWithCargo}, {_i = _i + 1}] do
			{
				if (_transporteur isKindOf (TOWING_VehiclesWithCargo select _i select 0)) exitWith
				{
					_chargement_maxi = (TOWING_VehiclesWithCargo select _i select 1);
				};
			};
			if (_chargement_actuel + _cout_capacite_object <= _chargement_maxi) then {
				if (_object distance _transporteur <= 30) then {
					_objects_charges = _objects_charges + [_object];
					_transporteur setVariable ["Tow_settings_objects_charges", _objects_charges, true];
					_txt = "Loading in progress.";
					cutText [_txt,"PLAIN DOWN"];
					systemChat ("Tow&Lift: "+str _txt+"");
					
					sleep 2;
					
					private ["_nb_tirage_pos", "_position_attache"];
					_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
					_nb_tirage_pos = 1;
					while {(!isNull (nearestObject _position_attache)) && (_nb_tirage_pos < 25)} do
					{
						_position_attache = [random 3000, random 3000, (10000 + (random 3000))];
						_nb_tirage_pos = _nb_tirage_pos + 1;
					};
					_object attachTo [PVOZ_TOWandLIFT_temphpad, _position_attache];
					TOWING_objectSelected = objNull;
					_txt =  format ["""%1"" has been loaded into the vehicle.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
					cutText [_txt,"PLAIN DOWN"];
					systemChat ("Tow&Lift: "+str _txt+"");
				} else {
					_txt =  format ["""%1"" is too far to be towed.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
					cutText [_txt,"PLAIN DOWN"];
					systemChat ("Tow&Lift: "+str _txt+"");
				};
			} else {
				_txt = "There is not enough space in this vehicle.";
				cutText [_txt,"PLAIN DOWN"];
				systemChat ("Tow&Lift: "+str _txt+"");
			};
		} else {
			_txt = format ["""%1"" is already being towed or lifted.", getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName")];
			cutText [_txt,"PLAIN DOWN"];
			systemChat ("Tow&Lift: "+str _txt+"");
		};
	};
	
	TOWING_local_lock = false;
};
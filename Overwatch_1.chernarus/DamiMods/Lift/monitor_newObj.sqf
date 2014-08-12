private ["_liste_objects_depl_heli_remorq_transp", "_liste_vehicles_connus", "_liste_vehicles", "_count_liste_vehicles", "_i", "_object"];

_liste_objects_depl_heli_remorq_transp = TOWING_playerLiftableObjects + LIFTING_liftableObjects + TOWING_TowableObjects + TOWING_trasnportableObjectClasses;
_liste_vehicles_connus = [];

while {true} do
{
	if !(isNull player) then {
		_liste_vehicles = (vehicles + nearestObjects [player, ["Static"], 80]) - _liste_vehicles_connus;
		_count_liste_vehicles = count _liste_vehicles;
		if (_count_liste_vehicles > 0) then {
			for [{_i = 0}, {_i < _count_liste_vehicles}, {_i = _i + 1}] do
			{
				_object = _liste_vehicles select _i;
				if ({_object isKindOf _x} count _liste_objects_depl_heli_remorq_transp > 0) then {
					[_object] spawn TOWING_TowableObjectsInit;
				};
				if ({_object isKindOf _x} count LIFTING_capableHelis > 0) then {
					[_object] spawn LIFTING_HeliSettingsInit;
				};
				if ({_object isKindOf _x} count TOWING_capableVehicles > 0) then {
					[_object] spawn TOWING_TowSettingsInit;
				};
				if ({_object isKindOf _x} count TOWING_transporterObjectClass > 0) then {
					[_object] spawn TOWING_CargoSettingsInit;
				};
				sleep (18/_count_liste_vehicles);
			};
			_liste_vehicles_connus = _liste_vehicles_connus + _liste_vehicles;
		} else {
			sleep 18;
		};
	} else {
		sleep 2;
	};
};
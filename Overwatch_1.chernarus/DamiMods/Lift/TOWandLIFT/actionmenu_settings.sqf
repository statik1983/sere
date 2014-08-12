private ["_selectedObject"];

while {true} do {
	TOWING_objectSelected_ADDACTION = objNull;
	
	_selectedObject = cursorTarget;
	if !(isNull _selectedObject) then {
		_isPlayer = (vehicle player == player);
		_isMoved = (isNull TOWING_objMoveAttempt);
		
		if (player distance _selectedObject < 8) then {
			TOWING_objectSelected_ADDACTION = _selectedObject;
			if ({_selectedObject isKindOf _x} count TOWING_playerLiftableObjects > 0) then {
				Tow_settings_action_moving_object_valid = (_isPlayer && (count crew _selectedObject == 0) && _isMoved && (isNull (_selectedObject getVariable "TOWING_isMovedBy") || (!alive (_selectedObject getVariable "TOWING_isMovedBy"))) && isNull (_selectedObject getVariable "TOWING_transportedBy") && !(_selectedObject getVariable "Tow_settings_disabled"));
			};
			if ({_selectedObject isKindOf _x} count TOWING_TowableObjects > 0) then {
				if ({_selectedObject isKindOf _x} count TOWING_playerLiftableObjects > 0) then {
					Tow_settings_action_tow_deplace_valid = (_isPlayer && (alive TOWING_objMoveAttempt) && (count crew _selectedObject == 0) && (TOWING_objMoveAttempt == _selectedObject) && ({_x != _selectedObject && alive _x && isNull (_x getVariable "TOWING_towedObj") && ([0,0,0] distance velocity _x < 6) && (getPos _x select 2 < 2) && !(_x getVariable "Tow_settings_disabled")} count (nearestObjects [_selectedObject, TOWING_capableVehicles, 18])) > 0 && !(_selectedObject getVariable "Tow_settings_disabled"));
				};
				Tow_settings_action_select_object_remorque_valid = (_isPlayer && (alive _selectedObject) && (count crew _selectedObject == 0) && isNull TOWING_objMoveAttempt && isNull (_selectedObject getVariable "TOWING_transportedBy") && (isNull (_selectedObject getVariable "TOWING_isMovedBy") || (!alive (_selectedObject getVariable "TOWING_isMovedBy"))) && !(_selectedObject getVariable "Tow_settings_disabled"));
				Tow_settings_action_detacher_valid = (_isPlayer && _isMoved && !isNull (_selectedObject getVariable "TOWING_transportedBy") && !(_selectedObject getVariable "Tow_settings_disabled"));
			};
			if ({_selectedObject isKindOf _x} count TOWING_trasnportableObjectClasses > 0) then {
				if ({_selectedObject isKindOf _x} count TOWING_playerLiftableObjects > 0) then {
					TOWING_action_ValidTowable = (_isPlayer && (count crew _selectedObject == 0) && (TOWING_objMoveAttempt == _selectedObject) &&{_x != _selectedObject && alive _x && ([0,0,0] distance velocity _x < 6) && (getPos _x select 2 < 2) &&!(_x getVariable "Tow_settings_disabled")} count (nearestObjects [_selectedObject, TOWING_transporterObjectClass, 18]) > 0 &&!(_selectedObject getVariable "Tow_settings_disabled"));
				};
				Tow_settings_action_select_object_charge_valid = (_isPlayer && (count crew _selectedObject == 0) &&isNull TOWING_objMoveAttempt && isNull (_selectedObject getVariable "TOWING_transportedBy") &&(isNull (_selectedObject getVariable "TOWING_isMovedBy") || (!alive (_selectedObject getVariable "TOWING_isMovedBy"))) &&!(_selectedObject getVariable "Tow_settings_disabled"));
			};
			if ({_selectedObject isKindOf _x} count TOWING_capableVehicles > 0) then {
				Tow_settings_action_tow_deplace_valid = (_isPlayer && (alive _selectedObject) && (!isNull TOWING_objMoveAttempt) &&(alive TOWING_objMoveAttempt) && !(TOWING_objMoveAttempt getVariable "Tow_settings_disabled") &&({TOWING_objMoveAttempt isKindOf _x} count TOWING_TowableObjects > 0) &&isNull (_selectedObject getVariable "TOWING_towedObj") && ([0,0,0] distance velocity _selectedObject < 6) &&(getPos _selectedObject select 2 < 2) && !(_selectedObject getVariable "Tow_settings_disabled"));
				Tow_settings_action_tow_selection_valid = (_isPlayer && (alive _selectedObject) && _isMoved &&(!isNull TOWING_objectSelected) && (TOWING_objectSelected != _selectedObject) &&!(TOWING_objectSelected getVariable "Tow_settings_disabled") &&({TOWING_objectSelected isKindOf _x} count TOWING_TowableObjects > 0) &&isNull (_selectedObject getVariable "TOWING_towedObj") && ([0,0,0] distance velocity _selectedObject < 6) &&(getPos _selectedObject select 2 < 2) && !(_selectedObject getVariable "Tow_settings_disabled"));
			};
			if ({_selectedObject isKindOf _x} count TOWING_transporterObjectClass > 0) then {
				TOWING_action_ValidTowable = (alive _selectedObject && (vehicle player == player) && (!isNull TOWING_objMoveAttempt) &&!(TOWING_objMoveAttempt getVariable "Tow_settings_disabled") &&({TOWING_objMoveAttempt isKindOf _x} count TOWING_trasnportableObjectClasses > 0) &&([0,0,0] distance velocity _selectedObject < 6) && (getPos _selectedObject select 2 < 2) && !(_selectedObject getVariable "Tow_settings_disabled"));
				TOWING_action_ValidTransportable = (alive _selectedObject && (vehicle player == player) && _isMoved &&(!isNull TOWING_objectSelected) && (TOWING_objectSelected != _selectedObject) &&!(TOWING_objectSelected getVariable "Tow_settings_disabled") &&({TOWING_objectSelected isKindOf _x} count TOWING_trasnportableObjectClasses > 0) &&([0,0,0] distance velocity _selectedObject < 6) && (getPos _selectedObject select 2 < 2) && !(_selectedObject getVariable "Tow_settings_disabled"));
				Tow_settings_action_contents_vehicle_valid = (alive _selectedObject && (vehicle player == player) && _isMoved &&([0,0,0] distance velocity _selectedObject < 6) && (getPos _selectedObject select 2 < 2) && !(_selectedObject getVariable "Tow_settings_disabled"));
			};
		};
	};
	if ({(vehicle player) isKindOf _x} count LIFTING_capableHelis > 0) then {
		TOWING_objectSelected_ADDACTION = (vehicle player);
		TOWING_action_ValidTowable = false;
		TOWING_action_ValidTransportable = false;
		Tow_settings_action_contents_vehicle_valid = false;
		Tow_settings_action_tow_deplace_valid = false;
		Tow_settings_action_tow_selection_valid = false;
		Tow_settings_action_heliporter_valid = (driver TOWING_objectSelected_ADDACTION == player && ({_x != TOWING_objectSelected_ADDACTION && !(_x getVariable "Tow_settings_disabled")} count (nearestObjects [TOWING_objectSelected_ADDACTION, LIFTING_liftableObjects, 15]) > 0) && isNull (TOWING_objectSelected_ADDACTION getVariable "Tow_settings_heliporte") && ([0,0,0] distance velocity TOWING_objectSelected_ADDACTION < 6) && (getPos TOWING_objectSelected_ADDACTION select 2 > 1) && !(TOWING_objectSelected_ADDACTION getVariable "Tow_settings_disabled"));
		Tow_settings_action_heliport_drop_valid = (driver TOWING_objectSelected_ADDACTION == player && !isNull (TOWING_objectSelected_ADDACTION getVariable "Tow_settings_heliporte") && ([0,0,0] distance velocity TOWING_objectSelected_ADDACTION < 15) && (getPos TOWING_objectSelected_ADDACTION select 2 < 40) && !(TOWING_objectSelected_ADDACTION getVariable "Tow_settings_disabled"));
	};
	
	sleep 0.5;
};
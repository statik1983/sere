#include "Tow&Lift_settings.sqf"

if (isServer) then {
	PVOZ_TOWandLIFT_temphpad = "HeliHEmpty" createVehicle [0, 0, 0];
	publicVariable "PVOZ_TOWandLIFT_temphpad";
};
if !(isServer && isDedicated) then
{
	waitUntil {!isNil "PVOZ_TOWandLIFT_temphpad"};
	TOWING_objMoveAttempt 	= objNull;
	TOWING_local_lock 		= false;
	TOWING_objectSelected 	= objNull;
	TOWING_transporterObjectClass = [];
	TOWING_trasnportableObjectClasses = [];
	{
		TOWING_transporterObjectClass = TOWING_transporterObjectClass + [_x select 0];
	} forEach TOWING_VehiclesWithCargo;
	{
		TOWING_trasnportableObjectClasses = TOWING_trasnportableObjectClasses + [_x select 0];
	} forEach TOWING_cargoObjects;
	TOWING_TowableObjectsInit 	= compile preprocessFile "DamiMods\Lift\TOWandLIFT\object_init.sqf";
	LIFTING_HeliSettingsInit 	= compile preprocessFile "DamiMods\Lift\TOWandLIFT\heli_lifting\heli_carrier_init.sqf";
	TOWING_TowSettingsInit 		= compile preprocessFile "DamiMods\Lift\TOWandLIFT\veh_towing\tow_init.sqf";
	TOWING_CargoSettingsInit 	= compile preprocessFile "DamiMods\Lift\TOWandLIFT\veh_cargo\transport_init.sqf";
	TOWING_objectSelected_ADDACTION = objNull;
	
	TOWING_action_ValidTowable = false;
	TOWING_action_ValidTransportable = false;
	Tow_settings_action_contents_vehicle_valid = false;
	Tow_settings_action_tow_deplace_valid = false;
	Tow_settings_action_tow_selection_valid = false;
	Tow_settings_action_heliporter_valid = false;
	Tow_settings_action_heliport_drop_valid = false;
	Tow_settings_action_moving_object_valid = false;
	Tow_settings_action_tow_deplace_valid = false;
	Tow_settings_action_select_object_remorque_valid = false;
	Tow_settings_action_detacher_valid = false;
	TOWING_action_ValidTowable = false;
	Tow_settings_action_select_object_charge_valid = false;
	execVM "DamiMods\Lift\TOWandLIFT\actionmenu_settings.sqf";
};
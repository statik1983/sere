private ["_transporteur", "_towingDisabled", "_objects_charges"];
_transporteur = _this select 0;
_towingDisabled = _transporteur getVariable "Tow_settings_disabled";
_objects_charges = _transporteur getVariable "Tow_settings_objects_charges";
if (isNil "_towingDisabled") then {_transporteur setVariable ["Tow_settings_disabled", false];};
if (isNil "_objects_charges") then {_transporteur setVariable ["Tow_settings_objects_charges", [], false];};

_transporteur addAction [("<t color=""#dddd00"">" + "Load object into vehicle" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_cargo\move_loaded.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && TOWING_action_ValidTowable"];
_transporteur addAction [("<t color=""#eeeeee"">" + "... load the selected object into this vehicle" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_cargo\select_loaded.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && TOWING_action_ValidTransportable"];
_transporteur addAction [("<t color=""#dddd00"">" + "View vehicle cargo" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_cargo\view_veh_content.sqf", nil, 5, false, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_contents_vehicle_valid"];
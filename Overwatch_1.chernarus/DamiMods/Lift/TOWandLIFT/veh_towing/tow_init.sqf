private ["_remorqueur", "_towingDisabled", "_remorque"];
_remorqueur = _this select 0;
_towingDisabled = _remorqueur getVariable "Tow_settings_disabled";
_remorque = _remorqueur getVariable "TOWING_towedObj";

if (isNil "_towingDisabled") then {_remorqueur setVariable ["Tow_settings_disabled", false];};
if (isNil "_remorque") then {_remorqueur setVariable ["TOWING_towedObj", objNull, false];};

_remorqueur addAction [("<t color=""#dddd00"">" + "Tow the object" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_towing\tow_deplace.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_tow_deplace_valid"];
_remorqueur addAction [("<t color=""#eeeeee"">" + "... tow selected object to this vehicle" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_towing\tow_selection.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_tow_selection_valid"];
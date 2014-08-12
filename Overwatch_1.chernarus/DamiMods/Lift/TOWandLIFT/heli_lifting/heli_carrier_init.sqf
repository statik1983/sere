private ["_helicarrier", "_towingDisabled", "_heliporte"];
_helicarrier 	= _this select 0;
_towingDisabled = _helicarrier getVariable "Tow_settings_disabled";
_heliporte 		= _helicarrier getVariable "Tow_settings_heliporte";

if (isNil "_towingDisabled") then {_helicarrier setVariable ["Tow_settings_disabled", false];};
if (isNil "_heliporte") then {_helicarrier setVariable ["Tow_settings_heliporte", objNull, false];};

_helicarrier addAction [("<t color=""#dddd00"">" + "Lift the object" + "</t>"), "DamiMods\Lift\TOWandLIFT\heli_lifting\heli_carrier.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_heliporter_valid"];
_helicarrier addAction [("<t color=""#dddd00"">" + "Drop the object" + "</t>"), "DamiMods\Lift\TOWandLIFT\heli_lifting\drop.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_heliport_drop_valid"];
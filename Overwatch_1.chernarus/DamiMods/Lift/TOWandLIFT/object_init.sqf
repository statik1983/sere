private ["_object", "_towingDisabled", "_transportedByChk", "_towedByChk"];
_object 				= _this select 0;
_towingDisabled 	= _object getVariable "Tow_settings_disabled";
_transportedByChk 	= _object getVariable "TOWING_transportedBy";
_towedByChk 		= _object getVariable "TOWING_isMovedBy";

if (isNil "_towingDisabled") then {_object setVariable ["Tow_settings_disabled", false];};
if (isNil "_transportedByChk") then {_object setVariable ["TOWING_transportedBy", objNull, false];};
if (isNil "_towedByChk") then {_object setVariable ["TOWING_isMovedBy", objNull, false];};

_object addEventHandler ["GetIn",
{
	if (_this select 2 == player) then
	{
		_this spawn {
			if ((!(isNull (_this select 0 getVariable "TOWING_isMovedBy")) && (alive (_this select 0 getVariable "TOWING_isMovedBy"))) || !(isNull (_this select 0 getVariable "TOWING_transportedBy"))) then {
				player action ["eject", _this select 0];
				_txt = "This vehicle is being towed.";
				cutText [_txt,"PLAIN DOWN"];
				systemChat ("Tow&Lift: "+str _txt+"");
			};
		};
	};
}];

if ({_object isKindOf _x} count TOWING_playerLiftableObjects > 0) then {
	_object addAction [("<t color=""#dddd00"">" + "Pick up "+typeOf cursorTarget+"" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_lifting\move.sqf", nil, 5, false, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_moving_object_valid"];
};
if ({_object isKindOf _x} count TOWING_TowableObjects > 0) then {
	if ({_object isKindOf _x} count TOWING_playerLiftableObjects > 0) then {
		_object addAction [("<t color=""#dddd00"">" + "Tow the object" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_towing\tow_deplace.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_tow_deplace_valid"];
	};
	_object addAction [("<t color=""#dddd00"">" + "Tow..." + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_towing\select_object.sqf", nil, 5, false, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_select_object_remorque_valid"];
	_object addAction [("<t color=""#dddd00"">" + "Untow the object" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_towing\detacher.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_detacher_valid"];
};
if ({_object isKindOf _x} count TOWING_trasnportableObjectClasses > 0) then {
	if ({_object isKindOf _x} count TOWING_playerLiftableObjects > 0) then {
		_object addAction [("<t color=""#dddd00"">" + "Load into the vehicle" + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_cargo\move_loaded.sqf", nil, 6, true, true, "", "TOWING_objectSelected_ADDACTION == _target && TOWING_action_ValidTowable"];
	};
	_object addAction [("<t color=""#dddd00"">" + "Load in..." + "</t>"), "DamiMods\Lift\TOWandLIFT\veh_cargo\select_object.sqf", nil, 5, false, true, "", "TOWING_objectSelected_ADDACTION == _target && Tow_settings_action_select_object_charge_valid"];
};
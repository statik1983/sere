[] spawn
{
	#include "TOWandLIFT\Tow&Lift_settings.sqf"
	#define Tow_settings_enable
	
	if (isServer) then {
		DAMI_TOWING_setDirection =
		{
			private ["_object", "_direction"];
			_object = _this select 1 select 0;
			_direction = _this select 1 select 1;
			_object setDir _direction;
			_object setPos (getPos _object);
		};	
		"PVOZ_setDirection_TOW" addPublicVariableEventHandler DAMI_TOWING_setDirection;
	};
	#include "TOWandLIFT\init.sqf"
	Tow_settings_active = true;
	if !(isServer && isDedicated) then {execVM "DamiMods\Lift\monitor_newObj.sqf";};
};
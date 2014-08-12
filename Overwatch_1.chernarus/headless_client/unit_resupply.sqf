/*
	unit_resupply
	
	Credits:  Basic script concept adapted from Sarge AI.
	
	Description: Handles AI ammo reload and zombie hostility. Called by fnc_createAI upon AI unit creation.
	
	Last updated: 4:44 PM 8/2/2013
*/
private["_needsHeal","_inVehicle","_unit","_currentWeapon","_weaponMagazine","_needsReload","_nearbyZeds","_marker","_markername","_lastBandage","_bandages","_unitGroup"];

//diag_log ("unit_resupply spawned!");
_unit = _this select 0;								//Unit to monitor/reload ammo

_inVehicle = (vehicle _unit != _unit);
_lastBandage = 0;
_bandages = 4;
_unitGroup = (group _unit);
_needsHeal = false;

if (_unit getVariable ["rearmEnabled",false]) exitWith {};
_unit setVariable ["rearmEnabled",true];

//Initialize medical variables
if (isNil {_unit getVariable "unithealth"}) then {_unit setVariable ["unithealth",[12000,0,0,false,false]]};
if (isNil {_unit getVariable "unconscious"}) then {_unit setVariable ["unconscious",false]};

		dayzNpc_monitor1 = [_unit] spawn {
		   private["_unit"];
		   _unit = _this select 0;
		   //diag_log ("dayzNpc_monitor1 spawned!");
				while {true} do {
					[_unit] call npc_zombieCheck;
					sleep 2;
				};
			};


while {(alive _unit) && (!(isNull _unit))} do {

		if (scriptDone dayzNpc_monitor1) then {
		 //diag_log ("dayzNpc_monitor1 scriptDone!");
		   dayzNpc_monitor1 = [_unit] spawn {
		   private["_unit"];
		   _unit = _this select 0;
				while {true} do {
					[_unit] call npc_zombieCheck;
					sleep 2;
				};
			};
		};	
	if (!(_unit getVariable ["unconscious",false]) && !_inVehicle) then {

		if (_bandages > 0) then {
			private ["_health"];
			_health = _unit getVariable "unithealth";
			if (_needsHeal) then {
				private ["_healTimes"];
				_bandages = _bandages - 1;
				//_unit disableAI "TARGET"; _unit disableAI "AUTOTARGET"; _unit disableAI "MOVE";
				_unit playActionNow "Medic";
				[_unit,"bandage",0,false] call dayz_zombieSpeak;
				_healTimes = 0;
				while {(!(_unit getVariable ["unconscious",false]))&&(_healTimes < 3)&&(alive _unit)} do {
					sleep 2;
					_health set [0,(((_health select 0) + 2000) min 12000)];
					_healTimes = _healTimes + 1;
					if ((_healTimes == 3)&&(alive _unit)) then {
						_health set [1,0];
						_health set [2,0];
						_health set [3,false];
						_health set [4,false];
						_unit setDamage 0;
					};
				};
				
				//_unit enableAI "TARGET"; _unit enableAI "AUTOTARGET"; _unit enableAI "MOVE";
				_lastBandage = time;
				_needsHeal = false;
			} else {
				private ["_lowblood","_brokenbones"];
				_lowblood = ((_health select 0) < 7200);
				_brokenbones = ((_health select 3) or (_health select 4));
				if ((_lowblood or _brokenbones) && (time - _lastBandage) > 60) then {
					_needsHeal = true;
				};
			};
		};
	};

	sleep DZAI_refreshRate;										//Check again in x seconds.
};
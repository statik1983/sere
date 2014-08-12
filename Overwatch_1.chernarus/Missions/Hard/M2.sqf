// Static, predefined infantry patrols in defined areas with configurable units
//---------------------------------------------------------------------------------
// 
//      format: [areamarker,type_of_group,number_of_snipers,number_of_riflemen,action_to_do,(respawn),(respawntime)] call SAR_AI;
//
//      areamarker          : Name of an area, as defined in your area definitions (MUST NOT BE similar to SAR_area_ ! THIS IS IMPORTANT!)
//      type_of_group       : 1 = military, 2 = survivors, 3 = bandits
//      number_of_snipers   : amount of snipers in the group
//      number_of_riflemen  : amount of riflemen in the group
//
//      action_to_do        : groupaction (optional, default is "patrol")
//                            possible values: 
//                               "fortify" -> the group will search for nearby buildings and move in them. They will stay there until an enemy spotted, then they will chase him.
//                               "ambush"  -> the group will look for a nearby road, and setup an ambush. They will not move until an enemy was spotted. 
//                               "patrol"  -> the group will patrol random waypoints in the area, and engage any enemy they see.
//
//      respawn         : true or false (optional)
//      respawntime     : time in secs until group respawns (optional)
//
//----------------------------------------------------------------------------------

private ["_coords"];
[] execVM "Missions\MissionGoHard.sqf";
WaitUntil {MissionGoHard == 1};

_coords = [12034, 12725];

[nil,nil,rTitleText,"Military solders have been ordered to retrieve weapon and supply air drops at the NE Air Field.\nThe soldiers are waiting for the drop that will arrive in about 10 minutes.", "PLAIN DOWN",15] call RE;

diag_log format ["AI Missions, hard event started, M2, Military solders have been ordered to retrieve weapon and supply air drops at the NE Air Field."];

_this1 = createMarker ["SAR_marker_M21", _coords];
_this1 setMarkeralpha 0;
_this1 setMarkerText "Mission";
_this1 setMarkerShape "ELLIPSE";
_this1 setMarkerType "Flag";
_this1 setMarkerBrush "SolidBorder";
_this1 setMarkerSize [30, 30];
SAR_marker_M21 = _this1;

_this2 = createMarker ["SAR_marker_M22", _coords];
_this2 setMarkerColor "ColorRed";
_this2 setMarkerText "Mission";
_this2 setMarkerShape "ELLIPSE";
_this2 setMarkerType "Flag";
_this2 setMarkerBrush "SolidBorder";
_this2 setMarkerSize [200, 200];
SAR_marker_M22 = _this2;

_Object1 = createVehicle ["HMMWV_DZ",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object1 setFuel 0.5;
_Object1 setDamage 0.5;
_Object1 setVariable ["Sarge",1,true];
_Object1 setVariable ["AISpawned",true,true];

_Object2 = createVehicle ["Ural_TK_CIV_EP1",[(_coords select 0) - 5, (_coords select 1) + 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object2 setFuel 0.5;
_Object2 setDamage 0.5;
_Object2 setVariable ["Sarge",1,true];
_Object2 setVariable ["AISpawned",true,true];

_Object3 = createVehicle ["HMMWV_DZ",[(_coords select 0) - 5, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object3 setFuel 0.5;
_Object3 setDamage 0.5;
_Object3 setVariable ["Sarge",1,true];
_Object3 setVariable ["AISpawned",true,true];

[SAR_marker_M21,1,0,2,"patrol",false,900] call SAR_AI;
[SAR_marker_M21,1,0,2,"patrol",false,900] call SAR_AI;

sleep 120; 

//----- Weapons Air Drop Start
	
	for "_x" from 0 to 1 do {
		_Spawn_Airdrop1 = [] spawn 
		{
//			private["_RandomDropCrate","_RandomCrate","_HeliStart","_Heli","_AI","_Pilot","_Waypoint1","_crateSupply","_HeliEnd","_Waypoint2","_DropDirection","_DropPosition","_Chute","_Crate","_Smoke"];
			#include "MissionAirDropSettings.sqf";
			DropNow=false;
				
			_RandomDropCrate = _DropCrateList call BIS_fnc_selectRandom;
			_RandomCrate = _CrateList call BIS_fnc_selectRandom;
			_Heli = _HeliList call BIS_fnc_selectRandom;		
			_HeliStart = _StartPosition call BIS_fnc_selectRandom;

			_Heli = createVehicle [_Heli, _HeliStart, [], 0, "FLY"];
			_Heli engineOn true;
			_Heli flyInHeight 80;
			_Heli forceSpeed 150;

			clearMagazineCargoGlobal _Heli;
			clearWeaponCargoGlobal _Heli;

			_AI = creategroup west;

			_Pilot = _AI createUnit ["Soldier1_DZ",getPos _Heli,[],0,"FORM"];
			_Pilot moveindriver _Heli;
			_Pilot assignAsDriver _Heli;
			_Pilot setVariable["Sarge",1,true];
			_Pilot addWeapon 'NVGoggles';
			_Pilot addWeapon 'ItemCompass';
			_Pilot addWeapon 'ItemMap';
			_Pilot addWeapon 'ItemGPS';
			
			_Gunner = _AI createUnit ["Soldier1_DZ",getPos _Heli,[],0,"FORM"];
			_Gunner moveInGunner _Heli;
			_Gunner assignAsGunner _Heli;
			_Gunner setVariable["Sarge",1,true];
			_Gunner addWeapon 'NVGoggles';
			_Gunner addWeapon 'ItemCompass';
			_Gunner addWeapon 'ItemMap';
			_Gunner addWeapon 'ItemGPS';

			_Waypoint1 = _AI addWaypoint [[12034, 12725,80], 0];
			_Waypoint1 setWaypointType "MOVE";
			_Waypoint1 setWaypointBehaviour "CARELESS";
			_Waypoint1 setWaypointStatements ["true", "DropNow=true"];
			_Waypoint1Position = waypointPosition [_AI,1];

			waituntil {(_Heli distance _Waypoint1Position) <= 100};
			DropNow=true;

			_HeliEnd = _StartPosition call BIS_fnc_selectRandom;
			deleteWaypoint [_AI, 1];
			_Waypoint2 = _AI addWaypoint [_HeliEnd, 0];
			_Waypoint2 setWaypointType "MOVE";
			_Waypoint2 setWaypointBehaviour "CARELESS";
			_Heli forceSpeed 350;
			_Heli setspeedmode "FULL";

			sleep 0.5;

			_DropDirection = getDir _Heli;
			_DropPosition = [(getPosATL _Heli select 0)-15*sin(_DropDirection), (getPosATL _Heli select 1)-15*cos(_DropDirection), (getPosATL _Heli select 2)-10]; //-15m behind plane and -10 hight
			_Chute = createVehicle ["ParachuteMediumEast", _DropPosition, [], 0, "FLY"];
			_Chute setVariable["Sarge",1,true];
			_Crate = createVehicle [_RandomDropCrate,_DropPosition,[], 0, "CAN_COLLIDE"];
			_Crate setVariable["Sarge",1,true];
			_Crate attachTo [_Chute, [0, 0, 1]];
			_Smoke = createVehicle ["SmokeShellRed",_DropPosition,[], 0, "CAN_COLLIDE"];
			_Smoke setVariable["Sarge",1,true];
			_Smoke attachTo [_Crate,[1, 1, 0]];

			_i = 0;
			while {_i < 45} do {
				scopeName "loop1";
				if (((getPos _Crate) select 2) < 1) then {breakOut "loop1"};
				sleep 0.1;
				_i=_i+0.1;
			};  

			switch (true) do {
				case not (alive _Crate): {
					detach _Crate;
					_Crate setpos [(getpos _Crate select 0), (getpos _Crate select 1), 0];
				};
				case alive _Crate: {
					detach _Crate;
					_Crate setpos [(getpos _Crate select 0), (getpos _Crate select 1), 0];
					_crateSupply = createVehicle [_RandomCrate,[(getpos _Crate select 0),(getpos _Crate select 1), 0],[],0,"CAN_COLLIDE"];
					_crateSupply setVariable["Sarge",1,true];
					deletevehicle _Crate;
					deletevehicle _Chute;

					clearWeaponCargoGlobal _crateSupply;
					clearMagazineCargoGlobal _crateSupply;
					clearBackpackCargoGlobal _crateSupply;
								
					// Random 6 weapons, 1 of each with 4 magazines each
					for "_x" from 0 to 5 do {
						_weapon = _allWeapons call BIS_fnc_selectRandom;
						if (_weapon !="") then
						{
							_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
							_crateSupply addWeaponCargoGlobal [_weapon, 1];			
							_crateSupply addMagazineCargoGlobal [_magazine, 4];
						};
					};
					// Random 4 items, 3 of each
					for "_x" from 0 to 3 do {
						_miscItem1 = _miscItems1 call BIS_fnc_selectRandom;
						_crateSupply addMagazineCargoGlobal [_miscItem1, 3];
					};	
					// Random 2 items, 1 of each
					for "_x" from 0 to 1 do {
						_miscItem2 = _miscItems2 call BIS_fnc_selectRandom;
						_crateSupply addWeaponCargoGlobal [_miscItem2, 1];
					};
				};
			};
		};
		sleep 2;
	};	
//----- Weapons Air Drop End
//----- Supply Air Drop Start
	
	for "_x" from 0 to 1 do {
		_Spawn_Airdrop2 = [] spawn 
		{
//			private["_RandomDropCrate","_RandomCrate","_HeliStart","_Heli","_AI","_Pilot","_Waypoint1","_crateSupply","_HeliEnd","_Waypoint2","_DropDirection","_DropPosition","_Chute","_Crate","_Smoke"];
			#include "MissionAirDropSettings.sqf";
			DropNow=false;
				
			_RandomDropCrate = _DropCrateList call BIS_fnc_selectRandom;
			_RandomCrate = _CrateList call BIS_fnc_selectRandom;
			_Heli = _HeliList call BIS_fnc_selectRandom;		
			_HeliStart = _StartPosition call BIS_fnc_selectRandom;

			_Heli = createVehicle [_Heli, _HeliStart, [], 0, "FLY"];
			_Heli engineOn true;
			_Heli flyInHeight 80;
			_Heli forceSpeed 150;

			clearMagazineCargoGlobal _Heli;
			clearWeaponCargoGlobal _Heli;

			_AI = creategroup west;

			_Pilot = _AI createUnit ["Soldier1_DZ",getPos _Heli,[],0,"FORM"];
			_Pilot moveindriver _Heli;
			_Pilot assignAsDriver _Heli;
			_Pilot setVariable["Sarge",1,true];
			_Pilot addWeapon 'NVGoggles';
			_Pilot addWeapon 'ItemCompass';
			_Pilot addWeapon 'ItemMap';
			_Pilot addWeapon 'ItemGPS';
			
			_Gunner = _AI createUnit ["Soldier1_DZ",getPos _Heli,[],0,"FORM"];
			_Gunner moveInGunner _Heli;
			_Gunner assignAsGunner _Heli;
			_Gunner setVariable["Sarge",1,true];
			_Gunner addWeapon 'NVGoggles';
			_Gunner addWeapon 'ItemCompass';
			_Gunner addWeapon 'ItemMap';
			_Gunner addWeapon 'ItemGPS';

			_Waypoint1 = _AI addWaypoint [[12034, 12725,80], 0];
			_Waypoint1 setWaypointType "MOVE";
			_Waypoint1 setWaypointBehaviour "CARELESS";
			_Waypoint1 setWaypointStatements ["true", "DropNow=true"];
			_Waypoint1Position = waypointPosition [_AI,1];

			waituntil {(_Heli distance _Waypoint1Position) <= 100};
			DropNow=true;

			_HeliEnd = _StartPosition call BIS_fnc_selectRandom;
			deleteWaypoint [_AI, 1];
			_Waypoint2 = _AI addWaypoint [_HeliEnd, 0];
			_Waypoint2 setWaypointType "MOVE";
			_Waypoint2 setWaypointBehaviour "CARELESS";
			_Heli forceSpeed 350;
			_Heli setspeedmode "FULL";

			sleep 0.5;

			_DropDirection = getDir _Heli;
			_DropPosition = [(getPosATL _Heli select 0)-15*sin(_DropDirection), (getPosATL _Heli select 1)-15*cos(_DropDirection), (getPosATL _Heli select 2)-10]; //-15m behind plane and -10 hight
			_Chute = createVehicle ["ParachuteMediumEast", _DropPosition, [], 0, "FLY"];
			_Chute setVariable["Sarge",1,true];
			_Crate = createVehicle [_RandomDropCrate,_DropPosition,[], 0, "CAN_COLLIDE"];
			_Crate setVariable["Sarge",1,true];
			_Crate attachTo [_Chute, [0, 0, 1]];
			_Smoke = createVehicle ["SmokeShell",_DropPosition,[], 0, "CAN_COLLIDE"];
			_Smoke setVariable["Sarge",1,true];
			_Smoke attachTo [_Crate,[0, 0, 0]];

			_i = 0;
			while {_i < 45} do {
				scopeName "loop1";
				if (((getPos _Crate) select 2) < 1) then {breakOut "loop1"};
				sleep 0.1;
				_i=_i+0.1;
			};  

			switch (true) do {
				case not (alive _Crate): {
					detach _Crate;
					_Crate setpos [(getpos _Crate select 0), (getpos _Crate select 1), 0];
				};
				case alive _Crate: {
					detach _Crate;
					_Crate setpos [(getpos _Crate select 0), (getpos _Crate select 1), 0];
					_crateSupply = createVehicle [_RandomCrate,[(getpos _Crate select 0),(getpos _Crate select 1), 0],[],0,"CAN_COLLIDE"];
					_crateSupply setVariable["Sarge",1,true];
					deletevehicle _Crate;
					deletevehicle _Chute;

					clearWeaponCargoGlobal _crateSupply;
					clearMagazineCargoGlobal _crateSupply;
					clearBackpackCargoGlobal _crateSupply;
								
					// Random 5 items, 3 of each
					for "_x" from 0 to 4 do {
						_miscItem3 = _miscItems3 call BIS_fnc_selectRandom;
						_crateSupply addmagazineCargoGlobal [_miscItem3, 3];
					};	
					// Random 10 items, 8 of each
						for "_x" from 0 to 9 do {
						_miscItem4 = _miscItems4 call BIS_fnc_selectRandom;
						_crateSupply addWeaponCargoGlobal [_miscItem4, 8];
					};
				};
			};
		};
		sleep 2;
	};	
//----- Supply Air Drop End

sleep 120;

[nil,nil,rTitleText,"WARNING! A large group of bandits have arrived at the NE Air Field to steal the military air drops!\nThe bandits are attacking the soldiers waiting for the air drop!", "PLAIN DOWN",15] call RE;

[SAR_marker_M22,3,0,4,"ambush2:120",false,900] call SAR_AI;
[SAR_marker_M22,3,1,2,"ambush2:120",false,900] call SAR_AI;
[SAR_marker_M22,3,1,3,"patrol",false,900] call SAR_AI;
[SAR_marker_M22,3,1,3,"patrol",false,900] call SAR_AI;

//SAR_marker, AI type: 1=mil 2=surv 3=ban, Vehicle, Crew=lead/snip/sold, Respawn?, Time to respawn
[SAR_marker_M22, 3, ["UAZ_MG_TK_EP1"], [[1,0,2]], false, 300] call SAR_AI_land;//Bandit
[SAR_marker_M22, 3, ["Ural_CDF"], [[1,1,3]], false, 300] call SAR_AI_land;//Bandit

waitUntil{{isPlayer _x && _x distance _crateSupply < 8  } count playableunits > 0}; 

[nil,nil,rTitleText,"The military air drops have been secured by survivors!  \nMission objects will delete in 5 minutes. Crates will delete in 20 minutes!", "PLAIN DOWN",15] call RE;

_crateSupply spawn {sleep 1200;deleteVehicle _this;};

deleteMarker "SAR_marker_M21";
deleteMarker "SAR_marker_M22";
MissionGoHard = 0;

M1 = 1;
[0] execVM "missions\Medium\MissionFinder.sqf";
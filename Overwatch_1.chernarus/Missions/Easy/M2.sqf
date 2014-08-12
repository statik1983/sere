//---------------------------------------------------------------------------------
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
[] execVM "Missions\MissionGoEasy.sqf";
WaitUntil {MissionGoEasy == 1};

_coords =  [getMarkerPos "center",0,5000,10,0,10,0] call BIS_fnc_findSafePos;

[nil,nil,rTitleText,"A group of bandits have set up a stash house! \nCheck your map for the location!", "PLAIN DOWN",15] call RE;

diag_log format ["AI Missions, easy event started, M2, A group of bandits have set up a stash house!"];

_this1 = createMarker ["SAR_marker_M21", _coords];
_this1 setMarkeralpha 0
_this1 setMarkerText "Mission";
_this1 setMarkerShape "ELLIPSE";
_this1 setMarkerType "Flag";
_this1 setMarkerBrush "SolidBorder";
_this1 setMarkerSize [30, 30];
SAR_marker_M21 = _this1;

_this2 = createMarker ["SAR_marker_M22", _coords];
_this2 setMarkerColor "ColorYellow";
_this2 setMarkerText "Mission";
_this2 setMarkerShape "ELLIPSE";
_this2 setMarkerType "Flag";
_this2 setMarkerBrush "SolidBorder";
_this2 setMarkerSize [175, 175];
SAR_marker_M22 = _this2;

_Object1 = createVehicle ["Land_dum_istan3_hromada2",[(_coords select 0) +2, (_coords select 1) +5,-0.3],[], 0, "CAN_COLLIDE"];//Building
_Object1 setVariable ["Sarge",1,true];

_Object2 = createVehicle ["Land_hruzdum",[(_coords select 0) - 15, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Building
_Object2 setVariable ["Sarge",1,true];

_Object3 = createVehicle ["Land_hut06",[(_coords select 0) - 7, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Building
_Object3 setVariable ["Sarge",1,true];

_hummer1 = createVehicle ["HMMWV_DZ",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_hummer1 setFuel 0.5;
_hummer1 setDamage 0.5;
_hummer1 setVariable ["Sarge",1,true];
_hummer1 setVariable ["AISpawned",true,true];

_hummer2 = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) - 25, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_hummer2 setFuel 0.5;
_hummer2 setDamage 0.5;
_hummer2 setVariable ["Sarge",1,true];
_hummer2 setVariable ["AISpawned",true,true];

_crateSupplySelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateSupply = createVehicle [_crateSupplySelect,[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];//Crate
[_crateSupply] execVM "missions\misc\fillBoxesSupplyEasy.sqf";
_crateSupply setVariable ["Sarge",1,true];

[SAR_marker_M22,3,0,2,"patrol",false,900] call SAR_AI;
[SAR_marker_M21,3,1,1,"fortify",false,900] call SAR_AI;

waitUntil{{isPlayer _x && _x distance _crateSupply < 10  } count playableunits > 0}; 

[nil,nil,rTitleText,"The stash house is under survivor control!  \nMission objects will delete in 5 minutes. Crates will delete in 20 minutes!", "PLAIN DOWN",15] call RE;

_Object1 spawn {sleep 300;deleteVehicle _this;};
_Object2 spawn {sleep 300;deleteVehicle _this;};
_Object3 spawn {sleep 300;deleteVehicle _this;};
_crateSupply spawn {sleep 1200;deleteVehicle _this;};

deleteMarker "SAR_marker_M21";
deleteMarker "SAR_marker_M22";
MissionGoEasy = 0;

diag_log format ["AI Missions, easy event ENDED, M2"];

M1 = 1;
[0] execVM "Missions\Easy\MissionFinder.sqf";
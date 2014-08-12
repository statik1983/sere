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

_coords =  [getMarkerPos "center",0,5000,10,0,500,0] call BIS_fnc_findSafePos;

[nil,nil,rTitleText,"A military helicopter has crashed! \nCheck your map for the location!", "PLAIN DOWN",15] call RE;

diag_log format ["AI Missions, easy event started, M3, A military helicopter has crashed!"];

_this1 = createMarker ["SAR_marker_M31", _coords];
_this1 setMarkeralpha 0
_this1 setMarkerText "Mission";
_this1 setMarkerShape "ELLIPSE";
_this1 setMarkerType "Flag";
_this1 setMarkerBrush "SolidBorder";
_this1 setMarkerSize [30, 30];
SAR_marker_M31 = _this1;

_this2 = createMarker ["SAR_marker_M32", _coords];
_this2 setMarkerColor "ColorYellow";
_this2 setMarkerText "Mission";
_this2 setMarkerShape "ELLIPSE";
_this2 setMarkerType "Flag";
_this2 setMarkerBrush "SolidBorder";
_this2 setMarkerSize [175, 175];
SAR_marker_M32 = _this2;

_chopper = ["UH1H_DZ","UH1Y_DZ","CH_47F_BAF","CH_47F_EP1","UH60M_DZ"] call BIS_fnc_selectRandom;//Heli
_hueychop = createVehicle [_chopper,_coords,[], 0, "NONE"];

BIS_effects_gepv = ["Burn",_hueychop,3,time];
publicVariable "BIS_effects_gepv";

_hueychop setVariable ["AISpawned",true,true];
_hueychop setVariable ["Sarge",1,true];
_hueychop setFuel 0.4;
_hueychop setDamage 0.8;
_hueychop setVehicleAmmo 0.2;

_crateSmallSelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateSmall = createVehicle [_crateSmallSelect,[(_coords select 0) - 4, _coords select 1,0],[], 0, "CAN_COLLIDE"];//Crate
[_crateSmall] execVM "missions\misc\fillBoxesSmall.sqf";
_crateSmall setVariable ["Sarge",1,true];

[SAR_marker_M32,1,0,2,"fortify",false,900] call SAR_AI;
[SAR_marker_M31,1,1,0,"fortify",false,900] call SAR_AI;

waitUntil{{isPlayer _x && _x distance _crateSmall < 5} count playableunits > 0}; 

_hueychop spawn {sleep 300;deleteVehicle _this;};
_crateSmall spawn {sleep 1200;deleteVehicle _this;};

[nil,nil,rTitleText,"The crash site has been secured by survivors!  \nMission objects will delete in 5 minutes. Crates will delete in 20 minutes!", "PLAIN DOWN",15] call RE;

deleteMarker "SAR_marker_M31";
deleteMarker "SAR_marker_M32";
MissionGoEasy = 0;

diag_log format ["AI Missions, easy event ENDED, M3"];

M1 = 1;
[0] execVM "Missions\Easy\MissionFinder.sqf";
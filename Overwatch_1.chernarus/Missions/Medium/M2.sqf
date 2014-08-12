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
[] execVM "Missions\MissionGoMedium.sqf";
WaitUntil {MissionGoMedium == 1};

_coords = [getMarkerPos "center",0,5600,100,0,200,0] call BIS_fnc_findSafePos;

[nil,nil,rTitleText,"A military C-130 carrying medical supplies has crashed and soldiers have secured the site, \nbut bandits are on their way! Check your map for the location!", "PLAIN DOWN",15] call RE;

diag_log format ["AI Missions, medium event started, M2, A military C-130 carrying medical supplies has crashed and soldiers are securing the site, but bandits are on their way!"];

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

_c130wreck = createVehicle ["C130J_wreck_EP1",[(_coords select 0) + 30, (_coords select 1) - 5,0],[], 0, "NONE"];//C130 Plane
_c130wreck setVariable ["Sarge",1,true];

_crateMedicalSelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateMedical = createVehicle [_crateMedicalSelect,[(_coords select 0) + 10, _coords select 1,0],[], 0, "CAN_COLLIDE"];//Crate
[_crateMedical] execVM "missions\misc\fillBoxesMedicalMedium.sqf";
_crateMedical setVariable ["Sarge",1,true];

_crateSupplySelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateSupply = createVehicle [_crateSupplySelect,[(_coords select 0) + 6, _coords select 1,0],[], 0, "CAN_COLLIDE"];//Crate
[_crateSupply] execVM "missions\misc\fillBoxesSupplyMedium.sqf";
_crateSupply setVariable ["Sarge",1,true];

_Object1 = createVehicle ["HMMWV_DZ",[(_coords select 0) - 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object1 setFuel 0.5;
_Object1 setDamage 0.5;
_Object1 setVariable ["Sarge",1,true];
_Object1 setVariable ["AISpawned",true,true];

[SAR_marker_M21,1,0,2,"fortify",false,900] call SAR_AI;

sleep 60;

[nil,nil,rTitleText,"Bandits have arrived at the military C-130 crash site!", "PLAIN DOWN",15] call RE;

[SAR_marker_M22,3,1,4,"patrol",false,900] call SAR_AI;
[SAR_marker_M22,3,1,3,"ambush2:120",false,900] call SAR_AI;

//SAR_marker, AI type: 1=mil 2=surv 3=ban, Vehicle, Crew=lead/snip/sold, Respawn?, Time to respawn
[SAR_marker_M22, 3, ["UAZ_MG_TK_EP1"], [[1,0,2]], false, 300] call SAR_AI_land;//Bandit
[SAR_marker_M22, 3, ["Ural_CDF"], [[1,1,2]], false, 300] call SAR_AI_land;//Bandit

waitUntil{{isPlayer _x && _x distance _crateSupply < 8 } count playableunits > 0}; 

[nil,nil,rTitleText,"The military C-130 crash site has been secured by survivors!  \nMission objects will delete in 5 minutes. Crates will delete in 20 minutes!", "PLAIN DOWN",15] call RE;

_crateMedical spawn {sleep 1200;deleteVehicle _this;};
_crateSupply spawn {sleep 1200;deleteVehicle _this;};

deleteMarker "SAR_marker_M21";
deleteMarker "SAR_marker_M22";
MissionGoMedium = 0;

M1 = 1;
[0] execVM "missions\Medium\MissionFinder.sqf";
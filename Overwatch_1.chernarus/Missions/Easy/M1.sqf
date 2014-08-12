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

_coords =  [getMarkerPos "center",0,5500,10,0,15,0] call BIS_fnc_findSafePos;

[nil,nil,rTitleText,"A group of bandits have taken over a Medical Outpost! \nCheck your map for the location!", "PLAIN DOWN",15] call RE;

diag_log format ["AI Missions, easy event started, M1, A group of bandits have taken over a Medical Outpost!"];

_this1 = createMarker ["SAR_marker_M11", _coords];
_this1 setMarkeralpha 0
_this1 setMarkerText "Mission";
_this1 setMarkerShape "ELLIPSE";
_this1 setMarkerType "Flag";
_this1 setMarkerBrush "SolidBorder";
_this1 setMarkerSize [30, 30];
SAR_marker_M11 = _this1;

_this2 = createMarker ["SAR_marker_M12", _coords];
_this2 setMarkerColor "ColorYellow";
_this2 setMarkerText "Mission";
_this2 setMarkerShape "ELLIPSE";
_this2 setMarkerType "Flag";
_this2 setMarkerBrush "SolidBorder";
_this2 setMarkerSize [175, 175];
SAR_marker_M12 = _this2;

_Object1 = createVehicle ["US_WarfareBFieldhHospital_Base_EP1",[(_coords select 0) +2, (_coords select 1)+5,0.1],[], 0, "CAN_COLLIDE"];//Building
_Object1 setVariable ["Sarge",1,true];

_Object2 = createVehicle ["MASH_EP1",[(_coords select 0) - 24, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Building
_Object2 setVariable ["Sarge",1,true];

_Object3 = createVehicle ["MASH_EP1",[(_coords select 0) - 17, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Building
_Object3 setVariable ["Sarge",1,true];

_Object4 = createVehicle ["MASH_EP1",[(_coords select 0) - 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Building
_Object4 setVariable ["Sarge",1,true];

_Object5 = createVehicle ["UAZ_Unarmed_UN_EP1",[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object5 setFuel 0.5;
_Object5 setDamage 0.5;
_Object5 setVariable ["Sarge",1,true];
_Object5 setVariable ["AISpawned",true,true];

_Object6 = createVehicle ["HMMWV_DZ",[(_coords select 0) + 15, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object6 setFuel 0.5;
_Object6 setDamage 0.5;
_Object6 setVariable ["Sarge",1,true];
_Object6 setVariable ["AISpawned",true,true];

_crateMedicalSelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateMedical = createVehicle [_crateMedicalSelect,[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];//Crate
[_crateMedical] execVM "missions\misc\fillBoxesMedical.sqf";
_crateMedical setVariable ["Sarge",1,true];

_crateSmallSelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateSmall = createVehicle [_crateSmallSelect,[(_coords select 0) - 8, _coords select 1,0],[], 0, "CAN_COLLIDE"];//Crate
[_crateSmall] execVM "missions\misc\fillBoxesSmall.sqf";
_crateSmall setVariable ["Sarge",1,true];

[SAR_marker_M12,3,1,1,"patrol",false,900] call SAR_AI;
[SAR_marker_M12,3,0,1,"patrol",false,900] call SAR_AI;
[SAR_marker_M11,3,1,0,"fortify",false,900] call SAR_AI;

waitUntil{{isPlayer _x && _x distance _crateMedical < 8  } count playableunits > 0}; 

[nil,nil,rTitleText,"The Medical Outpost is under survivor control! \nMission objects will delete in 5 minutes. Crates will delete in 20 minutes!", "PLAIN DOWN",15] call RE;

_Object1 spawn {sleep 300;deleteVehicle _this;};
_Object2 spawn {sleep 300;deleteVehicle _this;};
_Object3 spawn {sleep 300;deleteVehicle _this;};
_Object4 spawn {sleep 300;deleteVehicle _this;};
_crateMedical spawn {sleep 1200;deleteVehicle _this;};
_crateSmall spawn {sleep 1200;deleteVehicle _this;};

deleteMarker "SAR_marker_M11";
deleteMarker "SAR_marker_M12";
MissionGoEasy = 0;

diag_log format ["AI Missions, easy event ENDED, M1"];

M1 = 1;
[0] execVM "Missions\Easy\MissionFinder.sqf";
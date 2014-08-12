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

_coords = [6896.1279, 11418.039];

[nil,nil,rTitleText,"Military intelligence reported that Bandits have secured a large supply of military weapons, medical equipment, \nand supplies at their base, to include a large supply of M136 RPGs!", "PLAIN DOWN",15] call RE;

diag_log format ["AI Missions, hard event started, M1, Military intelligence reported that Bandits have secured a large supply of military and medical equipment at their base."];

_this = createMarker ["SAR_marker_M1", _coords];
_this setMarkerColor "ColorRed";
_this setMarkerText "Mission";
_this setMarkerShape "ELLIPSE";
_this setMarkerType "Flag";
_this setMarkerBrush "SolidBorder";
_this setMarkerSize [200, 200];
SAR_marker_M1 = _this;

_crateMedicalSelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateMedical = createVehicle [_crateMedicalSelect,[6860,11431],[], 0, "CAN_COLLIDE"];//Crate
[_crateMedical] execVM "missions\misc\fillBoxesMedicalHard.sqf";
_crateMedical setVariable ["Sarge",1,true];

_crateSupplySelect1 = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateSupply1 = createVehicle [_crateSupplySelect1,[6865,11432],[], 0, "CAN_COLLIDE"];//Crate
[_crateSupply1] execVM "missions\misc\fillBoxesSupplyHard.sqf";
_crateSupply1 setVariable ["Sarge",1,true];

_crateSupplySelect2 = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateSupply2 = createVehicle [_crateSupplySelect2,[6867,11436],[], 0, "CAN_COLLIDE"];//Crate
[_crateSupply2] execVM "missions\misc\fillBoxesSupplyHard.sqf";
_crateSupply2 setVariable ["Sarge",1,true];

_crateHeavySelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateHeavy = createVehicle [_crateHeavySelect,[6870,11432],[], 0, "CAN_COLLIDE"];//Crate
[_crateHeavy] execVM "missions\misc\fillBoxesHeavy.sqf";
_crateHeavy setVariable ["Sarge",1,true];

_crateLauncherSelect = ["USLaunchersBox","RULaunchersBox","USVehicleBox","RUVehicleBox","USSpecialWeaponsBox","RUSpecialWeaponsBox","vil_RUweaponBoxSupport2000s"] call BIS_fnc_selectRandom;
_crateLauncher = createVehicle [_crateLauncherSelect,[6855,11433],[], 0, "CAN_COLLIDE"];//Crate
[_crateLauncher] execVM "missions\misc\fillBoxesLauncher.sqf";
_crateLauncher setVariable ["Sarge",1,true];

_Object1 = createVehicle ["HMMWV_DZ",[(_coords select 0) - 20, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];//Vehicle
_Object1 setFuel 0.5;
_Object1 setDamage 0.5;
_Object1 setVariable ["Sarge",1,true];
_Object1 setVariable ["AISpawned",true,true];

[SAR_marker_M1,3,false,300] call SAR_AI_heli;//Bandit

[SAR_marker_M1,3,0,2,"patrol",false,900] call SAR_AI;
[SAR_marker_M1,3,1,2,"patrol",false,900] call SAR_AI;
[SAR_marker_M1,3,1,2,"patrol",false,900] call SAR_AI;
[SAR_marker_M1,3,1,2,"fortify",false,900] call SAR_AI;

waitUntil{{isPlayer _x && _x distance _crateLauncher < 8  } count playableunits > 0}; 

[nil,nil,rTitleText,"The Bandit base has been taken over by survivors!  \nMission objects will delete in 5 minutes. Crates will delete in 20 minutes!", "PLAIN DOWN",15] call RE;

_crateMedical spawn {sleep 1200;deleteVehicle _this;};
_crateSupply1 spawn {sleep 1200;deleteVehicle _this;};
_crateSupply2 spawn {sleep 1200;deleteVehicle _this;};
_crateHeavy spawn {sleep 1200;deleteVehicle _this;};
_crateLauncher spawn {sleep 1200;deleteVehicle _this;};

deleteMarker "SAR_marker_M1";
MissionGoHard = 0;

M1 = 1;
[0] execVM "missions\Hard\MissionFinder.sqf";
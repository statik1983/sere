// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.0.0 
//  Author: Sarge (sarge@krumeich.ch) 
// ---------------------------------------------------------------------------------------------------------

 if (SAR_dynamic_spawning) then { // Doesnt work in my tests with HC
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[45,0,45],[0,0,0]],"SAR_area_0_0"] call SAR_AI_mon_upd; 	//Pintosa, Alma, Corda, Mercadio
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[45,0,45],[0,0,0]],"SAR_area_1_0"] call SAR_AI_mon_upd; 	//Verto, Medlina
_check = [["max_grps","rnd_grps","max_p_grp"],[[4,3,4],[75,70,85],[2,2,1]],"SAR_area_2_0"] call SAR_AI_mon_upd; 	//Calamar (main+south)
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[20,20,20],[0,0,1]],"SAR_area_3_0"] call SAR_AI_mon_upd; 	//Wilderness
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,1,1],[0,25,25],[0,0,1]],"SAR_area_4_0"] call SAR_AI_mon_upd; 	//Depot (Old Mines)
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[25,0,45],[0,0,0]],"SAR_area_5_0"] call SAR_AI_mon_upd;  //Chupinka

_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[25,0,35],[1,0,1]],"SAR_area_0_1"] call SAR_AI_mon_upd; 	//Drassen, Rago
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_1_1"] call SAR_AI_mon_upd; 	//Barro, Aguado - NO SPAWNS 
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[35,40,45],[2,1,2]],"SAR_area_2_1"] call SAR_AI_mon_upd; 	//Bilbado, Montehofo, Calamar (north)
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,2],[15,0,35],[1,0,1]],"SAR_area_3_1"] call SAR_AI_mon_upd; 	//Negroso, Lagosa, Prospero
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[35,0,35],[0,0,1]],"SAR_area_4_1"] call SAR_AI_mon_upd; 	//El Villon, Marcella, Monga
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,0,1],[35,0,35],[1,0,1]],"SAR_area_5_1"] call SAR_AI_mon_upd;  //Pikawas, Palida

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_2"] call SAR_AI_mon_upd; 	//Villa Oscura, Motodrom Rapido - NO SPAWNS
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,0,1],[45,0,35],[1,0,1]],"SAR_area_1_2"] call SAR_AI_mon_upd; 	//Los Peligron, Morada, OPEN WASTELAND
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,1],[35,30,35],[1,1,1]],"SAR_area_2_2"] call SAR_AI_mon_upd; 	//San Arluco (south), Aeropuerto Peligron, Pancho
_check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,2],[75,70,65],[2,2,2]],"SAR_area_3_2"] call SAR_AI_mon_upd; 	//Corazon, Checkpoint Sur
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,2,2],[45,50,55],[0,1,1]],"SAR_area_4_2"] call SAR_AI_mon_upd; 	//Victorin, SanVigado
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_2"] call SAR_AI_mon_upd; 	//WATER ONLY - NO SPAWNS

_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[45,30,45],[0,0,1]],"SAR_area_0_3"] call SAR_AI_mon_upd; 	//Pocobay, Benio, Pista
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[55,60,55],[2,1,1]],"SAR_area_1_3"] call SAR_AI_mon_upd; 	//Vidora, Mairango, Fernando, Elcanto
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,2],[50,50,50],[2,2,1]],"SAR_area_2_3"] call SAR_AI_mon_upd; 	//Mercielo, Guayucca, Tucos, San Arluco (north)
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,1],[65,60,75],[0,1,1]],"SAR_area_3_3"] call SAR_AI_mon_upd; 	//Calapedro, OPEN WASTELAND
_check = [["max_grps","rnd_grps","max_p_grp"],[[4,2,2],[75,60,55],[2,1,2]],"SAR_area_4_3"] call SAR_AI_mon_upd; 	//Maruko (south), Dump Yard
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_5_3"] call SAR_AI_mon_upd; 	//WATER ONLY - NO SPAWNS

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_4"] call SAR_AI_mon_upd; 	//East Island tip - NO SPAWNS
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,1],[75,75,75],[1,1,1]],"SAR_area_1_4"] call SAR_AI_mon_upd; 	//FOB Eddie, OPEN WASTELAND
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[65,50,55],[1,1,2]],"SAR_area_2_4"] call SAR_AI_mon_upd; 	//Aculto, Garibosa, Research Lab 101
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,2],[75,60,55],[1,2,1]],"SAR_area_3_4"] call SAR_AI_mon_upd; 	//San Isobel, Rommelo Raceway, Maruko airport (west)
_check = [["max_grps","rnd_grps","max_p_grp"],[[5,3,2],[75,70,65],[1,1,1]],"SAR_area_4_4"] call SAR_AI_mon_upd; 	//Maruko (north), Maruko airport (east)
_check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,0],[55,50,0],[2,1,0]],"SAR_area_5_4"] call SAR_AI_mon_upd; 	//NE Island (south)

_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_0_5"] call SAR_AI_mon_upd; 	//DEBUG ISLAND - NO SPAWNS
_check = [["max_grps","rnd_grps","max_p_grp"],[[3,2,1],[75,70,45],[2,2,1]],"SAR_area_1_5"] call SAR_AI_mon_upd; 	//Prison, OPEN WASTELAND
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,2,1],[75,70,60],[0,0,0]],"SAR_area_2_5"] call SAR_AI_mon_upd; 	//OPEN WASTELAND
_check = [["max_grps","rnd_grps","max_p_grp"],[[0,0,0],[0,0,0],[0,0,0]],"SAR_area_3_5"] call SAR_AI_mon_upd; 	//MAINLY WATER - NO SPAWNS
_check = [["max_grps","rnd_grps","max_p_grp"],[[1,1,0],[50,50,0],[0,0,0]],"SAR_area_4_5"] call SAR_AI_mon_upd; 	//SMALL NE ISLAND
_check = [["max_grps","rnd_grps","max_p_grp"],[[2,1,1],[45,40,35],[2,1,0]],"SAR_area_5_5"] call SAR_AI_mon_upd; 	//NE Island (north)
};

// ---------------------------------------------------------------
// Definition of area markers for static spawns
// ---------------------------------------------------------------

// All of Chernarus map      
_this = createMarker ["SAR_marker_chernarus", [7400, 8000]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [7400, 7000];
SAR_marker_chernarus = _this;

// Cherno
_this = createMarker ["SAR_marker_Cherno", [6743, 2581]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [400, 400];
SAR_marker_Cherno = _this;

// Elektro
_this = createMarker ["SAR_marker_Elektro", [10153, 2219]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [350, 350];
SAR_marker_Elektro = _this;

// Military HQ
_this = createMarker ["SAR_marker_militaryhq", [7262.8384, 3013.2295]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [70, 70];
SAR_marker_militaryhq = _this;

// Bandit HQ
_this = createMarker ["SAR_marker_bandithq", [6891.25, 11438]];
_this setMarkerShape "ELLIPSE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [100, 100];
SAR_marker_bandithq = _this;

// soutcoast, heli patrol area
_this = createMarker ["SAR_marker_helipatrol_southcoast", [7997, 2687]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [7000, 1300];
SAR_marker_helipatrol_southcoast = _this;
/*
// eastcoast, heli patrol area
_this = createMarker ["SAR_marker_helipatrol_eastcoast", [13304, 8220]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1200, 6000];
SAR_marker_helipatrol_eastcoast = _this;

// NWAF, heli patrol area
_this = createMarker ["SAR_marker_helipatrol_nwaf", [4525, 10292]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1500, 1000];
_this setMarkerDir 59.354115;
SAR_marker_helipatrol_nwaf = _this;

// NEAF, heli patrol area
_this = createMarker ["SAR_marker_helipatrol_neaf", [12034, 12725]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1000, 800];
SAR_marker_helipatrol_neaf = _this;

// West map, south to north, vehicle patrol area
_this = createMarker ["SAR_marker_vehiclepatrol_westside", [2782, 7378]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1200, 6000];
SAR_marker_vehiclepatrol_westside = _this;

// East map, sout to north, vehicle patrol area
_this = createMarker ["SAR_marker_vehiclepatrol_eastside", [10142, 7434]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [1200, 6000];
SAR_marker_vehiclepatrol_eastside = _this;

// North map, west to east, vehicle patrol area
_this = createMarker ["SAR_marker_vehiclepatrol_northside", [7533, 11851]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [6500, 1200];
SAR_marker_vehiclepatrol_northside = _this;
*/
//---------------------------------------------------------------------------------

diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];
_SAR_heliDelay1 = [] spawn 
	{
		 sleep random 3600; // 1 hour
		 private["_marker","_groupType"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		[SAR_marker_chernarus,_groupType,true,_respawn] call SAR_AI_heli;
	};
_SAR_heliDelay2 = [] spawn 
	{
		 sleep random 3600; // 1 hour
		  private["_marker","_groupType"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		[SAR_marker_chernarus,_groupType,true,_respawn] call SAR_AI_heli;
	};
_SAR_heliDelay3 = [] spawn 
	{
		 sleep random 3600; // 1 hour
		  private["_marker","_groupType"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		[SAR_marker_chernarus,_groupType,true,_respawn] call SAR_AI_heli;
	};
_SAR_heliDelay4 = [] spawn 
	{
		 sleep random 3600; // 1 hour
		  private["_marker","_groupType"];	 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		[SAR_marker_chernarus,_groupType,true,_respawn] call SAR_AI_heli;
	};
	
[SAR_marker_helipatrol_southcoast,1,true,false] call SAR_AI_heli;

diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];	

//---------------------------------------------------------------------------------

diag_log format["SAR_AI: Static spawning for ground patrols started"];
_SAR_groundDelay1 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 3);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay2 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 3);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;

};
_SAR_groundDelay3 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;

};
_SAR_groundDelay4 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;

};
_SAR_groundDelay5 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay6 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay7 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay8 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay9 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay10 = [] spawn 
{
		sleep random 60;
		 private["_groupType","_riflemen","_snipers"];		 
		_groupType = [1,2,3] call BIS_fnc_selectRandom;
		_respawn = floor(random 1200);
		_riflemen = floor(random 4);
		_snipers = floor(random 2);
		if (_riflemen < 1) then { _riflemen = 1};
		if (_snipers < 1) then { _snipers = 1};
		[SAR_marker_chernarus,_groupType,_snipers,_riflemen,"patrol",true,_respawn] call SAR_AI;
};
_SAR_groundDelay11 = [] spawn 
{
		sleep random 300;
		[SAR_marker_militaryhq,1,1,2,"patrol",true,900] call SAR_AI;			//++Soldier ground patrol
};
_SAR_groundDelay12 = [] spawn 
{
		[SAR_marker_bandithq,3,2,2,"patrol",true,900] call SAR_AI;				//--Bandit ground patrol
		sleep random 300;
};
_SAR_groundDelay13 = [] spawn 
{
		sleep random 1800;
		[SAR_marker_Cherno,3,3,0,"fortify",true,900] call SAR_AI;				//--Bandit ground patrol
};
diag_log format["SAR_AI: Static spawning for ground patrols finished"];

//---------------------------------------------------------------------------------

_SAR_vehDelay1 = [] spawn 
{
		sleep random 1800;
		[
			SAR_marker_chernarus,            								// Name of the area that the vehicle patrol will spawn in
			3,                                  								//--Bandit group
			["LandRover_MG_TK_EP1"],                      					// used vehicle  - anti air gun
			[[0,1,2]],                         	 							// Vehicle initial crew
			true,                              								// if this group should respawn or not
			1800                                								// wait time until this group will respawn
		] call SAR_AI_land;		
};
_SAR_vehDelay2 = [] spawn 
{
		sleep random 1800;
		[
			SAR_marker_chernarus,  											// Name of the area that the vehicle patrol will spawn in
			1,                                  								// Soldier group
			["HMMWV_Mk19_USArmy"],               							// used vehicle
			[[0,2,2]],                          								// Vehicle initial crew
			true,                              								// if this group should respawn or not
			1800                                									// wait time until this group will respawn
		] call SAR_AI_land;		
};
_SAR_vehDelay3 = [] spawn 
{
		sleep random 1800;
		[
			SAR_marker_chernarus,           									// Name of the area that the vehicle patrol will spawn in
			3,                                 									//--Bandit group
			["Offroad_DSHKM_TK_GUE_EP1"],          						// used vehicle
			[[0,1,2]],                          								// Vehicle initial crew
			true,                              								// if this group should respawn or not
			1800                                								// wait time until this group will respawn
		] call SAR_AI_land;		
};
_SAR_vehDelay4 = [] spawn 
{
		sleep random 1800;
		[
			SAR_marker_bandithq,   											// Name of the area that the vehicle patrol will spawn in
			3,                                  								//--Bandit group
			["UAZ_MG_TK_EP1"],              									// used vehicle
			[[0,1,2]],                          								// Vehicle initial crew
			true,                              								// if this group should respawn or not
			1800                               								// wait time until this group will respawn
		] call SAR_AI_land;		
};
_SAR_vehDelay5 = [] spawn 
{
		sleep random 1800;
		[
			SAR_marker_Cherno,            									// Name of the area that the vehicle patrol will spawn in
			1,                                  								// Soldier group
			["HMMWV_Armored_DZ"],                   							// used vehicle
			[[1,0,2]],                          								// Vehicle initial crew
			true,                              								// if this group should respawn or not
			1800                                								// wait time until this group will respawn
		] call SAR_AI_land;		
};
_SAR_vehDelay6 = [] spawn 
{
		sleep random 1800;
		[
			SAR_marker_chernarus,   											// Name of the area that the vehicle patrol will spawn in
			3,                                  								//--Bandit group
			["EPickup_PK_TERROR"],                 							// used vehicle
			[[1,0,1]],                          								// Vehicle initial crew
			true,                              								// if this group should respawn or not
			1800                                								// wait time until this group will respawn
		] call SAR_AI_land;		
};
diag_log format["SAR_AI: Static spawning for bandit vehicles ended"];
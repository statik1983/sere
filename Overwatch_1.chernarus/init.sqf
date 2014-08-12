if(isNil "paramsArray") then{ paramsArray=[0,0,0]};
if(paramsArray select 0 == 1) then{
	if(isServer) then{
		HCPresent = true;
		publicVariable "HCPresent";
	};
	if (!hasInterface && !isServer || !isDedicated) then{
		HCName = name player; 
		publicVariable "HCName";
	};
} else {
	if(isServer) then{
		HCPresent = false;
		HCName = "NOONE";
		publicVariable "HCPresent";
		publicVariable "HCName";
	};
};
if(!isServer) then {waitUntil{!isNull player}};
call compile preprocessfile "addons\SHK_pos\shk_pos_init.sqf";
	if (!hasInterface && !isServer && !isDedicated) then {
		call compile preprocessFileLineNumbers "addons\UPSMON\scripts\Init_UPSMON.sqf";
		call compile preprocessFileLineNumbers "headless_client\hc_compiles.sqf";
		call compile preprocessFileLineNumbers "headless_client\hc_variables.sqf";
		[] execVM "addons\SARGE\SAR_AI_init.sqf";
		[] execVM "addons\SARGE\SAR_init_Base_guards.sqf";
		fnc_hTime = compile preprocessFile "Missions\misc\fnc_hTime.sqf";
		MissionGoEasy = 0;
		MissionGoMedium = 0;
		MissionGoHard = 0;
		missionArray1 = ["M1","M2","M3","M4","M5"];
		[] execVM "missions\easy\MissionFinder.sqf";
		missionArray2 = ["M1","M2","M3","M4","M5","M6"];
		[] execVM "missions\medium\MissionFinder.sqf";
		missionArray3 = ["M1"];
		[] execVM "missions\hard\MissionFinder.sqf";
	};
//---
if (!isServer || !isDedicated && hasInterface) then { 
    "KRON_UPS_EAST_SURRENDED" addPublicVariableEventHandler { if (_this select 1) then { nul=[east] execvm "addons\UPSMON\scripts\UPSMON\MON_surrended.sqf";};};
	"KRON_UPS_WEST_SURRENDED" addPublicVariableEventHandler { if (_this select 1) then { nul=[west] execvm "addons\UPSMON\scripts\UPSMON\MON_surrended.sqf";};};
	"KRON_UPS_GUER_SURRENDED" addPublicVariableEventHandler { if (_this select 1) then { nul=[resistance] execvm "addons\UPSMON\scripts\UPSMON\MON_surrended.sqf";};};
	"MON_LOCAL_EXEC" addPublicVariableEventHandler { if (local ((_this select 1)select 0)) then {
		call ( compile format[(_this select 1)select 1,(_this select 1)select 0] );
		};
	};
    "adjustrating" addPublicVariableEventHandler {((_this select 1) select 0) addRating ((_this select 1) select 1);	};
}; 
if (isServer || hasInterface) then {
	startLoadingScreen ["","RscDisplayLoadCustom"];
	cutText ["","BLACK OUT"];
	enableSaving [false, false];
	dayZ_instance = 13287;
	dayZ_serverName = "SERE DayZ";
	dayzHiveRequest = [];
	initialized = false;
	dayz_previousID = 0;
	dayz_spawnselection = 1;
	dayz_spawnCrashSite_clutterCutter = 0;
	dayz_spawnInfectedSite_clutterCutter = 0;

	player setVariable ["BIS_noCoreConversations", true];

	call compile preprocessFileLineNumbers "DamiMods\variables.sqf";
	call compile preprocessFileLineNumbers "dayz_code\init\variables.sqf";
	progressLoadingScreen 0.1;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
	progressLoadingScreen 0.2;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
	progressLoadingScreen 0.4;
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";
	progressLoadingScreen 0.6;
	call compile preprocessFileLineNumbers "DamiMods\compiles.sqf";
	call compile preprocessFileLineNumbers "dayz_code\init\compiles.sqf";
	call compile preprocessFileLineNumbers "dayz_code\init\settings.sqf";
	progressLoadingScreen 1.0;

	"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

	dayz_spaceInterrupt = compile preprocessFileLineNumbers "scripts\dayz_spaceInterrupt.sqf";
};
if (isServer) then {
	dogOwner = [];
	execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated && hasInterface) then {
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	execFSM "DamiMods\Overwatch\player_monitor.fsm";  
	execVM "DamiMods\lights\tower_lights.sqf";
	execVM "DamiMods\lights\house_lights.sqf";
	execVM "DamiMods\lights\street_lights.sqf";
	execVM "scripts\custom_monitor.sqf";
//	execVM "HC_Debug.sqf";
};
if (!isNil "dayZ_serverName" && hasInterface) then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};
	[] execVM "scripts\markers.sqf";
	execVM "DamiMods\Lift\init.sqf";
	execVM "DamiMods\fixes\affects.sqf";
//	[] execVM "scripts\fog.sqf";

// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.5.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/#sarge-ai.131
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
//   SAR_setup_AI_patrol.sqf
//   last modified: 28.5.2013
// ---------------------------------------------------------------------------------------------------------
//  Parameters:
//  [ _patrol_area_name (Markername of area to patrol), 
//    grouptype (numeric -> 1=military, 2=survivor, 3=bandits),  
//    number_of_snipers (numeric),
//    number of riflemen (numeric),
//    behaviour (string -> "patrol", "fortify", "ambush", "noUpsmon") 
//    respawn (boolean, -> true,false)
//    respawn time (numeric -> seconds)
//   ]
// ------------------------------------------------------------------------------------------------------------


private ["_backpack","_unit","_backpacks","_unitname","_type","_patrol_area_name","_grouptype","_snipers","_riflemen","_action","_side","_unit_group","_riflemenlist","_sniperlist","_rndpos","_group","_unit","_cond","_respawn","_unit_weapon_names","_unit_items","_unit_tools","_soldier_weapon_names","_soldier_items","_soldier_tools","_sniper_weapon_names","_sniper_items","_sniper_tools","_unitskills","_riflemanskills","_sniperskills","_ups_para_list","_respawn_time","_argc","_ai_type"];



_backpacks = ["DZ_Patrol_Pack_EP1","DZ_Czech_Vest_Puch","DZ_Assault_Pack_EP1","DZ_British_ACU","DZ_TK_Assault_Pack_EP1","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];
_backpack = _backpacks call BIS_fnc_selectRandom;
//Setup custom eventhandlers and backpacks/loadouts

_unit = _this select 0;


_unit addBackpack _backpack;

if (!(_unit hasWeapon "NVGoggles") && random 1 > 0.5) then {
			_unit addWeapon "NVGoggles";
			_unit setVariable["removeNVG",1,false];
			if (DZAI_debugLevel > 1) then {diag_log "DZAI Extended Debug: Generated temporary NVGs for AI.";};
		};
		//Add edible items to backpack
		for "_i" from 1 to DZAI_bpedibles do {
			if ((random 1) < DZAI_chanceEdibles) then {
				private["_bpedible"];
				_bpedible = DZAI_Edibles call BIS_fnc_selectRandom;
				(unitBackpack _unit) addMagazineCargoGlobal [_bpedible, 1];
				if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Backpack Edible Item: %1 for AI.",_bpedible];};
			};
		};
		//Chance to add miscellaneous item (Small) to backpack
		for "_i" from 1 to DZAI_numMiscItemS do {
			if ((random 1) < DZAI_chanceMiscItemS) then {
				private ["_miscItemS"];
				_miscItemS = DZAI_MiscItemS call BIS_fnc_selectRandom;
				(unitBackpack _unit) addMagazineCargoGlobal [_miscItemS,1];
				if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Misc Item (Small): %1 for AI.",_miscItemS];};
			};
		};
		
		//Chance to add miscellaneous item (Large) to backpack
		for "_i" from 1 to DZAI_numMiscItemL do {
			if ((random 1) < DZAI_chanceMiscItemL) then {
				private["_miscItemL"];
				_miscItemL = DZAI_MiscItemL call BIS_fnc_selectRandom;
				(unitBackpack _unit) addMagazineCargoGlobal [_miscItemL,1];
				if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Misc Item (Large): %1 for AI.",_miscItemL];};
			};
		};

		//Add medical items to backpack
		for "_i" from 1 to DZAI_bpmedicals do {
			if ((random 1) < DZAI_chanceMedicals) then {
				private["_bpmedical"];
				_bpmedical = DZAI_Medicals2 call BIS_fnc_selectRandom;
				(unitBackpack _unit) addMagazineCargoGlobal [_bpmedical, 1];
				if (DZAI_debugLevel > 1) then {diag_log format["DZAI Extended Debug: Generated Backpack Medical Item: %1 for AI.",_bpmedical];};
			};
		};
		
		_unit addEventHandler ["Fired", {_this spawn ai_fired;}];
		_unit addEventHandler ["HandleDamage",{_this call fnc_damageAI;}];
		//_unit addEventHandler ["Killed",{_this call DZAI_unitDeath;}];
		_unit setVariable ["unithealth",[12000,0,0,false,false]];
		_unit setVariable ["unconscious",false];
		//_unit setVariable ["gethit",[0,0,0,0]];												// Set unit health
		_unit setVariable ["unconscious",false];
		_unit setVariable ["SargeAI",1,true];
		_nul = [_unit] spawn fnc_unit_resupply;
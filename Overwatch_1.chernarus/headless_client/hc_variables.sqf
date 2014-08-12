if (hasInterface || isServer || isDedicated) exitWith{};

	global_MilitaryVehicles = ["HMMWV","HMMWV_M2_DZ","HMMWV_M2_USArmy","LandRover_MG_TK_EP1","HMMWV_Armored_DZ","HMMWV_Mk19_USArmy",
									"M1030_US_DES_EP1","HMMWV_M1151_M2_DES_EP1"];
								
	global_BanditVehicles = ["HMMWV","HMMWV_M2_DZ","UAZ_MG_TK_EP1","EOffroad_DSHKM_TERROR","EPickup_PK_TERROR",
								"Offroad_DSHKM_TK_GUE_EP1","BTR40_MG_TK_INS_EP1","LandRover_MG_TK_EP1"];
	
	dayz_serverObjectMonitor = [];	
	
	dayz_disAudial = 0;
	dayz_disVisual = 0;
	
	//## DZAI ##
	DZAI_weaponNoise = 1.00;
	DZAI_zDetectRange = 100;	//Maximum distance for AI group leader to detect zombies. Increasing range beyond default may impact server performance. (Default: 200)
	DZAI_dmgFactors = [0.3375,0.50625,0.3375,1,1];				//AI health settings.
	DZAI_refreshRate = 15;	//Wait for loops
	DZAI_MiscItemL = ["ItemTankTrap","ItemWire","ItemSandbag","ItemTent", "ItemJerrycan", "PartWheel", "PartEngine", "PartFueltank", "PartGlass", "PartVRotor","PartWoodPile"]; //List of random miscellaneous items (>1 inventory space)
	DZAI_MiscItemS = ["ItemHeatpack", "HandRoadFlare", "HandChemBlue", "HandChemRed", "HandChemGreen","SmokeShell","SmokeShellGreen","SmokeShellGreen","FlareGreen_M203","FlareWhite_M203","1Rnd_Smoke_M203","FlareGreen_M203","FlareWhite_M203","1Rnd_Smoke_M203"]; //List of random miscellaneous items (1 inventory space)
	DZAI_Medicals2 = ["ItemPainkiller", "ItemMorphine", "ItemBandage", "ItemBloodbag", "ItemAntibiotic","ItemEpinephrine"]; //List of all medical items
	DZAI_Edibles = ["ItemSodaCoke", "ItemSodaPepsi", "ItemWaterbottle", "FoodCanSardines", "FoodCanBakedBeans", "FoodCanFrankBeans", "FoodCanPasta", "ItemWaterbottleUnfilled","ItemWaterbottleBoiled","FoodmuttonCooked","FoodchickenCooked","FoodBaconCooked","FoodRabbitCooked","FoodbaconRaw","FoodchickenRaw","FoodmuttonRaw","foodrabbitRaw","FoodCanUnlabeled","FoodPistachio","FoodNutmix","FoodMRE"]; //List of all edible items
	DZAI_bpmedicals = 1;
	DZAI_numMiscItemL = 1;
	DZAI_numMiscItemS = 2;
	DZAI_bpedibles = 1;
	DZAI_chanceMiscItemS = 0.60; //60% chance
	DZAI_chanceEdibles = 0.55;	 //55% chance etc.	
	DZAI_chanceMiscItemL = 0.15; //Chance to add random item from DZAI_MiscItemS table.
	DZAI_chanceMedicals = 0.40;
	DZAI_debugLevel = 0;
	DZAI_zombieEnemy = true;
	dayzNPC_areaAffect = 5;

	//#####THIS MEANS THEY ARE UNCONCIOUS: ** _unit getVariable ["unconscious",false] **
	DZAI_unconscious = {
	
		private ["_vehicle","_unit","_anim"];
		_unit = _this select 0;
		_hit = _this select 1;
		if ((animationState _unit) in ["amovppnemrunsnonwnondf","amovppnemstpsnonwnondnon","amovppnemstpsraswrfldnon","amovppnemsprslowwrfldf","aidlppnemstpsnonwnondnon0s","aidlppnemstpsnonwnondnon01"]) then {
			if (random 1 >= 0.4) then {
			_anim = "adthppnemstpsraswpstdnon_2";
			} else {
			_anim = "Die";
			};
		} else {
			_anim = "adthpercmstpslowwrfldnon_4";
		};
		_vehicle = (vehicle _unit);
		_inVehicle = (_vehicle != _unit);
		if (_inVehicle) then {
			_unit action ["EJECT", _vehicle];
			sleep 0.5;
		};
		_unit switchMove _anim;
		//_nul = [objNull, _unit, rSWITCHMOVE, _anim] call RE;  
		//diag_log "DEBUG :: AI unit is unconscious.";
		
		_sleep = if (_hit == "head_hit") then {((random 35) + 10)} else {((random 15) + 10)};
		//diag_log format ["DEBUG :: Knocked out AI %1 for %2 seconds.",_unit,_sleep];
		sleep _sleep;
		if (alive _unit) then {
			_nul = [objNull, _unit, rSWITCHMOVE, "amovppnemrunsnonwnondf"] call RE;
			sleep 0.5;
			_unit switchMove "amovppnemrunsnonwnondf";
			//diag_log "DEBUG :: AI unit is conscious.";
			_unit setVariable ["unconscious",false];
		};
	};

	//Killed eventhandler script used by both static and dynamic AI.
	DZAI_unitDeath = {
		private["_cnt","_inVehicle","_vehicle","_logic","_message","_killerName","_victimName","_distance","_weapon","_victim","_killer","_unitGroup"];
		_victim = _this select 0;
		//_killer = _this select 1;
		if (_victim getVariable ["deathhandled",false]) exitWith {};
		_victim setVariable ["deathhandled",true];
		_victim setDamage 1;
		_victim removeAllEventHandlers "HandleDamage";
		
		_unitGroup = (group _victim);

		//[_victim,_killer,_unitGroup] call fnc_banditAIKilled; work in later
		_vehicle = (vehicle _victim);
		_inVehicle = (_vehicle != _victim);
		_cnt = 10;
		while {_inVehicle || _cnt <= 0} do {
			_vehicle = (vehicle _victim);
			_inVehicle = (_vehicle != _victim);
			_victim action ["EJECT", _vehicle];
			//sleep 1;
			_cnt = _cnt - 1;
		};
		_victimName = typeOf _victim;
		[_victim] spawn DZAI_deathFlies;
		_victim setVariable["bodyName",_victimName,true];
		_victim setVariable["deathType","bled",true];
		//_victim setVariable["processedDeath",diag_tickTime, true];
		//Remove temporary NVGs.
		if ((_victim getVariable["removeNVG",0]) == 1) then {_victim removeWeapon "NVGoggles";}; //Remove temporary NVGs from AI.

	};
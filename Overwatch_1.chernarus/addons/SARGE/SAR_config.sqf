// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.5.2 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/#sarge-ai.131
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  (special version, the standard one will NOT work
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
// SAR_config.sqf - User adjustable config values
// last modified: 28.5.2013  
// ---------------------------------------------------------------------------------------------------------

// -----------------------------------------------
// enable or disable dynamic grid spawning
// -----------------------------------------------
SAR_dynamic_spawning = false;

// -----------------------------------------------
// enable or disable the AI debug monitor
// -----------------------------------------------

SAR_DEBUGMONITOR= false;
// -----------------------------------------------
// default values for dynamic grid spawning
// -----------------------------------------------

// maximum number of groups / grid
SAR_max_grps_bandits = 1;
SAR_max_grps_soldiers = 1;
SAR_max_grps_survivors = 1;

// chance for a group to spawn (1-100)
SAR_chance_bandits = 15;
SAR_chance_soldiers = 15;
SAR_chance_survivors = 15;

// maximum size of group (including Leader)
SAR_max_grpsize_bandits = 3;
SAR_max_grpsize_soldiers = 4;
SAR_max_grpsize_survivors = 3;


// -----------------------------------------------
// run fix for the issue that bandits cant travel in a vehicle with survivors EXPERIMENTAL, might not work 100% 
// -----------------------------------------------
SAR_FIX_VEHICLE_ISSUE = true;

// -----------------------------------------------
// modify AI behaviour
// -----------------------------------------------

// disable UPSMON AI behaviour - this means there will be no evasive/flanking, AI WILL follow players around the map outside of grids etc. EXPERIMENTAL
SAR_AI_disable_UPSMON_AI = false;

// enable / disable AI stealing vehicles - if you enable this, be sure to check KRON_UPS_searchVehicledist value below
SAR_AI_STEAL_VEHICLE = false;

// -----------------------------------------------
// Humanity values 
// -----------------------------------------------

// Humanity Value that gets substracted for a survivor or soldier AI kill
SAR_surv_kill_value = 200;

// Humanity Value that gets ADDED for a bandit AI kill
SAR_band_kill_value = 100;

// the humanity value below which a player will be considered hostile
SAR_HUMANITY_HOSTILE_LIMIT = -2500;

// -----------------------------------------------
// Track and show AI kills in the debug monitor of the player 
// -----------------------------------------------

// Log AI kills
SAR_log_AI_kills = false;


// -----------------------------------------------
// Show AI kills in sidechat
// -----------------------------------------------

// Send AI kills to sidechat
SAR_KILL_MSG = false;

// -----------------------------------------------
// AI XP system
// -----------------------------------------------

// Enable / disable AI xp system
SAR_AI_XP_SYSTEM = true;

// xp needed to reach this level
SAR_AI_XP_LVL_1 = 0;
// name of the level range
SAR_AI_XP_NAME_1 = "Rookie";
// armor specific for this level
SAR_AI_XP_ARMOR_1 = 0.75;        // values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90%

// xp needed to reach this level
SAR_AI_XP_LVL_2 = 8;
// name of the level range
SAR_AI_XP_NAME_2 = "Veteran";
// armor specific for this level
SAR_AI_XP_ARMOR_2 = 0.5;        // values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% 

// xp needed to reach this level
SAR_AI_XP_LVL_3 = 16;
// name of the level range
SAR_AI_XP_NAME_3 = "Legendary";
// armor specific for this level
SAR_AI_XP_ARMOR_3 = 0.4;        // values: 0 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% 

// -----------------------------------------------
// Special health values for specific units
// -----------------------------------------------

// values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% -  EXPERIMENTAL
SAR_leader_health_factor = 0.5;

// enable this for near invincible helicopters 
SAR_heli_shield = false;

// -----------------------------------------------
// respawning of groups & vehicles that are dynamically spawned in the grid system
// -----------------------------------------------
SAR_dynamic_group_respawn = false;

// time after which AI are respawned if configured (can be overwritten in the static AI calls)
SAR_respawn_waittime = 600; // default 30 seconds

// -----------------------------------------------
// Timeout values 
// -----------------------------------------------

// time after which DYNAMIC units and groups despawn after players have left the area/ dynamic grid
SAR_DESPAWN_TIMEOUT = 600; // 10 minutes

// time after which dead AI bodies are deleted 
SAR_DELETE_TIMEOUT = 600; // 10 minutes

// -----------------------------------------------
// System performance 
// -----------------------------------------------

// the max range in meters within AI is detecting Zombies and player bandits and makes them hostile - the bigger this value, the more CPU needed
SAR_DETECT_HOSTILE = 120;
SAR_DETECT_HOSTILE_ZOMBIE = 50;
// the max range in meters within AI is detecting player bandits from a vehicle, e.g. heli or land vehicle and makes them hostile - the bigger this value, the more CPU needed
SAR_DETECT_HOSTILE_FROM_VEHICLE = 240;

// the interval in seconds that an AI scans for new hostiles. The lower this value, the more accurate, but your server will see an impact. Recommended value: 15 
SAR_DETECT_INTERVAL = 10;

// the interval in seconds that an AI scans for new hostiles from WITHIN a vehicle. The lower this value, the more accurate, but your server will see an impact. Recommended value: 5 
SAR_DETECT_FROM_VEHICLE_INTERVAL = 5;

// the interval in seconds after that AI and AI in vehicles get new ammo and new fuel if needed
SAR_REAMMO_INTERVAL = 30;

// -----------------------------------------------
// Debug options
// -----------------------------------------------

// Show AI hits and kills by players in the rpt
SAR_HITKILL_DEBUG = false;

// Shows extra debug info in .rpt
SAR_DEBUG = false;

// careful with setting this, this shows a LOT, including the grid properties and definitions for every spawn and despawn event
SAR_EXTREME_DEBUG = false;

//
// SET THIS TO 0 to hide the group markers on the map and see the UPSMON group debug messages
// Possible values: 1 = enabled, 0 = disabled
KRON_UPS_Debug = 0;

//
// SET THIS TO 1 to see waypoints and pathfinding information in your rpt
// Possible values: 1 = enabled, 0 = disabled

KRON_UPS_WP_Debug = 0;

//
// SET THIS TO 1 to enable AI debugging in the rpt. You will be able to debug targets / enemy handling
// Possible values: 1 = enabled, 0 = disabled
KRON_UPS_AI_Debug = 0;


// Show AI ingame markers to see their xplevel, and logs to the rpt 
SAR_SHOW_XP_LVL = false;

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// Overwriting UPSMON standard values, so they dont have to be changed in the UPSMON package. Be careful with changing these.
//
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//Efective distance for doing perfect ambush (max distance is this x2)
KRON_UPS_ambushdist = 100;

//Frequency for doing calculations for each squad.
KRON_UPS_Cycle = 15; //org 20 , try to adjust for server performance

//Time that leader waits until doing another movement, this time reduced dynamically under fire, and on new targets
KRON_UPS_react = 60;

//Min time to wait for doing another reaction
KRON_UPS_minreact = 15; // org 30

//Max waiting is the maximum time patrol groups will wait when arrived to target for doing another target.
KRON_UPS_maxwaiting = (floor(random 60) + 1);

//Max waiting is the maximum time infantry patrol groups will wait when arrived at a waypoint before moving to the next waypoint. Air and land vehicles will move instantly to a new one.
KRON_UPS_wp_maxwaiting = (floor(random 60) + 1);

// how long AI units should be in alert mode after initially spotting an enemy
KRON_UPS_alerttime = 600;

// how close unit has to be to target to generate a new one target or to enter stealth mode
KRON_UPS_closeenough = 300; // if you have vast plain areas, increase this to sth around 150-300 

// if you are spotted by AI group, how close the other AI group have to be to You , to be informed about your present position. over this, will lose target
KRON_UPS_sharedist = 400;

// If enabled IA communication between them with radio defined sharedist distance, 0/2 
// (must be set to 2 in order to use reinforcement !R)
KRON_UPS_comradio = 0;

// Distance from destination for searching vehicles. (Search area is about 200m), 
// If your destination point is further than KRON_UPS_searchVehicledist, AI will try to find a vehicle to go there.
KRON_UPS_searchVehicledist = 350; // 700, 900  

//Sides that are enemies of resistance // DO NOT CHANGE THIS
KRON_UPS_Res_enemy = [east];

// knowsAbout 0 - 4 to add this enemy to the  "target list" (1-4) the higher number the less detect ability (original in 5.0.7 was 0.5)
// it does not mean the AI will not shoot at you. This means: what must be KNOWN about you to allow the AI to share that information
//
// If you set this higher, only the AI that spotted you will shoot at you, the rest of the group will not know where you are.
// If you set this lower, the AI share your position earlier and all of the group attack you earlier.
//
// Recommended values:  0.4 -> hard!
//
//                      1.0 -> medium
//
//                      2.5 -> easy
//
R_knowsAboutEnemy = 0.9;

//
// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//
// definition of classes and weapon loadouts
//

//
// type of soldier lists, only allowed DayZ classes listed. adjust if you run rmod or another map that allows different classes
//
// IMPORTANT: The leader types must be different to each other! So you need 3 different leader types here!

// military AI
SAR_leader_sold_list = ["Rocket_DZ"]; // the potential classes of the leader of a soldier group
SAR_sniper_sold_list = ["Sniper1_DZ","Sniper2_DZ","Sniper3_DZ","Sniper4_DZ","Sniper5_DZ","Sniper6_DZ"]; // the potential classes of the snipers of a soldier group
SAR_soldier_sold_list = ["Soldier1_DZ","USMC_Soldier","Camo15_DZ","Camo21_DZ","Camo23_DZ","Camo17_DZ","Camo20_DZ","Camo7_DZ","Camo21_DZ","Camo23_DZ"]; // the potential classes of the riflemen of a soldier group

// bandit AI
SAR_leader_band_list = ["Camo8_DZ"]; // the potential classes of the leader of a bandit group
SAR_sniper_band_list = ["Sniper1_DZ","Sniper2_DZ","Sniper3_DZ","Sniper4_DZ","Sniper5_DZ","Sniper6_DZ"]; // the potential classes of the snipers of a bandit group
SAR_soldier_band_list = ["Camo24_DZ","Camo25_DZ","Camo26_DZ","Bandit1_DZ","BanditW1_DZ","Camo27_DZ","Camo3_DZ","Camo5_DZ","Mercenary_Default5"]; // the potential classes of the riflemen of a bandit group

// survivor AI
SAR_leader_surv_list = ["Survivor3_DZ"]; // the potential classes of the leaders of a survivor group
SAR_sniper_surv_list = ["Worker1","Worker2","Worker3","Worker4"]; // the potential classes of the snipers of a survivor group
SAR_soldier_surv_list = ["Survivor2_DZ","SurvivorW2_DZ","Citizen2"]; // the potential classes of the riflemen of a survivor group

// ---------------------------------------------------------------------------------------------------------------------
// Skills for all possible units
// ---------------------------------------------------------------------------------------------------------------------

//
// military AI
//

// Leader
SAR_leader_sold_skills = [

    ["aimingAccuracy",0.35, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.65, 0.20],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.80, 0.20],
    ["courage",       0.80, 0.20],
    ["reloadSpeed",   0.80, 0.20],
    ["commanding",    0.80, 0.20],
    ["general",       0.80, 0.20]

];

// rifleman
SAR_soldier_sold_skills  = [

    ["aimingAccuracy",0.25, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.55, 0.20],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.65, 0.30],
    ["spotTime",      0.40, 0.20],
    ["endurance",     0.60, 0.20],
    ["courage",       0.60, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.60, 0.20],
    ["general",       0.60, 0.20]

];

// Sniper
SAR_sniper_sold_skills = [

    ["aimingAccuracy",0.50, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.50, 0.20],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.75, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.70, 0.20],
    ["general",       0.70, 0.20]

];

//
// bandit AI
//

// Leader
SAR_leader_band_skills = [

    ["aimingAccuracy",0.35, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.65, 0.20],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.70, 0.20],
    ["general",       0.70, 0.20]

];
// Rifleman
SAR_soldier_band_skills = [

    ["aimingAccuracy",0.25, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.55, 0.20],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.50, 0.20],
    ["endurance",     0.50, 0.20],
    ["courage",       0.50, 0.20],
    ["reloadSpeed",   0.50, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.50, 0.20]

];
// Sniper
SAR_sniper_band_skills = [

    ["aimingAccuracy",0.50, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.50, 0.20],
    ["aimingSpeed",   0.65, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]

];


//
// survivor AI
//

// Leader
SAR_leader_surv_skills = [

    ["aimingAccuracy",0.35, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.55, 0.20],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.50, 0.30],
    ["spotTime",      0.45, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.50, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.50, 0.20]

];
// Rifleman
SAR_soldier_surv_skills = [

    ["aimingAccuracy",0.25, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.45, 0.20],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.55, 0.30],
    ["spotTime",      0.30, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.40, 0.20],
    ["reloadSpeed",   0.40, 0.20],
    ["commanding",    0.40, 0.20],
    ["general",       0.40, 0.20]

];
// Sniper
SAR_sniper_surv_skills = [

    ["aimingAccuracy",0.45, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.55, 0.20],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.60, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]

];


// ---------------------------------------------------------------------------------------------------------------------
// Weapon & Item Loadout
// ---------------------------------------------------------------------------------------------------------------------

// a general note: you CAN use either rifles OR pistols. Do not use both. AI will get stuck after switching weapons.

// military

// potential weapon list for leaders
SAR_sold_leader_weapon_list = ["RH_acrbglacog","AKS_74_UN_kobra","M8_carbineGL","RH_ctar21m","AKS_GOLD","SCAR_H_CQC_CCO","SCAR_H_STD_EGLM_Spect","M8_carbine","BAF_L85A2_RIS_SUSAT","RH_ctar21mgl","AKS_74_kobra","BAF_L85A2_UGL_ACOG","Remington870_lamp","BAF_L85A2_UGL_Holo","G36C_camo","VIL_HK416_Eot","FN_FAL","VIL_HK416_Aim","bizon_silenced","VIL_HK416_EDR","Sa58V_RCO_EP1","VIL_HK417s","M4A1_HWS_GL_camo","VIL_M70","Bizon","VIL_MPi","M4A3_RCO_GL_EP1","VIL_PMIS","VIL_AEK_23","M4A1_HWS_GL_SD_Camo","RH_masaim","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1","MP5SD","M4A3_CCO_EP1","G36K_camo","m16a4_acg","M4A1_AIM_SD_camo","BAF_L85A2_UGL_SUSAT","SCAR_H_CQC_CCO_SD","M8_compact","RH_acrbglaim"];
SAR_Guard_sold_leader_weapon_list = ["SCAR_H_STD_EGLM_Spect"];
SAR_sold_leader_pistol_list = [];   

// potential item list for leaders -> Item / Chance 1 - 100
SAR_sold_leader_items = [["equip_scrapelectronics",30],["equip_floppywire",15],["ItemSodaPepsi",20],["FoodCanBakedBeans",20],["Skin_Camo1_DZ",3],["ItemTent",2],["ItemPainkiller",3],["ItemBloodbag",10],["ItemBandage",10],["HandRoadFlare",5],["ItemTankTrap",3],["HandGrenade_west",15],["SmokeShellGreen",8],["1Rnd_HE_M203",8],["30Rnd_9x19_UZI",8],["30Rnd_762x39_SA58",8],["1Rnd_Smoke_M203",7],["30Rnd_545x39_AK",7],["17Rnd_9x19_glock17",5],["5Rnd_127x99_as50",8]];
SAR_sold_leader_tools = [["ItemMap",10],["ItemCompass",10],["NVGoggles",25],["ItemRadio",25],["ItemMatchbox",5]];

//potential weapon list for riflemen
SAR_sold_rifleman_weapon_list = ["BAF_L110A1_Aim","Mk_48_DES_EP1","AKS_74_U","VIL_Mg3","VIL_FnMag","FHQ_ACR_BLK_CCO_GL","skaVIL_M60","VIL_AMD","RH_ctar21","RH_hk417s","RH_mas","BAF_L86A2_ACOG","Pecheneg","AK_47_S","Sa58V_EP1","VIL_M64","Mk_48_DZ","FHQ_ACR_BLK_CCO","M1014","FHQ_ACR_BLK_CCO_SD","MG36_camo","BAF_L110A1_Aim","FHQ_ACR_TAN_CCO","M16A4_ACG_GL","FHQ_ACR_WDL_IRN","LeeEnfield","FHQ_ACR_BLK_RCO_SD","AKS_74_pso","FHQ_ACR_TAN_HWS_SD","MP5A5","FHQ_ACR_WDL_G33","AK_74","FHQ_ACR_TAN_RCO","M16A2","FHQ_ACR_WDL_HWS_GL","m240_scoped_EP1","FHQ_ACR_WDL_HAMR_SD","AK_47_M","FHQ_ACR_TAN_RCO_SD","Winchester1866","VIL_HK33","M16A4_GL","VIL_Galil","G36C_camo","VIL_Galil_arm","FN_FAL_ANPVS4","RH_m1stacog","SCAR_L_CQC_CCO_SD","M16A2GL","SCAR_L_STD_Mk4CQT","G36A_camo","Saiga12K","RPK_74","SCAR_L_STD_HOLO","M136","M249_DZ","M4A1_Aim","M240_DZ","MR43","Sa58P_EP1","PK"];
SAR_Guard_sold_rifleman_weapon_list =["Sa58V_EP1"];
SAR_sold_rifleman_pistol_list = [];    

// potential item list for riflemen
SAR_sold_rifleman_items = [["equip_scrapelectronics",5],["equip_floppywire",3],["ItemSodaCoke",20],["FoodCanPasta",20],["Skin_Soldier1_DZ",5],["Skin_Camo15_DZ",3],["Skin_Camo16_DZ",3],["100Rnd_762x54_PK",4],["30Rnd_556x45_Stanag",5],["30Rnd_556x45_StanagSD",4],["30Rnd_762x39_AK47",5],["ItemMorphine",5],["100Rnd_556x45_BetaCMag",5],["HandChemGreen",15],["PipeBomb",3],["FoodSteakCooked",5],["ItemSandbag",5],["SmokeShellGreen",8],["30Rnd_556x45_G36",5],["200Rnd_556x45_M249",5],["8Rnd_B_Beneli_Pellets",5],["8Rnd_B_Beneli_74Slug",5],["100Rnd_762x51_M240",5]];
SAR_sold_rifleman_tools = [["ItemMap",10],["ItemToolbox",10],["ItemFlashlightRed",10],["ItemEtool",5],["ItemGPS",5],["Binocular",10],["MeleeCrowbar",10],["NVGoggles",25],["ItemRadio",25]];

//potential weapon list for snipers
SAR_sold_sniper_weapon_list = ["BAF_AS50_scoped","BAF_AS50_TWS","vil_SVDK","BAF_LRR_scoped","SCAR_H_LNG_Sniper_SD","M8_sharpshooter","ussr_cheytacM200","m107","M4SPR","RH_m14","M24","RH_m14aim","M14_EP1","KSVK","gms_k98","SVD_CAMO","gms_k98_rg","VIL_SVD_P21","M24_des_EP1","VIL_SR25","VIL_M24B","VIL_M40A3","VIL_M110","VIL_SVU","SCAR_H_LNG_Sniper","VSS_vintorez","FHQ_MSR_DESERT","Huntingrifle","FHQ_XM2010_DESERT","SVD","SVD_NSPU_EP1","vil_SKS","M40A3","FHQ_RSASS_TAN","DMR","ussr_cheytacM200_SD"];
SAR_Guard_sold_sniper_weapon_list = ["M24"];
SAR_sold_sniper_pistol_list = [];   

// potential item list for snipers
SAR_sold_sniper_items = [["equip_scrapelectronics",5],["equip_floppywire",5],["ItemSodaMdew",20],["FoodCanSardines",20],["Skin_Sniper1_DZ",5],["20Rnd_762x51_DMR",5],["10Rnd_762x54_SVD",5],["ItemEpinephrine",5],["ItemAntibiotic",10],["HandChemGreen",10],["ItemHeatPack",5],["TrapBear",6],["SmokeShellGreen",10],["ItemWaterbottle",10],["8Rnd_9x18_MakarovSD",5],["10Rnd_127x99_M107",10],["5Rnd_127x99_as50",10]];
SAR_sold_sniper_tools = [["ItemMap",10],["ItemHatchet",10],["ItemFlashlight",10],["ItemKnife",10],["ItemWatch",10],["Binocular_Vector",10]];

//
// survivors
//

// potential weapon list for leaders
SAR_surv_leader_weapon_list = ["RH_acrbglacog","AKS_74_UN_kobra","M8_carbineGL","RH_ctar21m","AKS_GOLD","SCAR_H_CQC_CCO","SCAR_H_STD_EGLM_Spect","M8_carbine","BAF_L85A2_RIS_SUSAT","RH_ctar21mgl","AKS_74_kobra","BAF_L85A2_UGL_ACOG","Remington870_lamp","BAF_L85A2_UGL_Holo","G36C_camo","VIL_HK416_Eot","FN_FAL","VIL_HK416_Aim","bizon_silenced","VIL_HK416_EDR","Sa58V_RCO_EP1","VIL_HK417s","M4A1_HWS_GL_camo","VIL_M70","Bizon","VIL_MPi","M4A3_RCO_GL_EP1","VIL_PMIS","VIL_AEK_23","M4A1_HWS_GL_SD_Camo","RH_masaim","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1","MP5SD","M4A3_CCO_EP1","G36K_camo","m16a4_acg","M4A1_AIM_SD_camo","BAF_L85A2_UGL_SUSAT","SCAR_H_CQC_CCO_SD","M8_compact","RH_acrbglaim"];
SAR_Guard_surv_leader_weapon_list = [];
SAR_surv_leader_pistol_list = [];   

// potential item list for leaders -> Item / Chance 1 - 100
SAR_surv_leader_items = [["equip_scrapelectronics",15],["equip_floppywire",5],["ItemSodaPepsi",12],["FoodCanFrankBeans",15],["Skin_Camo1_DZ",5],["ItemTent",3],["ItemPainkiller",8],["ItemBloodbag",5],["ItemBandage",20],["HandRoadFlare",20],["ItemTankTrap",5],["HandGrenade_west",3],["SmokeShellBlue",5],["1Rnd_HE_M203",5],["30Rnd_9x19_UZI",10],["30Rnd_762x39_SA58",10],["1Rnd_Smoke_M203",7],["30Rnd_545x39_AK",7],["17Rnd_9x19_glock17",5]];
SAR_surv_leader_tools = [["ItemMap",15],["ItemCompass",15],["NVGoggles",3],["ItemRadio",3],["ItemMatchbox",5]];

//potential weapon list for riflemen
SAR_surv_rifleman_weapon_list = ["BAF_L110A1_Aim","Mk_48_DES_EP1","AKS_74_U","VIL_Mg3","VIL_FnMag","FHQ_ACR_BLK_CCO_GL","skaVIL_M60","VIL_AMD","RH_ctar21","RH_hk417s","RH_mas","BAF_L86A2_ACOG","Pecheneg","AK_47_S","Sa58V_EP1","VIL_M64","Mk_48_DZ","FHQ_ACR_BLK_CCO","M1014","FHQ_ACR_BLK_CCO_SD","MG36_camo","BAF_L110A1_Aim","FHQ_ACR_TAN_CCO","M16A4_ACG_GL","FHQ_ACR_WDL_IRN","LeeEnfield","FHQ_ACR_BLK_RCO_SD","AKS_74_pso","FHQ_ACR_TAN_HWS_SD","MP5A5","FHQ_ACR_WDL_G33","AK_74","FHQ_ACR_TAN_RCO","M16A2","FHQ_ACR_WDL_HWS_GL","m240_scoped_EP1","FHQ_ACR_WDL_HAMR_SD","AK_47_M","FHQ_ACR_TAN_RCO_SD","Winchester1866","VIL_HK33","M16A4_GL","VIL_Galil","G36C_camo","VIL_Galil_arm","FN_FAL_ANPVS4","RH_m1stacog","SCAR_L_CQC_CCO_SD","M16A2GL","SCAR_L_STD_Mk4CQT","G36A_camo","Saiga12K","RPK_74","SCAR_L_STD_HOLO","M136","M249_DZ","M4A1_Aim","M240_DZ","MR43","Sa58P_EP1","PK"];
SAR_Guard_surv_rifleman_weapon_list = [];
SAR_surv_rifleman_pistol_list = [];    

// potential item list for riflemen
SAR_surv_rifleman_items = [["equip_scrapelectronics",5],["equip_floppywire",2],["ItemSodaCoke",20],["FoodCanPasta",20],["Skin_Soldier1_DZ",3],["Skin_Camo15_DZ",3],["Skin_Camo16_DZ",3],["100Rnd_762x54_PK",4],["30Rnd_556x45_Stanag",7],["30Rnd_556x45_StanagSD",4],["30Rnd_762x39_AK47",5],["ItemMorphine",10],["100Rnd_556x45_BetaCMag",6],["HandChemBlue",15],["PipeBomb",2],["FoodSteakCooked",8],["ItemSandbag",5],["SmokeShellBlue",5],["30Rnd_556x45_G36",5],["200Rnd_556x45_M249",5],["8Rnd_B_Beneli_Pellets",5],["8Rnd_B_Beneli_74Slug",5],["100Rnd_762x51_M240",5]];
SAR_surv_rifleman_tools = [["ItemMap",20],["ItemToolbox",15],["ItemFlashlightRed",25],["ItemEtool",9],["ItemGPS",9],["Binocular",15],["MeleeCrowbar",20]];

//potential weapon list for snipers
SAR_surv_sniper_weapon_list = ["vil_SVDK","BAF_LRR_scoped","SCAR_H_LNG_Sniper_SD","M8_sharpshooter","ussr_cheytacM200","m107","M4SPR","RH_m14","M24","RH_m14aim","M14_EP1","KSVK","gms_k98","SVD_CAMO","gms_k98_rg","Crossbow","VIL_SVD_P21","M24_des_EP1","VIL_SR25","VIL_M24B","VIL_M40A3","VIL_M110","VIL_SVU","SCAR_H_LNG_Sniper","VSS_vintorez","FHQ_MSR_DESERT","Huntingrifle","FHQ_XM2010_DESERT","SVD","SVD_NSPU_EP1","vil_SKS","M40A3","FHQ_RSASS_TAN","DMR","ussr_cheytacM200_SD"];
SAR_Guard_surv_sniper_weapon_list = [];
SAR_surv_sniper_pistol_list = [];   

// potential item list for snipers
SAR_surv_sniper_items = [["equip_scrapelectronics",2],["equip_floppywire",2],["ItemSodaMdew",20],["FoodCanSardines",15],["Skin_Sniper1_DZ",5],["20Rnd_762x51_DMR",5],["10Rnd_762x54_SVD",5],["ItemEpinephrine",10],["ItemAntibiotic",15],["HandChemBlue",10],["ItemHeatPack",8],["TrapBear",10],["SmokeShellBlue",10],["ItemWaterbottle",10],["15Rnd_9x19_M9SD",5],["8Rnd_9x18_MakarovSD",5],["10Rnd_127x99_M107",10],["5Rnd_127x99_as50",10]];
SAR_surv_sniper_tools = [["ItemMap",15],["ItemHatchet",20],["ItemFlashlight",20],["ItemKnife",8],["ItemWatch",15],["Binocular_Vector",10]];

//
// bandits
//

// potential weapon list for leaders
SAR_band_leader_weapon_list = ["RH_acrbglacog","AKS_74_UN_kobra","M8_carbineGL","RH_ctar21m","AKS_GOLD","SCAR_H_CQC_CCO","SCAR_H_STD_EGLM_Spect","M8_carbine","BAF_L85A2_RIS_SUSAT","RH_ctar21mgl","AKS_74_kobra","BAF_L85A2_UGL_ACOG","Remington870_lamp","BAF_L85A2_UGL_Holo","G36C_camo","VIL_HK416_Eot","FN_FAL","VIL_HK416_Aim","bizon_silenced","VIL_HK416_EDR","Sa58V_RCO_EP1","VIL_HK417s","M4A1_HWS_GL_camo","VIL_M70","Bizon","VIL_MPi","M4A3_RCO_GL_EP1","VIL_PMIS","VIL_AEK_23","M4A1_HWS_GL_SD_Camo","RH_masaim","BAF_L85A2_RIS_Holo","Sa58V_CCO_EP1","MP5SD","M4A3_CCO_EP1","G36K_camo","m16a4_acg","M4A1_AIM_SD_camo","BAF_L85A2_UGL_SUSAT","SCAR_H_CQC_CCO_SD","M8_compact","RH_acrbglaim"];
SAR_Guard_band_leader_weapon_list = [];
SAR_band_leader_pistol_list = [];   

// potential item list for leaders -> Item / Chance 1 - 100
SAR_band_leader_items = [["equip_scrapelectronics",30],["equip_floppywire",15],["ItemSodaPepsi",20],["FoodCanBakedBeans",20],["Skin_Camo1_DZ",8],["ItemTent",5],["ItemPainkiller",5],["ItemBloodbag",10],["ItemBandage",15],["HandRoadFlare",15],["ItemTankTrap",5],["HandGrenade_west",15],["SmokeShellRed",10],["1Rnd_HE_M203",8],["30Rnd_9x19_UZI",10],["30Rnd_762x39_SA58",10],["1Rnd_Smoke_M203",7],["30Rnd_545x39_AK",7],["17Rnd_9x19_glock17",5],["5Rnd_127x99_as50",10]];
SAR_band_leader_tools = [["ItemMap",10],["ItemCompass",10],["NVGoggles",25],["ItemRadio",25],["ItemMatchbox",9]];

//potential weapon list for riflemen
SAR_band_rifleman_weapon_list = ["BAF_L110A1_Aim","Mk_48_DES_EP1","AKS_74_U","VIL_Mg3","VIL_FnMag","FHQ_ACR_BLK_CCO_GL","skaVIL_M60","VIL_AMD","RH_ctar21","RH_hk417s","RH_mas","BAF_L86A2_ACOG","Pecheneg","AK_47_S","Sa58V_EP1","VIL_M64","Mk_48_DZ","FHQ_ACR_BLK_CCO","M1014","FHQ_ACR_BLK_CCO_SD","MG36_camo","BAF_L110A1_Aim","FHQ_ACR_TAN_CCO","M16A4_ACG_GL","FHQ_ACR_WDL_IRN","LeeEnfield","FHQ_ACR_BLK_RCO_SD","AKS_74_pso","FHQ_ACR_TAN_HWS_SD","MP5A5","FHQ_ACR_WDL_G33","AK_74","FHQ_ACR_TAN_RCO","M16A2","FHQ_ACR_WDL_HWS_GL","m240_scoped_EP1","FHQ_ACR_WDL_HAMR_SD","AK_47_M","FHQ_ACR_TAN_RCO_SD","Winchester1866","VIL_HK33","M16A4_GL","VIL_Galil","G36C_camo","VIL_Galil_arm","FN_FAL_ANPVS4","RH_m1stacog","SCAR_L_CQC_CCO_SD","M16A2GL","SCAR_L_STD_Mk4CQT","G36A_camo","Saiga12K","RPK_74","SCAR_L_STD_HOLO","M136","M249_DZ","M4A1_Aim","M240_DZ","MR43","Sa58P_EP1","PK"];
SAR_Guard_band_rifleman_weapon_list = [];
SAR_band_rifleman_pistol_list = [];    

// potential item list for riflemen
SAR_band_rifleman_items = [["equip_scrapelectronics",5],["equip_floppywire",3],["ItemSodaCoke",20],["FoodCanPasta",20],["Skin_Soldier1_DZ",5],["Skin_Camo15_DZ",3],["Skin_Camo16_DZ",3],["100Rnd_762x54_PK",4],["30Rnd_556x45_Stanag",7],["30Rnd_556x45_StanagSD",4],["30Rnd_762x39_AK47",5],["ItemMorphine",10],["100Rnd_556x45_BetaCMag",6],["HandChemRed",25],["PipeBomb",4],["FoodSteakCooked",10],["ItemSandbag",3],["SmokeShellRed",10],["30Rnd_556x45_G36",5],["200Rnd_556x45_M249",5],["8Rnd_B_Beneli_Pellets",5],["8Rnd_B_Beneli_74Slug",5],["100Rnd_762x51_M240",5]];
SAR_band_rifleman_tools = [["ItemMap",10],["ItemToolbox",5],["ItemFlashlightRed",15],["ItemEtool",5],["ItemGPS",5],["Binocular",10],["MeleeCrowbar",15],["NVGoggles",25],["ItemRadio",25]];

//potential weapon list for snipers
SAR_band_sniper_weapon_list = ["BAF_AS50_scoped","BAF_AS50_TWS","vil_SVDK","BAF_LRR_scoped","SCAR_H_LNG_Sniper_SD","M8_sharpshooter","ussr_cheytacM200","m107","M4SPR","RH_m14","M24","RH_m14aim","M14_EP1","KSVK","gms_k98","SVD_CAMO","gms_k98_rg","Crossbow","VIL_SVD_P21","M24_des_EP1","VIL_SR25","VIL_M24B","VIL_M40A3","VIL_M110","VIL_SVU","SCAR_H_LNG_Sniper","VSS_vintorez","FHQ_MSR_DESERT","Huntingrifle","FHQ_XM2010_DESERT","SVD","SVD_NSPU_EP1","vil_SKS","M40A3","FHQ_RSASS_TAN","DMR","ussr_cheytacM200_SD"];
SAR_Guard_band_sniper_weapon_list = [];
SAR_band_sniper_pistol_list = [];

// potential item list for snipers
SAR_band_sniper_items = [["equip_scrapelectronics",3],["equip_floppywire",2],["ItemSodaMdew",20],["FoodCanSardines",20],["Skin_Sniper1_DZ",5],["20Rnd_762x51_DMR",5],["10Rnd_762x54_SVD",5],["ItemEpinephrine",10],["ItemAntibiotic",10],["HandChemRed",15],["ItemHeatPack",10],["TrapBear",6],["SmokeShellRed",10],["ItemWaterbottle",10],["15Rnd_9x19_M9SD",5],["8Rnd_9x18_MakarovSD",5],["10Rnd_127x99_M107",10],["5Rnd_127x99_as50",10]];
SAR_band_sniper_tools = [["ItemMap",10],["ItemHatchet",10],["ItemFlashlight",20],["ItemKnife",5],["ItemWatch",10],["Binocular_Vector",10]];



// ---------------------------------------------------------------------------------------------------------------------
// heli patrol definiton
// ---------------------------------------------------------------------------------------------------------------------

// define the type of heli(s) you want to use here for the heli patrols - make sure you include helis that have minimum 2 gunner positions, anything else might fail
//SAR_heli_type=["UH1H_DZ","Mi17_DZ"];
//SAR_heli_type=["MH60S"];
SAR_heli_type=["UH1H_DZ","UH1Y_DZ","CH_47F_BAF","CH_47F_EP1","UH60M_DZ","Mi17_DZ"];
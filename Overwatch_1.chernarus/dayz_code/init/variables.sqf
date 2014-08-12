
//####----####----####---- Base Building 1.3 Start ----####----####----####

/****************************************************** These Settings Can Be Edited ******************************************************/
/********************************** For more information on these settings, view 'Configuration ReadMe' ***********************************/
/***************************************************************** Admins *****************************************************************/
	BBSuperAdminAccess			= ["76561198015750716"]; //Replace with your high level admin playerUIDs for base building (High level admins have access to all functions of all BB items, even if they don't belong to them)
	BBLowerAdminAccess			= ["76561198048340729","76561198083365313","76561198097541241"]; // iankiller99, kitsune, alex- Replace with your lower level admin playerUIDs for base building (Low level admins can only remove items that don't belong to them)

/************************************************************* Flag Settings **************************************************************/
	BBTypeOfFlag				= "FlagCarrierBIS_EP1"; //Type of flag Base Building 1.3 will use, you can select any of the flags from the BBAllFlagTypes array (default is FlagCarrierBIS_EP1)
	BBAllFlagTypes			= ["FlagCarrierBAF","FlagCarrierBIS_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierCDF_EP1","FlagCarrierCDFEnsign_EP1","FlagCarrierCzechRepublic_EP1","FlagCarrierGermany_EP1","FlagCarrierINDFOR_EP1","FlagCarrierUSA_EP1"];//DO NOT REMOVE ITEMS FROM THIS ARRAY, you can ADD a flag type if you want a different flag, you will also need to add a picture for it to missionFolder\buildRecipeBook\images\buildable\! You will also need to add it to the safeObjects array below and to your database!
	BBMaxPlayerFlags			= 2; //This sets how many flags a player can be added to, default is 3
	BBFlagRadius				= 200; //This sets the build radius around a flag, default is 200

/********************************************************* Removal Chance Settings ********************************************************/
	BBtblProb					= 30; //Base chance level for loosing toolbox
	BBlowP						= 100; //Base lower chance level for failing to remove item
	BBmedP						= 100; //Base medium chance level for failing to remove item
	BBhighP					= 100; //Base high chance level for failing to remove item
	
/**************************************************** Zombie Shield Generator Settings ****************************************************/
	BBEnableZShield			= 1; //Enable toggleable zombie shield generator/ 1 = Enabled // 0 = Disabled (If disabled, players can still build shield generators, they just wont do anything)
	BBTypeOfZShield			= "CDF_WarfareBUAVterminal"; //Type of object used for Zombie Shield, included this only in case some maps have this object banned
	BBAllZShieldTypes		= ["CDF_WarfareBUAVterminal"]; //DO NOT REMOVE ITEMS FROM THIS ARRAY, you can ADD an object class if you want a different building to be used as a Zombie Shield Generator!
	BBMaxZShields				= 1; //Maximum number of zombie shield generators a player can be added to, default is 1
	BBZShieldRadius			= 100; //Radius for Base Build zombie shield generator, default is 50
	BBZShieldClean			= 0; //Delete Zombies when they enter active shield radius/ 1 = Enabled // 0 = Disabled (If disabled, zombies will be killed but not deleted, could lead to zombie loot farming)
	BBZShieldDis				= 1; //Limits the distance shield generators can be built from flags to (BBFlagRadius - BBZShieldRadius)/ 1 = Enabled // 0 = Disabled (If you reduce the flag radius, you may need to disable this)

/********************************************************* Miscellaneous Settings *********************************************************/
	BBAIGuards				= 1; //Sarge AI Base Guards/ 1 = Enabled // 0 = Disabled (Requires Sarge AI)
	BBUseTowerLights			= 1; //Enable toggleable tower lighting/ 1 = Enabled // 0 = Disabled (If you run AxeMan's tower lighting on your server, read the instructions on how to modify it)
	BBTowerLightsNGen		= true; //Require generator for base building tower lighting?
	BBCustomDebug				= "debugMonitor"; //Change debugMonitor to whatever variable your custom debug uses, this allows Base Building to hide the debug monitor where needed
	//BBCustomDebugS			= [] spawn fnc_debug; //Change to whatever your debug monitor uses to activate, this allows Base Building to restore the debug monitor if it closed it
	
	//If you add items to the build list, you also need to add them to the SafeObjects array. Remember you will also need to add them to your database for them to be saved.
	SafeObjects = ["Land_Wall_Gate_Kolchoz","Land_komin","Land_Campfire","Land_Misc_deerstand","Land_ladder",
"Grave","Concrete_Wall_EP1","Infostand_2_EP1","WarfareBDepot","Base_WarfareBBarrier10xTall",
"WarfareBCamp","Base_WarfareBBarrier10x","Land_fortified_nest_big","Land_Fort_Watchtower","Land_fort_rampart_EP1",
"Land_HBarrier_large","Land_fortified_nest_small","Land_BagFenceRound","Land_fort_bagfence_long","Land_Misc_Cargo2E",
"Misc_Cargo1Bo_military","Ins_WarfareBContructionSite","Land_pumpa","Land_CncBlock","Misc_cargo_cont_small_EP1",
"Land_prebehlavka","Fence_corrugated_plate","ZavoraAnim","Land_tent_east","Land_CamoNetB_EAST","Land_CamoNetB_NATO",
"Land_CamoNetVar_EAST","Land_CamoNetVar_NATO","Land_CamoNet_EAST","Land_CamoNet_NATO","Fence_Ind_long","Fort_RazorWire",
"Fence_Ind","HeliHCivil","Land_Misc_Cargo1D","Land_arrows_desk_L","Land_arrows_desk_R","Land_A_FuelStation_Build",
"Land_A_FuelStation_Shed","Land_CncBlock_Stripes","Land_coneLight","Land_Fire_barrel_burning", "Land_Ind_IlluminantTower",
"Land_Ind_SawMillPen", "Land_Ind_TankSmall2_EP1", "Land_radar", "Land_RedWhiteBarrier", "Land_vez", "Land_leseni4x",
"SearchLight", "SignM_UN_Base_EP1", "Sign_Danger", "CampEast_EP1", "Land_Barrack2_EP1", "Land_Hlidac_Budka_EP1",
"Land_Barrack2", "Land_Hangar_2", "Land_Wall_Gate_Ind1_L", "Land_fort_bagfence_round", "Land_fort_bagfence_corner",
"Hhedgehog_concreteBig", "Land_hruzdum", "RoadBarrier_long", "Land_A_Castle_Bastion","Land_A_Castle_Bergfrit",
"Land_A_Castle_Donjon", "Land_A_Castle_Gate", "Land_A_Castle_Stairs_A", "Land_A_Castle_Wall1_20", "Land_A_Castle_Wall1_Corner",
"Land_A_Castle_Wall1_End", "Land_A_Castle_Wall2_30", "Land_A_Castle_Wall2_Corner", "Land_A_Castle_Wall2_End",
"Land_Shed_wooden", "TentStorage", "Hedgehog_DZ", "Sandbag1_DZ", "BearTrap_DZ", "Wire_cat1", "StashSmall", "StashMedium",
"DomeTentStorage", "CamoNet_DZ", "Trap_Cans", "TrapTripwireFlare", "TrapBearTrapSmoke", "TrapTripwireGrenade", "TrapTripwireSmoke",
"TrapBearTrapFlare","Misc_Cargo1B_military","RoadBarrier_light","Camp","MASH","PARACHUTE_TARGET","Land_WoodenRamp",
"Mi8Wreck","76n6ClamShell","Barrack2","Land_fort_artillery_nest","Land_fort_rampart","Land_covering_hut_big_EP1","Land_Shed_Ind02",
"Land_water_tank","Land_a_stationhouse","WarfareBAirport","Land_Barn_W_02","Land_ConcreteRamp","Land_Dam_Barrier_40",
"Land_dum_istan3_hromada2","Land_hut_old02","Land_majak2","Land_majak_podesta","land_nav_pier_c","land_nav_pier_c_90",
"land_nav_pier_c_270","land_nav_pier_c_big","land_nav_pier_C_L10","land_nav_pier_C_R","land_nav_pier_C_R10","land_nav_pier_C_R30",
"land_nav_pier_c_t15","land_nav_pier_c_t20","land_nav_pier_c2","land_nav_pier_c2_end","land_nav_pier_m_1","land_nav_pier_m_end",
"PowerGenerator_EP1","CDF_WarfareBUAVterminal","FlagCarrierBAF","FlagCarrierBIS_EP1","FlagCarrierBLUFOR_EP1","FlagCarrierCDF_EP1",
"FlagCarrierCDFEnsign_EP1","FlagCarrierCzechRepublic_EP1","FlagCarrierGermany_EP1","FlagCarrierINDFOR_EP1","FlagCarrierUSA_EP1",
"Red_Light_Blinking_EP1","Land_Ind_Expedice_2","Land_Nav_Boathouse_PierT","Land_Fire_barrel","MAP_asf3_0_2000","MAP_b_betulaHumilis",
"MAP_b_craet2","MAP_brana02nodoor","MAP_Gate_IndVar2_5","MAP_Ind_SideRoof","MAP_Misc_WindBreak","MAP_Nav_Boathouse_PierL",
"MAP_NAV_Lighthouse","MAP_Ohrada_popelnice","MAP_Ohrada_popelnice_roh","MAP_plot_istan1_rovny_bezs","MAP_plot_istan1_rovny_short",
"MAP_plot_istan3","MAP_plot_istan3_short","MAP_R2_Rock1","MAP_R2_RockTower","MAP_R2_RockWall","MAP_ramp_concrete","MAP_runway_poj_draha",
"MAP_runway_poj_L_2","MAP_runway_poj_spoj","MAP_sign_danger","MAP_t_acer2s","MAP_t_alnus2s","MAP_t_betula1f","MAP_t_betula2f","MAP_t_betula2s",
"MAP_t_betula2w","MAP_t_fagus2f","MAP_t_fraxinus2s","MAP_t_larix3s","MAP_t_malus1s","MAP_t_picea1s","MAP_t_picea2s","MAP_t_picea3f","MAP_t_pinusN2s",
"MAP_t_pinusS2f","MAP_t_populus3s","MAP_t_quercus2f","MAP_t_quercus3s","MAP_t_salix2s","MAP_t_sorbus2s","MAP_Wall_CBrk_5","MAP_Wall_CGry_5",
"MAP_Wall_CYel_5","MAP_Wall_Gate_Ind1_L","MAP_Wall_Gate_Ind1_R","MAP_Wall_Gate_Ind2A_L","MAP_Wall_Gate_Ind2A_R","MAP_Wall_Gate_Ind2B_L",
"MAP_Wall_Gate_Ind2B_R","MAP_Wall_IndCnc_4","MAP_Wall_IndCnc2_3","MAP_Wall_IndVar1_5_2","MAP_Wall_IndVar2_5","MAP_zed_civil","MAP_zidka_branka",
"MAP_zidka02","MAP_posed","MAP_Camo_Box","MAP_Pristresek","MAP_Fortress_02","MAP_tent2_west","MAP_tent_east","MAP_tent_small_west","MAP_tent_west",
"MAP_Ind_SiloVelke_01","MAP_Ind_SiloVelke_02","MAP_leseni2x","MAP_LadderHalf","USBasicAmmunitionBox"];
/******************************************************** END OF EDITABLE SETTINGS ********************************************************/

//Daimyo Custom Variables
	//Strings
	globalSkin 			= "";
	//Arrays
	allbuildables_class = [];
	allbuildables 		= [];
	allbuild_notowns 	= [];
	allremovables 		= [];
	wallarray 			= [];
	structures			= [];
	CODEINPUT 			= [];
	keyCode 			= [];
	globalAuthorizedUID = [];
	//Booleans
	remProc 			= false;
	procBuild 			= false;
	hasBuildItem 		= false;
	keyValid 			= false;
	removeObject		= false;
	addUIDCode			= false;
	removeUIDCode		= false;
	buildReposition		= false;
	//Other
	currentBuildRecipe 	= 0;
	bbCDReload			= 0; //This is used to reload custom debug monitors where needed

//EXTENDED BASE BUILDING
        baseBuildingExtended=true;
        rotateDir = 0;
        objectHeight=0;
        objectDistance=0;
        objectParallelDistance=0;
        rotateIncrement=30;
		rotateIncrementSmall=10;
        objectIncrement=0.3;
		objectIncrementSmall=0.1;
        objectTopHeight=60;
        objectLowHeight=-60;
        maxObjectDistance=30;
        minObjectDistance=-6;
		
//Base Building Keybinds
	DZ_BB_E  = false; //Elevate
	DZ_BB_L  = false; //Lower
	DZ_BB_Es = false; //Elevate Small
	DZ_BB_Ls = false; //Lower Small
	DZ_BB_Rl = false; //Rotate Left
	DZ_BB_Rr = false; //Rotate Right
	DZ_BB_Rls= false; //Rotate Left Small
	DZ_BB_Rrs= false; //Rotate Right Small
	DZ_BB_A  = false; //Push Away
	DZ_BB_N  = false; //Pull Near
	DZ_BB_Le = false; //Move Left
	DZ_BB_Ri = false; //Move Right
//####----####----####---- Base Building 1.3 End ----####----####----####

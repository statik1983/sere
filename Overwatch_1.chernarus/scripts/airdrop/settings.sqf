////////////////////settings/////////////////////////
//admins UID goes here "62917638"
_Is_Admin		= ["76561198015750716"];
//your scripts path
_thePath		= "scripts\airdrop\";
// Time in seconds before player can drop again, default 300=5min, set to 15 minutes
_dropCooldown	= 30;
// Combat Check mode // 2= 1.8+ code // 1= before 1.8code // 0= off //note that Combat check for 1.8+ code is very annoying //
_InCombMode		= 0;
//Items (Magazine) to enable drop, besides toolbox and GPS     
_kitItem1		= "equip_scrapelectronics";
_kitItem2		= "equip_floppywire";
//Broadcast "descrete" hint to all players when someone calls a drop? (false = only caller)
_BCast			=  true;
//Delete box?
_Del_Box		=  false; 
//Delete admin box?
_Del_aBox		= false; 
//Time in sec before box deletes (add 60sec for plane del), 20 minutes
_Del_BoxTime	= 1200; 
//Countdown to autodrop if player does not have drop control, 3 minutes
_ADVDroptimeOut	= 180; 
//Clear Vehicle Inventory?
_Clr_VehInv		=  true; 
//item to activate adv. debug and drop control
_RCitem			= "ItemRadio"; 
//Only one bag! Backpack in admin drop, just change to what you want
_baGType		= "DZ_Backpack_EP1"; 
//add extra keykits to admin drop? (epoch, other mods set to false)
_akeYKits		=  false; 
_keYKits		= 5; 
// Weapons in admin box
_wepcount		= 3; 
// Amount of Magazines in admin box
_magcount		= 20; 
//Vehcle drop settings, first the list of vehicles you do want, you can also use
//"Car", "Truck" or similar instead to only drop cars and trucks.
//Default is "LandVehicle","Air", which is all land and air vehicles
_TheVehList		= ["LandVehicle"];
//This is a list of vehicles you don't want
_TheVehNogoList = ["BIS_Steerable_Parachute","ParachuteBase"];      
//Change plane/heli here
//Note that choppers are prone to blow up randomly! 
//Also i changed the an2 to always switch to mv22 in the_box_car.sqf
_planeheli = [
"MV22_DZ"
];
//Start positions
_start_pos = [
[1125.287,1204.707,300],
[13320,1910.344,300],
[14335.53,4530.272,300],
[14701.79,9441.72,300],
[-872.4781,7401.674,300],
[6910.474,15233.44,300]
];
//HALV drop content, just add the name of item twice if you want more, do some math to get the amount you want
//2 of each weapon/item
_HALVw2List = ["ItemMachete","ItemCrowbar","ItemCompass","ItemFlashlightRed","ItemGPS","ItemRadio","ItemKnife","ItemHatchet","ItemMatchbox","ItemEtool","ItemToolbox"];
//20 of each "magazines"
_HALVm20List = ["ItemBandage","FoodSteakCooked","ItemSodaPepsi","ItemHeatPack","ItemWaterbottle","FoodCanPasta","FoodMRE"];
//10 of each "magazines"
_HALVm10List = ["Laserbatteries","ItemSodaMdew","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","SmokeShell","SmokeShellRed","SmokeShellYellow","SmokeShellGreen","ItemSodaRabbit","HandChemGreen","HandChemBlue","HandChemRed","HandRoadFlare"];
//5 of each "magazines"
_HALVm5List = ["ItemAntibiotic","ItemWire","PartWoodPile","ItemTankTrap","ItemSandbag","ItemBloodbag","ItemPainkiller","ItemMorphine"];
//2 of each "magazines"
_HALVm2List = ["equip_scrapelectronics","equip_rope","ItemCamoNet","ItemDomeTent","PartGlass","PartFueltank","PartWheel","PartEngine","PartGeneric","ItemJerrycan","equip_hose","equip_duct_tape","equip_nails"];
//1 of each "magazines"
_HALVm1List = ["PartVRotor","equip_crate"];

//10 of each "magazines" for donator building supplies
_BuildingSupply10List = ["equip_scrapelectronics","equip_rope","ItemCamoNet","PartGlass","PartGeneric","equip_duct_tape","equip_nails","ItemWire","PartWoodPile","ItemTankTrap","ItemSandbag","equip_crate","equip_wood_pallet","equip_metal_sheet","equip_brick"];
//5 of each "magazines" for donator building supplies
_BuildingSupply5List = ["ItemJerrycan","HandGrenade_West","ItemGenerator"];

//Change boxes here
_THEboxes = [
"BAF_OrdnanceBox",
"USBasicWeaponsBox",
"USBasicAmmunitionBox",
"USBasicWeapons_EP1",
"USBasicAmmunitionBox_EP1",
"UNBasicWeapons_EP1",
"UNBasicAmmunitionBox_EP1",
"TKSpecialWeapons_EP1",
"TKBasicWeapons_EP1",
"TKBasicAmmunitionBox_EP1",
"SpecialWeaponsBox",
"RUSpecialWeaponsBox",
"RUBasicWeaponsBox",
"RUBasicAmmunitionBox",
"LocalBasicWeaponsBox",
"LocalBasicAmmunitionBox",
"GuerillaCacheBox_EP1",
"GuerillaCacheBox",
"GERBasicWeapons_EP1",
"CZBasicWeapons_EP1",
"BAF_BasicAmmunitionBox",
"BAF_BasicWeapons",
"USSpecialWeaponsBox",
"USSpecialWeapons_EP1",
"vil_RUammoBoxBasic2000s",
"vil_RUweaponBoxSupport2000s",
"vil_US_weaponsboxnew",
"vil_US_weaponsboxold",
"vil_USMC_weaponsboxnew",
"RHm14box",
"RHpistammobox",
"vil_mix_weaponsBox",
"vil_BW_weaponsBox",
"vil_EU_weaponsBox",
"vil_MiddleEastweaponBox",
"vil_RUweaponBoxSpeznas"
];

///////////////End of settings area///////////////
//this is the box it drops initially drops, just leave these
_DROPbox = [
"Misc_cargo_cont_net1",
"USVehicleBox",
"RUVehicleBox",
"Misc_cargo_cont_tiny",
"Misc_cargo_cont_small2",
"Misc_cargo_cont_small_EP1"
];
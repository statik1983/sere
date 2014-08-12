/*
	Written by 
	Dami
*/
_cfgvehicles = configFile >> "cfgVehicles";

//List of vehicles that can tow towable objects.
TOWING_capableVehicles = [];
//Adds all Land vehicles.
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if !(_veh_type isKindOf "StaticWeapon") then {
			if !(_veh_type isKindOf "TT650_Base") then {
				if !(_veh_type isKindOf "Old_moto_base") then {
					if !(_veh_type isKindOf "Old_bike_base_EP1") then {
						if !(_veh_type isKindOf "ATV_Base_EP1") then {
							if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
								TOWING_capableVehicles = TOWING_capableVehicles + [_veh_type];
							};
						};
					};
				};
			};
		};
	};
};
//List of vehicles you don't want to give the towing ability to.
TOWING_capableVehicles = TOWING_capableVehicles - ["CH_47F_EP1_DZE","UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","UH1Y_DZE","HMMWV_M998A2_SOV_DES_EP1_DZE","HMMWV_M1151_M2_CZ_DES_EP1_DZE","LandRover_Special_CZ_EP1_DZE","LandRover_MG_TK_EP1_DZE","ArmoredSUV_PMC_DZE","Offroad_DSHKM_Gue_DZE","Pickup_PK_GUE_DZE","Pickup_PK_INS_DZE","Pickup_PK_TK_GUE_EP1_DZE","UAZ_MG_TK_EP1_DZE","MMT_Civ","Old_bike_TK_INS_EP1","TT650_Civ","TT650_Ins","TT650_TK_CIV_EP1","ATV_US_EP1","ATV_CZ_EP1","M1030_US_DES_EP1","Old_moto_TK_Civ_EP1","tractor","S1203_ambulance_EP1","S1203_TK_CIV_EP1","HMMWV_M1035_DES_EP1","HMMWV_Ambulance","HMMWV_Ambulance_CZ_DES_EP1","HMMWV_DES_EP1","HMMWV_DZ","LandRover_CZ_EP1","LandRover_TK_CIV_EP1","hilux1_civil_3_open_EP1","hilux1_civil_1_open","hilux1_civil_2_covered","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","Skoda","SkodaBlue","SkodaGreen","SkodaRed","VolhaLimo_TK_CIV_EP1","Volha_1_TK_CIV_EP1","Volha_2_TK_CIV_EP1","VWGolf","car_hatchback","car_sedan","GLT_M300_LT","GLT_M300_ST","Lada1","Lada2","Lada1_TK_CIV_EP1","Lada2_TK_CIV_EP1","LadaLM","SUV_Blue","SUV_Camo","SUV_Charcoal","SUV_Green","SUV_Orange","SUV_Pink","SUV_Red","SUV_Silver","SUV_TK_CIV_EP1","SUV_White","SUV_Yellow","UAZ_CDF","UAZ_INS","UAZ_RU","UAZ_Unarmed_TK_CIV_EP1","UAZ_Unarmed_TK_EP1","UAZ_Unarmed_UN_EP1","AN2_DZ","GNT_C185","GNT_C185U","GNT_C185R","GNT_C185C","Mi17_Civilian_DZ","AH6X_DZ","MH6J_DZ","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP"];

//List of objects that are towable.
TOWING_TowableObjects = [];
//---
//Adds all Air/Sea/Land vehicles.
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if ((_veh_type isKindOf "Air")||(_veh_type isKindOf "Ship")||(_veh_type isKindOf "LandVehicle")) then {
			if !(_veh_type isKindOf "StaticWeapon") then {
				if ((getNumber (_vehicle >> "scope") == 2) && !((_veh_type isKindOf "ParachuteBase")||(_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
					TOWING_TowableObjects = TOWING_TowableObjects + [_veh_type];
				};
			};
		};
	};
};
//List of vehicles you don't want to be towable by towing capable objects.
TOWING_TowableObjects = TOWING_TowableObjects - ["UAZ_Unarmed_TK_EP1","UAZ_Unarmed_TK_CIV_EP1","UAZ_Unarmed_UN_EP1","UAZ_RU","ATV_US_EP1","ATV_CZ_EP1","SkodaBlue","Skoda","SkodaGreen","TT650_Ins","TT650_TK_EP1","TT650_TK_CIV_EP1","Old_bike_TK_CIV_EP1","Old_bike_TK_INS_EP1","hilux1_civil_3_open","Ikarus_TK_CIV_EP1","Ikarus","Tractor","S1203_TK_CIV_EP1","V3S_Civ","UralCivil","car_hatchback","Fishing_Boat","PBX","Smallboat_1","Volha_2_TK_CIV_EP1","Volha_1_TK_CIV_EP1","SUV_TK_CIV_EP1","car_sedan","hilux1_civil_3_open_EP1","UralCivil2","LandRover_CZ_EP1","BW_Ikarus1","BW_Ikarus2","kpfs_golf_g","kpfs_golf_p","kpfs_golf_post","kpfs_golf_tk","Lada1_GDR","Lada2_GDR","Lada2_TK_CIV_EP1","Lada4_GDR","Lada5_GDR","TT650_Civ","TT650_Gue","MTVR","M1030_US_DES_EP1","smallboat_2","Post_bike_E","BAF_Offroad_D","BAF_Offroad_W","datsun1_civil_3_open","Fishing_Boat_DZ","PBX_DZ","datsun1_civil_2_covered","GAZ_Vodnik","hilux1_civil_1_open","hilux1_civil_2_covered","Lada","Lada1","Lada1_TK_CIV_EP1","LadaLM","LandRover_TK_CIV_EP1","MMT_Civ","Old_moto_TK_Civ_EP1","RHIB2Turret_DZ","S1203_ambulance_EP1","SkodaRed","Smallboat_1_DZ","Smallboat_2_DZ","TowingTractor","VWGolf","VolhaLimo_TK_CIV_EP1","UralRefuel_INS","Ural_INS","HMMWV_DES_EP1","HMMWV_DZ","ibr_as350lingor","ibr_as350_pmc","ibr_as350_pol","JetSkiYanahui_Case_Yellow","JetSkiYanahui_Case_Green","JetSkiYanahui_Case_Blue","JetSkiYanahui_Case_Red","JetSkiYanahui_Yellow","JetSkiYanahui_Green","JetSkiYanahui_Blue","JetSkiYanahui_Red_DZ","JetSkiYanahui_Green_DZ","C185_DZ","C185F_DZ","C185E_DZ","HMMWV_M1151_M2_DES_EP1","BTR40_MG_TK_INS_EP1","SUV_Armored_DZ","Moved_to_309","UAZ_MG_TK_EP1","Pickup_PK_GUE","350z_black_DZ","350z_blue_DZ","350z_green_DZ","350z_kiwi_DZ","350z_pink_DZ","350z_white_DZ","350z_yellow_DZ","Civcar_DZ","civcarbl_DZ","Civcarbu_DZ","Civcarge_DZ","Civcarre_DZ","Civcarsl_DZ","Civcarwh_DZ","CPD_DZ","CPD_U_DZ","350z_cream_DZ","HMMWV_M2_DZ","HMMWV_Armored_DZ","MTVR_DZ","Ural_CDF_DZ","KamazReammo_DZ","KamazRefuel_DZ","UAZ_MG_CDF","HMMWV_Mk19_USArmy","350z_white","Offroad_DSHKM_INS","HMMWV_Armored","Zodiac","KamazOpen","Civcarre","SUV_DZ","JetSkiYanahui","Lada2","V3S_Refuel_TK_GUE_EP1","HMMWV","Pickup_PK_INS","Kamaz","Pickup_PK_TK_GUE_EP1","JetSkiYanahui_Red","Ural_UN_EP1","Ural_TK_CIV_EP1","tractorOld","civcarbl","datsun1_civil_1_open","LandRover_MG_TK_INS_EP1","JetSkiYanahui_White","M1030","350z_pink","350z","JetSkiYanahui_Case_Green2","Ural_CDF","HMMWV_MK19_DES_EP1","UAZ_CDF","EPickup_PK_TERROR","BTR40_MG_TK_GUE_EP1","MtvrRefuel_DES_EP1","Offroad_DSHKM_TK_GUE_EP1","350z_mod","SUV_TK_EP1","V3S_Open_TK_EP1","HMMWV_M1151_M2_CZ_DES_EP1","UAZ_INS","UralOpen_CDF","350z_red","Offroad_DSHKM_Gue","HMMWV_M2","350z_gold","V3S_TK_EP1","policecar","Civcar","Civcarge","Civcarsl","Copcarhw","V3S_Open_TK_CIV_EP1","350z_city","350z_green","LandRover_MG_TK_EP1","SUV_PMC_BAF","V3S_TK_GUE_EP1","HMMWV_M2_USArmy","ArmoredSUV_PMC","KamazRefuel"];
//---

//List of helicopters that can lift liftable objects.
LIFTING_capableHelis = [];
//Adds all helicopters.
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if !(_veh_type in LIFTING_capableHelis) then {
			if (_veh_type isKindOf "Helicopter") then {
				if !(_veh_type isKindOf "StaticWeapon") then {
					if ((getNumber (_vehicle >> "scope") == 2) && !((_veh_type isKindOf "ParachuteBase")||(_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
						LIFTING_capableHelis = LIFTING_capableHelis + [_veh_type];
					};
				};
			};
		};
	};
};
//List of helis you don't want to give the lifting ability to.
LIFTING_capableHelis = LIFTING_capableHelis - ["UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","CSJ_GyroP","CSJ_GyroCover","GyroC_DZ","CSJ_GyroC","Mi17_Civilian_DZ","AH6X_DZ","MH6J_DZ","AH6J_EP1","GNT_C185","GNT_C185U","GNT_C185R","GNT_C185C"];

//Objects that can be lifted by helicopters.
LIFTING_liftableObjects = [];
//Adds all Sea/Land vehicles.
for "_i" from 0 to (count _cfgvehicles)-1 do
{
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_veh_type = configName _vehicle;
		if !(_veh_type in LIFTING_liftableObjects) then {
			if ((_veh_type isKindOf "LandVehicle")||(_veh_type isKindOf "Ship")) then {
				if !(_veh_type isKindOf "StaticWeapon") then {
					if ((getNumber (_vehicle >> "scope") == 2) && !((_veh_type isKindOf "ParachuteBase")||(_veh_type isKindOf "BIS_Steerable_Parachute"))) then {
						LIFTING_liftableObjects = LIFTING_liftableObjects + [_veh_type];
					};
				};
			};
		};
	};
};
//List of vehicles you don't want to be liftable.
LIFTING_liftableObjects = LIFTING_liftableObjects - ["CH_47F_EP1_DZE","UH1H_DZE","Mi17_DZE","UH60M_EP1_DZE","MV22_DZ","Mi17_Civilian_DZ","AH6X_DZ","MH6J_DZ","CSJ_GyroC","CSJ_GyroCover","CSJ_GyroP","GNT_C185","GNT_C185U","GNT_C185R","GNT_C185C"];

//Vehicles that can hold cargo. SETUP == [Object, slot count]
TOWING_VehiclesWithCargo = [];

//List of objects that can be placed into vehicles with cargo. SETUP == [Object, slot size]
TOWING_cargoObjects =  [];

//List of objects players can pick up.
TOWING_playerLiftableObjects = ["PBX"];
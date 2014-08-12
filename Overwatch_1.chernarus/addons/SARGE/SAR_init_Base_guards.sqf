//Base guards
private["_sizeX","_sizeY","_snipers","_rifleMen","_sizeOfBase","_marker","_markername","_tMark","_someMarker","_flagPoles","_cnt","_spawnPos","_tPosX","_tPosY"];
sleep 60;
_flagPoles = nearestObjects [(getMarkerPos "center"), ["FlagCarrierBIS_EP1"], 25000];
diag_log "SAR_INIT_BASE_GUARDS CALLED";
diag_log format["_flagPoles: %1", str(_flagPoles)];
diag_log format["count _flagPoles: %1", (count _flagPoles)];
	{
	
	_baseBuildings = ["Land_Wall_Gate_Kolchoz","Land_komin","Land_Campfire","Land_Misc_deerstand","Land_ladder",
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
							
		_sizeOfBase = nearestObjects [_x, _baseBuildings, 200];
				
			if ((count _sizeOfBase >= 20) && (count _sizeOfBase <= 39)) then { 
			
				_rifleMen = 1;
				_snipers = 0;
				_sizeX = 75;
				_sizeY = 75;
				
				_spawnPos = (getPosATL _x);
				_tPosX = _spawnPos select 0;
				_tPosY = _spawnPos select 1;

				_markername = format["FLAG_BASE_%1", _x];
				_tMark = createMarker [_markername, position _x];
				_tMark setMarkerShape "ELLIPSE";
				_tMark setMarkeralpha 0;
				_tMark setMarkerType "Flag";
				_tMark setMarkerBrush "Solid";
				_tMark setMarkerSize [_sizeX, _sizeY];
				_marker = _tMark;
							
				[_x,_marker,1,_snipers,_rifleMen,"patrol",true,1800] call SAR_AI_GUARDS;  //patrol group, respawn after 30 minutes
				diag_log "Spawned Patrol Guard Group 1, 20-39 Buildings, 1 Leader + 1 Rifleman";				
			};
			
			if (count _sizeOfBase >= 40) then {
			
				_rifleMen = 2;
				_snipers = 1;
				_sizeX = 100;
				_sizeY = 100;
		
				_spawnPos = (getPosATL _x);
				_tPosX = _spawnPos select 0;
				_tPosY = _spawnPos select 1;

				_markername = format["FLAG_BASE_%1", _x];
				_tMark = createMarker [_markername, position _x];
				_tMark setMarkerShape "ELLIPSE";
				_tMark setMarkeralpha 0;
				_tMark setMarkerType "Flag";
				_tMark setMarkerBrush "Solid";
				_tMark setMarkerSize [_sizeX, _sizeY];
				_marker = _tMark;

				[_x,_marker,1,_snipers,_rifleMen,"patrol",true,1800] call SAR_AI_GUARDS;  //patrol group, respawn after 30 minutes
				diag_log "Spawned Patrol Guard Group 1, 40+ Buildings, 1 Leader + 2 Riflemen + 1 Sniper";				
			};										
	
			if ((count _sizeOfBase >= 60) && (count _sizeOfBase <= 79)) then { 	
			
				_rifleMen = 1;
				_snipers = 0;
				_sizeX = 125;
				_sizeY = 125;
					
				_spawnPos = (getPosATL _x);
				_tPosX = _spawnPos select 0;
				_tPosY = _spawnPos select 1;

				_markername = format["FLAG_BASE_%1", _x];
				_tMark = createMarker [_markername, position _x];
				_tMark setMarkerShape "ELLIPSE";
				_tMark setMarkeralpha 0;
				_tMark setMarkerType "Flag";
				_tMark setMarkerBrush "Solid";
				_tMark setMarkerSize [_sizeX, _sizeY];
				_marker = _tMark;
					
				[_x,_marker,1,_snipers,_rifleMen,"patrol",true,1800] call SAR_AI_GUARDS;  //patrol group, respawn after 30 minutes
				diag_log "Spawned Patrol Guard Group 2, 60-79 Buildings, 1 Leader + 1 Rifleman";				
			};
	
			if (count _sizeOfBase >= 80) then { 
			
				_rifleMen = 2;
				_snipers = 1;
				_sizeX = 150;
				_sizeY = 150;
		
				_spawnPos = (getPosATL _x);
				_tPosX = _spawnPos select 0;
				_tPosY = _spawnPos select 1;

				_markername = format["FLAG_BASE_%1", _x];
				_tMark = createMarker [_markername, position _x];
				_tMark setMarkerShape "ELLIPSE";
				_tMark setMarkeralpha 0;
				_tMark setMarkerType "Flag";
				_tMark setMarkerBrush "Solid";
				_tMark setMarkerSize [_sizeX, _sizeY];
				_marker = _tMark;

				[_x,_marker,1,_snipers,_rifleMen,"patrol",true,1800] call SAR_AI_GUARDS;  //patrol group, respawn after 30 minutes
				diag_log "Spawned Patrol Guard Group 2, 80+ Buildings, 1 Leader + 2 Riflemen + 1 Sniper";							
			};
		
		diag_log "SPAWNING FLAGS END!";
	} foreach _flagPoles;_tMark setMarkerSize [_sizeX, _sizeY];
		_marker = _tMark;
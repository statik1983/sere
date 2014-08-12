/*
Build list by Daimyo Client side
Add and remove recipes, Objects(classnames), requirments to build, and town restrictions + extras
This method is used because we are referencing magazines from player inventory as buildables.
Main DEFAULT array (_buildlist) consist of 34 arrays within. These arrays contains parameters for player_build.sqf
From left to right, each array contains 1st: [Recipe Array], 2nd: "Classname", [3rd: Requirements array]. 
Check comments below for more info on parameters
*/
private["_isDestructable", "_isSimulated","_disableSims","_objectSims","_objectSim","_requirements","_attachCoords","_isStructure","_structure","_startPos","_modDir","_toolBox","_eTool","_wallType","_medWait","_inBuilding","_longWait","_roadAllowed","_removable","_buildlist","_build_townsrestrict","_isSimulated","_isDestructable","_requireFlag","_inTown"];

//[TankT, SandB, Wire, Lumb, Scrap, Gren, Elec, Crate, Pallet, Duct, Camo, Glass, Nail, Jerry, Gen, Metal, Rope, Brick, tent]
//------------------------------------------------------, "Classname", 						[_attachCoords, 	_startPos, _modDir, _toolBox, 	_eTool, 	_medWait, 		_longWait, 	_inBuilding,	_roadAllowed, _inTown, 		_removable, 	_isStructure, _isSimulated, _isDestructable, _requireFlag];
_buildlist =  [
				[[0,0,0,0,2,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0], BBTypeOfFlag,  					[[0,6,0], 			[0,8,0], 		0, 		true, 		true, 		true, 			true, 			false, 		false, 		false, 		false, 		true, 			false, 		false, 		false]],
				[[0,0,0,1,2,0, 1,0,0,0,0,0, 0,0,0,0,0,0, 0], BBTypeOfZShield,  					[[0,4,2],			[0,4,2], 		0, 		true, 		true, 		true, 			true, 			true, 			false, 		false, 		true, 			false, 		false, 		true, 			true]],			
				[[0,0,0,0,1,0, 2,0,0,1,0,0, 0,0,0,0,0,0, 0], "Infostand_2_EP1",					[[0,5,0],			[0,5,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			false, 		false,			true]],				
				[[0,0,1,0,1,0, 0,1,2,0,0,0, 0,0,0,0,0,0, 0], "Concrete_Wall_EP1", 				[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,0,1,0, 0,1,1,0,0,0, 0,0,0,0,0,0, 0], "MAP_Ohrada_popelnice",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[0,0,0,0,1,0, 0,0,0,0,0,0, 0,0,0,3,0,0, 0], "MAP_Wall_IndCnc2_3",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,1,0, 0,0,0,0,0,0, 1,0,0,3,0,0, 0], "Land_Ind_SawMillPen",			[[0,18,0], 		[0,18,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,2,0, 2,1,0,0,0,0, 0,0,0,0,0,0, 0], "PowerGenerator_EP1",  			[[0,5,0], 			[0,5,0], 		90, 	true, 		true, 		true, 			true, 			false, 		false, 		false, 		true, 			true, 			false, 		true, 			true]],
				[[0,1,1,0,0,1, 0,0,0,1,0,0, 0,0,0,0,0,0, 0], "Grave",							[[0,5,0], 			[0,5,0], 		0, 		true, 		true, 		false, 		false, 		true, 			false, 		true, 			true, 			false, 		true, 			true,			false]],
				
				[[0,0,0,0,0,0, 0,0,1,0,0,0, 0,2,0,2,1,0, 0], "Land_Fire_barrel_burning",		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,0,0, 0,0,0,0,0,0, 0,2,0,2,1,0, 0], "Land_Fire_barrel",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[0,0,0,2,0,0, 0,0,0,0,0,0, 0,1,0,0,0,0, 0], "Land_Campfire",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0], "Hedgehog_DZ",  					[[0,5,0], 			[0,5,0], 		90, 	true, 		false, 	false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false]],
				[[0,1,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0], "Sandbag1_DZ",  					[[0,5,0], 			[0,5,0], 		90, 	false, 	true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false]],
				[[0,0,1,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,0, 0], "Wire_cat1",  						[[0,5,0], 			[0,5,0], 		90, 	true, 		false, 	false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false]],
				[[2,0,4,0,0,0, 0,0,0,0,0,0, 1,0,0,0,0,0, 0], "Fort_RazorWire",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,1,0, 0,0,0,1,0,0, 0,0,0,0,1,2, 0], "Land_pumpa",						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[1,1,1,0,1,0, 0,1,0,0,0,0, 1,0,0,1,2,0, 0], "CampEast_EP1", 	            	[[0,10,0],  		[0,10,0], 		0,		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,1,1,1,1,0, 0,1,1,1,0,0, 1,0,0,0,1,0, 0], "Land_Barrack2_EP1", 	        	[[0,12,0], 		[0,12,0], 		0,		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,1,1,0, 0,1,0,1,0,0, 1,0,0,0,1,1, 0], "Barrack2",  						[[0,10,0],	 		[0,10,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],				
				[[0,0,1,1,1,0, 0,1,1,1,0,0, 1,0,0,0,1,0, 0], "Land_Barrack2", 	            	[[0,12,0], 		[0,12,0], 		0,		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[1,1,1,0,1,0, 0,1,0,0,0,0, 1,0,0,1,1,0, 0], "Camp",  							[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,1,1,0,1,0, 0,1,0,1,0,0, 1,0,0,1,1,0, 0], "MASH",  							[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[4,0,0,0,0,0, 0,0,2,0,0,0, 1,0,0,0,2,0, 0], "MAP_tent2_west",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[3,0,0,0,0,0, 0,0,1,0,0,0, 1,0,0,0,2,0, 0], "MAP_tent_east",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,0,0,0, 0,0,1,0,0,0, 1,0,0,0,1,0, 0], "MAP_tent_small_west",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,0,0,0, 0,0,2,0,0,0, 1,0,0,0,2,0, 0], "MAP_tent_west",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,5,0,1,0,0, 0,0,2,0,0,0, 0,0,0,0,0,0, 0], "Land_fortified_nest_big", 		[[0,12,0], 		[0,12,0], 		180,	true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,2,0,1,0,0, 0,0,2,0,0,0, 0,0,0,0,0,0, 0], "Land_fortified_nest_small",		[[0,10,0], 		[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[1,3,0,0,0,0, 0,0,1,0,2,0, 0,0,0,0,0,0, 0], "Land_Fort_Watchtower",			[[0,10,0],			[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,3,0,0,0,0, 0,2,1,0,1,0, 0,0,0,0,0,0, 0], "WarfareBCamp",					[[0,12,0], 		[0,12,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[3,1,1,0,0,0, 0,0,0,0,1,0, 1,0,0,0,1,0, 0], "MAP_Camo_Box",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,1,1,0,0,0, 0,0,0,0,1,0, 1,0,0,0,1,0, 0], "MAP_Pristresek",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,3,0,0,0,0, 0,0,1,0,1,0, 0,0,0,0,0,0, 0], "MAP_Fortress_02",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,1,0, 0,0,0,2,1,0, 1,0,0,0,2,0, 0], "Land_tent_east", 					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,1,1,0,0,0, 0,0,0,1,1,0, 1,0,0,0,1,0, 0], "Land_CamoNetB_EAST",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,1,1,0,0,0, 0,0,1,1,1,0, 1,0,0,0,1,0, 0], "Land_CamoNetB_NATO", 			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,0,1,0,0,0, 0,0,0,2,1,0, 1,0,0,0,1,0, 0], "Land_CamoNetVar_EAST",			[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[3,1,1,0,0,0, 0,0,0,1,1,0, 1,0,0,0,1,0, 0], "Land_CamoNetVar_NATO", 			[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,0,1,0,0,0, 0,0,0,1,1,0, 1,0,0,0,1,0, 0], "Land_CamoNet_EAST",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[3,0,1,0,0,0, 0,0,0,1,1,0, 1,0,0,0,1,0, 0], "Land_CamoNet_NATO",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,3,0,1,0,0, 0,0,1,0,0,0, 1,0,0,0,0,2, 0], "Land_fort_artillery_nest",  	[[0,20,0], 		[0,20,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],			
				[[0,2,0,1,0,0, 0,0,1,0,0,0, 1,0,0,0,0,1, 0], "Land_fort_rampart",  			[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,1,0,2,0,0, 0,0,1,0,0,0, 1,0,0,0,0,1, 0], "Land_fort_rampart_EP1", 			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,0,0,0, 0,0,2,0,0,0, 0,0,0,0,0,1, 0], "MAP_Misc_WindBreak",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,1,1,0, 0,0,1,0,0,0, 1,0,0,0,0,0, 0], "Land_covering_hut_big_EP1",  	[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],				
				[[0,0,2,0,1,0, 0,0,2,0,0,0, 2,0,0,0,0,0, 0], "Land_fort_bagfence_round", 		[[0,10,0], 		[0,10,0], 		0,		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,2,0,1,0, 0,0,2,0,0,0, 1,0,0,0,0,0, 0], "Land_fort_bagfence_corner", 	[[0,10,0], 		[0,10,0], 		0,		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,1,1,1,1,0, 0,3,0,0,0,0, 0,0,0,0,0,0, 0], "Hhedgehog_concreteBig", 	    	[[0,10,0], 		[0,10,0], 		0,		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,4,3,0,0,0, 0,2,0,0,0,0, 1,0,0,0,0,0, 0], "Base_WarfareBBarrier10xTall",	[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,3,3,0,0,0, 0,1,0,0,0,0, 1,0,0,0,0,0, 0], "Base_WarfareBBarrier10x", 		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,3,1,0,0,0, 0,0,2,0,0,0, 0,0,0,0,0,0, 0], "Land_HBarrier_large", 			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,2,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,0,0, 0], "Land_BagFenceRound",				[[0,10,0], 		[0,10,0], 		180,	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,2,0,1,0, 0,1,0,0,0,0, 1,0,0,0,0,0, 0], "Land_fort_bagfence_long", 		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,0,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,0,2, 0], "MAP_Wall_CBrk_5",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,1,1,0,0,0, 0,0,0,0,0,2, 0], "MAP_Wall_CGry_5",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,1,0,1,0,0, 0,0,0,0,0,2, 0], "MAP_Wall_CYel_5",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,1,0, 0,0,0,0,0,0, 0,0,0,1,0,0, 0], "MAP_Wall_Gate_Ind1_L",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,1,0,1,0, 0,0,0,0,0,0, 0,0,0,1,0,0, 0], "MAP_Wall_Gate_Ind1_R",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,2,0,1,0, 0,0,0,0,0,0, 0,0,0,1,0,0, 0], "MAP_Wall_Gate_Ind2A_L",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,1,0, 0,0,1,0,0,0, 0,0,0,1,0,0, 0], "MAP_Wall_Gate_Ind2A_R",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,0,1,0, 0,0,0,0,0,0, 1,0,0,1,0,0, 0], "MAP_Wall_Gate_Ind2B_L",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,0,1,0, 0,0,0,0,0,0, 0,0,0,1,0,0, 0], "MAP_Wall_Gate_Ind2B_R",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,0,0, 0], "MAP_Wall_IndCnc_4",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,1,2, 0], "MAP_Wall_IndVar1_5_2",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,0,2, 0], "MAP_Wall_IndVar2_5",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,0,0, 0,0,0,0,0,0, 2,0,0,0,0,2, 0], "MAP_zed_civil",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,0,0,0, 0,2,0,0,0,0, 0,0,0,0,0,3, 0], "MAP_zidka_branka",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,0,1, 0], "MAP_zidka02",						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,3,0,0,0,0, 0,0,2,0,0,0, 0,0,0,0,0,0, 0], "Land_CncBlock",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,3,0,0,0,0, 0,0,2,1,0,0, 0,0,0,0,0,0, 0], "Land_CncBlock_Stripes",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,1,1,1,1,0, 0,2,0,0,0,0, 0,0,0,0,0,0, 0], "Hhedgehog_concrete",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[1,0,0,0,0,0, 0,0,2,0,0,0, 1,0,0,0,0,0, 0], "Fence_corrugated_plate",			[[0,10,0], 		[0,10,0], 		0,		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,0,1,0, 0,0,0,2,0,0, 1,0,0,0,1,0, 0], "ZavoraAnim", 						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,2,0, 0,0,0,0,0,0, 1,0,0,4,0,0, 0], "Land_Misc_Cargo2E",				[[0,10,0], 		[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,1,0,2,0, 0,0,0,0,0,0, 1,0,0,1,0,0, 0], "Misc_Cargo1Bo_military",			[[0,10,0], 		[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,2,0, 0,0,0,0,0,0, 1,0,0,2,0,0, 0], "Land_Misc_Cargo1D",				[[0,10,0], 		[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,0,2,0, 0,0,0,0,0,0, 1,0,0,1,0,0, 0], "Misc_Cargo1B_military",  		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,2,0, 0,0,0,0,0,0, 1,0,0,1,0,0, 0], "Misc_cargo_cont_small_EP1",		[[0,10,0], 		[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],								
				[[0,0,1,0,0,0, 0,0,0,0,0,0, 0,3,0,2,0,0, 0], "Land_Ind_TankSmall2_EP1",		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,0,0,0, 0,0,0,0,0,0, 0,1,1,1,0,0, 0], "Land_Ind_IlluminantTower",		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],		
				[[1,0,0,1,0,0, 0,2,1,0,0,0, 0,0,0,0,1,0, 0], "Land_Misc_deerstand",			[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			false, 		true,			false]],
				[[1,0,0,1,0,0, 0,2,2,0,0,0, 0,0,0,0,1,0, 0], "MAP_posed",						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,1,2,0, 0,0,0,0,0,0, 0,0,0,1,1,0, 0], "Land_vez",							[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,2,0, 0,0,0,0,0,0, 1,0,0,0,1,0, 0], "Land_radar",						[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,2,0, 0,0,0,1,0,0, 0,0,0,1,0,0, 0], "Land_RedWhiteBarrier",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,1,0, 0,0,0,1,0,0, 0,0,0,1,0,0, 0], "Land_arrows_desk_R",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,0,0, 0,0,0,1,0,0, 0,0,0,1,0,0, 0], "Land_arrows_desk_L",				[[0,10,0], 		[0,10,0], 		0, 		true,		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,0,0,0, 0,0,0,3,0,0, 0,0,0,0,2,0, 0], "HeliHCivil",						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,0,0, 0,0,0,4,0,0, 0,0,0,0,2,0, 0], "PARACHUTE_TARGET",  				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],												
				[[0,0,0,1,0,0, 0,0,0,2,0,0, 1,0,0,0,0,0, 0], "Sign_Danger",						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,1,0, 0,0,0,2,0,0, 0,0,0,0,0,0, 0], "MAP_sign_danger",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,1,0, 1,0,0,1,0,0, 0,0,0,0,0,0, 0], "Land_coneLight",					[[0,5,0], 			[0,5,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,1,0, 1,0,0,0,0,0, 0,0,0,0,0,0, 0], "Red_Light_Blinking_EP1",			[[0,5,0], 			[0,5,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,0,0, 1,0,0,1,0,0, 1,0,0,0,0,0, 0], "RoadBarrier_light",  			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,0,0, 0,0,1,2,0,0, 1,0,0,0,0,0, 0], "RoadBarrier_long", 	        	[[0,10,0], 		[0,10,0], 		0,		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,0,0,0, 0,0,1,1,0,0, 1,0,0,0,0,0, 0], "SignM_UN_Base_EP1",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,2,0, 0,0,0,0,0,0, 0,0,0,0,1,0, 0], "Land_ladder",						[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,1,0, 0,0,2,0,0,0, 0,0,0,0,1,0, 0], "MAP_LadderHalf", 	           	 	[[0,12,0], 		[0,12,0], 		0,		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,1,0, 0,1,2,2,0,0, 1,0,0,2,1,0, 0], "Land_leseni4x",					[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,1,0, 0,1,2,2,0,0, 1,0,0,1,1,0, 0], "MAP_leseni2x",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,0,2,0, 0,0,0,1,0,0, 0,0,0,0,0,0, 0], "Land_Wall_Gate_Kolchoz",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,2,0,1,0, 0,0,0,0,0,0, 1,0,0,0,0,0, 0], "Fence_Ind",  						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,3,0,1,0, 0,0,0,0,0,0, 1,0,0,0,0,0, 0], "Fence_Ind_long",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,0,0, 0,0,1,0,0,0, 0,0,0,0,1,1, 0], "MAP_brana02nodoor",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,0,0,0, 0,0,2,0,0,0, 0,0,0,0,0,0, 0], "MAP_Gate_IndVar2_5",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,0,0,0, 0,0,4,0,0,0, 0,0,0,0,0,0, 0], "MAP_Ind_SideRoof",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,0,1,0, 0,1,1,0,0,0, 0,0,0,0,0,0, 0], "MAP_Ohrada_popelnice_roh",		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,2,0,0,0, 0,0,0,0,0,0, 1,0,0,0,0,3, 0], "MAP_plot_istan1_rovny_bezs",	[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,0,0,0, 0,0,0,0,0,0, 1,0,0,0,0,2, 0], "MAP_plot_istan1_rovny_short",	[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,3,0,0,0, 0,0,0,0,0,0, 1,0,0,0,0,3, 0], "MAP_plot_istan3",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,2,0,0,0, 0,0,0,0,0,0, 1,0,0,0,0,2, 0], "MAP_plot_istan3_short",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,1,0, 0,1,1,1,0,0, 1,0,0,0,0,0, 0], "Land_Shed_wooden",  				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,1,1,0, 1,0,0,0,0,0, 1,0,0,0,1,3, 0], "Land_komin",  					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[0,0,1,1,1,0, 0,2,0,1,0,0, 1,0,0,2,0,0, 0], "Mi8Wreck",  						[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[2,0,1,1,0,0, 1,0,0,0,0,0, 0,0,1,0,0,0, 0], "76n6ClamShell",  					[[0,15,0], 		[0,15,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,0,0,1,0,0, 0,0,0,1,0,1, 1,0,0,3,1,0, 0], "Land_Shed_Ind02",  				[[0,30,0], 		[0,30,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,0,0, 0,2,0,1,0,0, 0,0,0,3,1,0, 0], "Land_water_tank",  				[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[2,4,0,0,0,0, 0,2,1,0,1,0, 0,0,0,0,0,0, 0], "WarfareBDepot",					[[0,18,0], 		[0,18,0], 		90, 	true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[1,0,1,1,0,0, 0,0,0,0,0,3, 1,0,0,1,0,0, 0], "Land_a_stationhouse",  			[[0,30,0],			[0,30,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],												
				[[1,0,0,1,1,0, 0,0,1,0,0,0, 2,0,0,3,0,0, 0], "Land_hut_old02",  				[[0,15,0],			[0,15,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,1,1,1,0, 0,1,2,1,0,0, 1,0,0,1,0,0, 0], "Land_Barn_W_02",  				[[0,15,0],			[0,15,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,1,0, 0,0,0,0,0,2, 1,0,0,1,0,0, 0], "Land_Hlidac_Budka_EP1", 	    	[[0,10,0],	 		[0,10,0], 		0,		true, 		true, 		false, 		false,	 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,2,0,0, 0,0,1,0,0,3, 0,0,0,1,0,0, 0], "Land_hruzdum", 	            	[[0,10,0],  		[0,10,0], 		0,		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,2,0,0, 0,0,0,0,0,2, 1,0,0,1,0,2, 0], "Land_A_FuelStation_Build",		[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			false, 		true,			true]],
				[[0,0,0,1,1,0, 0,0,0,0,0,2, 1,0,0,1,0,1, 0], "Land_A_FuelStation_Shed",		[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			false, 		true,			true]],				
				[[1,0,0,1,0,0, 0,0,1,0,0,0, 1,0,0,0,0,0, 0], "Land_WoodenRamp",  				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,1,0,0, 0,0,2,0,0,0, 0,0,0,0,0,0, 0], "Land_ConcreteRamp",  			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[1,0,1,1,0,0, 0,0,1,0,0,0, 0,0,0,0,0,0, 0], "MAP_ramp_concrete",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,1,0, 0,0,0,1,0,0, 1,0,0,0,0,0, 0], "Land_prebehlavka",				[[0,10,0], 		[0,10,0], 		90, 	true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,0,0,1,1,0, 0,0,0,0,0,2, 2,0,0,0,0,0, 0], "Land_dum_istan3_hromada2",  	[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],			
				[[0,0,0,0,0,0, 0,0,0,0,0,1, 0,1,1,0,0,1, 0], "Land_majak2",  					[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[0,0,0,0,0,0, 0,0,0,0,0,1, 0,1,1,0,0,0, 0], "MAP_NAV_Lighthouse",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,0,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,2, 0], "Land_A_Castle_Wall2_Corner", 	[[0,12,0], 		[0,12,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[3,0,0,1,1,0, 0,0,2,0,0,0, 0,0,0,0,1,0, 0], "Land_A_Castle_Stairs_A", 		[[0,12,0], 		[0,12,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[1,0,1,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,4, 0], "Land_A_Castle_Wall1_Corner", 	[[0,12,0], 		[0,12,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[3,0,0,1,2,0, 0,0,0,0,0,0, 0,0,0,0,0,1, 0], "Land_Ind_Expedice_2",  			[[0,15,0],			[0,15,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[1,0,0,3,0,0, 0,0,2,0,0,0, 2,0,0,0,0,0, 0], "Land_Nav_Boathouse_PierT",  	[[0,15,0],			[0,15,0],  	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[1,0,0,2,0,0, 0,0,2,0,0,0, 2,0,0,0,0,0, 0], "MAP_Nav_Boathouse_PierL",		[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],				
				[[1,0,1,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,5, 0], "Land_A_Castle_Bastion", 			[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,1,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,6, 0], "Land_A_Castle_Bergfrit", 		[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,2,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,5, 0], "Land_A_Castle_Donjon", 			[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[0,0,1,1,1,0, 0,0,1,0,0,0, 0,0,0,0,1,4, 0], "Land_A_Castle_Gate", 			[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,0,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,5, 0], "Land_A_Castle_Wall1_20", 		[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,0,1,0,0, 0,1,1,0,0,0, 0,0,0,0,1,4, 0], "Land_A_Castle_Wall1_End", 		[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,0,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,4, 0], "Land_A_Castle_Wall2_30", 		[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[2,0,0,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,4, 0], "Land_A_Castle_Wall2_End", 		[[0,15,0], 		[0,15,0], 		180,	true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],				
				[[2,0,0,1,0,0, 0,0,2,0,0,0, 0,0,0,0,0,2, 0], "Land_Dam_Barrier_40",  			[[0,15,0],	 		[0,15,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,1,1,1,0, 0,0,0,0,0,0, 0,0,0,5,0,0, 0], "WarfareBAirport",  				[[0,50,0],			[0,50,0], 		0, 		true, 		true, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[2,0,0,1,0,0, 0,4,1,0,0,0, 0,0,0,0,0,3, 0], "Land_majak_podesta",  			[[0,10,0],			[0,10,0], 		0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],	
				[[1,0,0,0,0,0, 0,2,3,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_c",  				[[0,40,-10],		[0,40,-10],	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,0,0,0, 0,2,2,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_c_90",  			[[0,40,-10],		[0,40,-10],	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,1,0,0, 0,2,3,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_c_270",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,1,0,0, 0,2,2,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_c_big",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,0,0,0, 0,3,1,0,0,0, 0,0,0,0,1,2, 0], "land_nav_pier_C_L10",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,0,0,0, 0,4,1,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_C_R",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,1,0,0, 0,0,1,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_C_R10",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,0,0,0, 0,0,1,0,0,0, 0,0,0,0,1,4, 0], "land_nav_pier_C_R30",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,1,0,0,0,0, 0,0,4,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_c_t15",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,2,0,0,0,0, 0,0,4,0,0,0, 0,0,0,0,1,4, 0], "land_nav_pier_c_t20",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,2,0,0,0,0, 0,0,3,0,0,0, 0,0,0,0,1,4, 0], "land_nav_pier_c2",  				[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,1,0,0,0,0, 0,1,2,0,0,0, 0,0,0,0,1,3, 0], "land_nav_pier_c2_end",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,2,3, 0], "land_nav_pier_m_1",  			[[0,40,-10],		[0,40,-10], 	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],	
				[[1,0,0,0,0,0, 0,0,0,0,0,0, 0,0,0,0,0,3, 0], "land_nav_pier_m_end",  			[[0,30,-10],		[0,30,-10],  	0, 		true, 		true, 		true, 			false, 		true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],					
				[[2,0,0,0,1,0, 0,0,0,0,0,0, 0,0,0,7,0,0, 0], "MAP_Ind_SiloVelke_01",			[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,0,0,1,0, 0,0,0,0,0,0, 0,0,0,8,0,0, 0], "MAP_Ind_SiloVelke_02",			[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[1,0,0,0,1,0, 0,0,0,0,0,0, 0,0,0,2,0,0, 0], "MAP_Ind_SiloVelke_most",			[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			true,			true]],
				[[0,3,2,0,1,1, 0,1,0,0,0,0, 0,0,0,0,0,0, 0], "MAP_R2_Rock1",					[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],
				[[0,2,1,0,1,1, 0,1,0,0,0,0, 0,0,0,0,0,0, 0], "MAP_R2_RockTower",				[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],
				[[0,4,3,0,1,1, 0,1,0,0,0,0, 0,0,0,0,0,0, 0], "MAP_R2_RockWall",					[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],				
				[[1,0,1,1,0,0, 0,2,2,0,0,0, 0,0,0,0,1,3, 0], "MAP_asf3_0_2000",					[[0,20,0], 		[0,20,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			false]],
				[[0,0,1,1,0,1, 0,2,2,0,0,0, 0,0,0,0,1,3, 0], "MAP_runway_poj_draha",			[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[0,0,1,1,0,1, 0,1,2,0,0,0, 0,0,0,0,1,3, 0], "MAP_runway_poj_L_2",				[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				[[0,0,1,1,0,1, 0,0,2,0,0,0, 0,0,0,0,1,3, 0], "MAP_runway_poj_spoj",			[[0,40,0], 		[0,40,0], 		0, 		true, 		true, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true, 			false,			true]],
				
				[[0,0,0,2,0,0, 0,3,1,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_acer2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,2,0,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_alnus2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,1,0,0,0,0, 0,0,0,0,2,0, 0], "MAP_t_betula1f",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,2,0,0,0,0, 0,0,0,0,3,0, 0], "MAP_t_betula2f",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,2,0,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_betula2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,1,0,0,0,0, 0,0,0,0,0,0, 0], "MAP_t_betula2w",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,3,0,0,0,0, 1,0,0,0,2,0, 0], "MAP_t_carpinus2s",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,1,0,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_fagus2f",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,1,0,0,0,0, 0,0,0,0,1,0, 0], "MAP_t_fagus2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,1,2,0,0, 0,3,0,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_fraxinus2s",				[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,1,2,0,0, 0,2,0,0,0,0, 0,0,0,0,2,0, 0], "MAP_t_larix3s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,0,0,0, 0,1,1,0,0,0, 0,0,0,0,1,0, 0], "MAP_t_malus1s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,0,0,0, 0,1,0,0,0,0, 0,0,0,0,1,0, 0], "MAP_t_picea1s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,2,0,0,0,0, 1,0,0,0,2,0, 0], "MAP_t_picea2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,2,0,1,0,0, 0,0,0,0,2,0, 0], "MAP_t_picea3f",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,3,0,1,0,0, 1,0,0,0,3,0, 0], "MAP_t_pinusN2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,2,0,0,0,0, 0,0,0,0,2,0, 0], "MAP_t_pinusS2f",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,2,0,2,0,0, 0,0,0,0,2,0, 0], "MAP_t_populus3s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,1,0,0,0,0, 1,0,0,0,1,0, 0], "MAP_t_pyrus2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,1,0,0, 0,2,0,0,0,0, 0,0,0,0,2,0, 0], "MAP_t_quercus2f",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,0,0,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_quercus3s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,3,0,0,0,0, 1,0,0,0,3,0, 0], "MAP_t_salix2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,2,0,0, 0,2,0,0,0,0, 0,0,0,0,3,0, 0], "MAP_t_sorbus2s",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,0,0,0, 0,0,1,0,0,0, 1,0,0,0,0,0, 0], "MAP_b_betulaHumilis",			[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]],
				[[0,0,0,0,0,0, 0,0,1,0,0,0, 2,0,0,0,0,0, 0], "MAP_b_craet2",					[[0,10,0], 		[0,10,0], 		0, 		true, 		true, 		false, 		false, 		true, 			true, 			true, 			true, 			true, 			true, 			true,			false]]				
				];
//------------------------------------------------------, "Classname", 						[_attachCoords, 	_startPos, _modDir, _toolBox, 	_eTool, 	_medWait, 		_longWait, 	_inBuilding,	_roadAllowed, _inTown, 	_removable, 	_isStructure, 	_isSimulated, _isDestructable, _requireFlag];				
//[TankT, SandB, Wire, Lumb, Scrap, Gren, Elec, Crate, Pallet, Duct, Camo, Glass, Nail, Jerry, Gen, Metal, Rope, Brick, Tent]

//Extendable object have the option to elevate/lower when positioning. They DO NOT follow ground contours and will always remain perfectly vertical.
allExtendables = ["Land_Wall_Gate_Kolchoz","Land_komin","Land_Campfire","Land_Misc_deerstand","Land_ladder",
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
"MAP_Ind_SiloVelke_01","MAP_Ind_SiloVelke_02","MAP_leseni2x","MAP_LadderHalf"];

// Build allremovables array for remove action
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_removable = (_buildlist select _i) select _i - _i + 1;
	if (_removable != "Grave") then { // Booby traps have disarm bomb
	allremovables set [count allremovables, _removable];
	};
};
// Build classnames array for use later
for "_i" from 0 to ((count _buildlist) - 1) do
{
	_classname = (_buildlist select _i) select _i - _i + 1;
	allbuildables_class set [count allbuildables_class, _classname];
};


/*
*** Remember that the last element in ANY array does not get comma ***
Notice lines 47 and 62
*/
// Towns to restrict from building in. (Type exact name as shown on map, NOT Case-Sensitive but spaces important)
// ["Classname", range restriction];
_build_townsrestrict = [
["Chernogorsk", 700],
["Elektrozavodsk", 700],
["Solnichniy", 700],
["Berezino", 700],
["Krasnostav", 300],
["Stary Sobor", 1300],
["Balota", 300],
["Orlovets", 300],
["Gvozdno", 300],
["Staroye", 300],
["Sosnovka", 300],
["Komarovo", 300],
["Tulga", 300],
["Nizhnoye", 300],
["Devils Castle", 300],
["Novy Sobor", 700],
["International Airfield", 300],
["Zub Castle", 300],
["Vybor", 300],
["Msta", 900],
["Polana", 300],
["Olsha", 300],
["Kamenka", 300],
["Krutoy Cap", 500],
["Cap Golova", 500],
["Skalisty Island", 1000],
["Otmel", 300],
["Drakon", 300],
["Kamyshovo", 1200],
["Gorka", 300],
["Zub", 300],
["Rog", 300]
/*["Lubjansk", 200],
["Northern army base", 150],
["Alakit", 125],
["Old Yard", 150],
["Vorkuta", 350],
["Vorkuta outskirts", 150],
["Jalovisko", 200],
["Nemsk", 150],
["Sebjan dam", 150],
["Sebjan field airport", 350],
["Sebjan chemical factory", 150],
["Sebjan", 150],
["Sebjan mine", 200],
["Sebjan warehouse", 250],
["Object A1", 200],
["Western army checkpoint", 200],
["Norinsk", 350],
["Southern army base", 250],
["West point", 100],
["Seraja army base", 350],
["Brensk railway station", 300],
["Brensk bridge", 200],
["Object A2", 400],
["Nitija army base", 250],
["Tara bridge", 400],
["Old Sawmill", 200], 
["Tara", 150],
["Tara railway station", 200],
["Tara harbor", 250],
["Old Hospital", 200],
["Tara Hill", 180],
["Tara Harbor Facilities", 180],
["Tara Marsh", 150],
["Jalovisko City", 220],
["Nemsk factory", 180],
["City Vorkuta Capital", 350]*/
];
// Here we are filling the global arrays with this local list
allbuildables = _buildlist;
allbuild_notowns = _build_townsrestrict;


/*
This Area is for extra arrays that need to be built via above arrays
*/

	//Determine Structure buildables to build structures array
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_requirements = (_buildlist select _i) select _i - _i + 2;
		_isStructure = _requirements select 11;
		_structure = (_buildlist select _i) select _i - _i + 1;
		if (_isStructure) then {
		structures set [count structures, _structure];
		};
	};
	
	//Build all buildables (not just walls) for antiWall script
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_wallType = (_buildlist select _i) select _i - _i + 1;
		//Add more exceptions here so that when players get out of vehicles, they wont call anti-wall with these objects
		if (_walltype != "Grave" && _walltype != "Infostand_2_EP1" && _walltype != "Land_pumpa" && _walltype != "ZavoraAnim") then {
		wallarray set [count wallarray, _wallType];
		};
	};
	//Disable physics locally on objects that we dont want moving (for now, gate panel)
	_objectSims = [];
	for "_i" from 0 to ((count _buildlist) - 1) do
	{
		_requirements = (_buildlist select _i) select _i - _i + 2;
		_isSimulated = _requirements select 12;
		_objectSim = (_buildlist select _i) select _i - _i + 1;
		//Add more exceptions here so that when players get out of vehicles, they wont call anti-wall with these objects
		if (!_isSimulated) then {
		_objectSims set [count _objectSims, _objectSim];
		};
	};
	//Now we have array, lets disable simulation locally on all objects that require it (basically disabling physics for these)
	_disableSims = nearestObjects [player, _objectSims, 30000];
	{
		_x enableSimulation false;
	} foreach _disableSims;
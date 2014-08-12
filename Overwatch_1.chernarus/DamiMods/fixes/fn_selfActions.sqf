scriptName "Functions\misc\fn_selfActions.sqf";
/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_cursorTarget = cursorTarget;
_primaryWeapon = primaryWeapon player;
_currentWeapon = currentWeapon player;
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isVehicle = _cursorTarget isKindOf "AllVehicles";
_isMan = _cursorTarget isKindOf "Man";
_isAnimal = _cursorTarget isKindOf "Animal";
_isZombie = _cursorTarget isKindOf "zZombie_base";
_isDestructable = _cursorTarget isKindOf "BuiltItems";
_isTent = _cursorTarget isKindOf "TentStorage";
_isStash = _cursorTarget isKindOf "StashSmall";
_isMediumStash = _cursorTarget isKindOf "StashMedium";
_isHarvested = _cursorTarget getVariable["meatHarvested",false];
_ownerID = _cursorTarget getVariable ["characterID","0"];
_isVehicletype = typeOf _cursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
_isBike = typeOf _cursorTarget in ["Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1"];
_isFuel = false;
_hasFuel20 = "ItemJerrycan" in magazines player;
_hasFuel5 = "ItemFuelcan" in magazines player;
_hasFuelE20 = "ItemJerrycanEmpty" in magazines player;
_hasFuelE5 = "ItemFuelcanEmpty" in magazines player;
_hasKnife = "ItemKnife" in items player;
_hasMatches = "ItemMatchbox" in items player;
_hasToolbox = "ItemToolbox" in items player;	
_hasbottleitem = "ItemWaterbottle" in magazines player;
_isAlive = alive _cursorTarget;
_canmove = canmove _cursorTarget;
_text = getText (configFile >> "CfgVehicles" >> typeOf _cursorTarget >> "displayName");
_isPlant = typeOf _cursorTarget in Dayz_plants;


_nearLight = nearestObject [player,"LitObject"];
_canPickLight = false;
if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};

_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);

//####----####----####---- Base Building 1.3 Start ----####----####----####
	_currentSkin = typeOf(player);
	_hasToolbox = "ItemToolbox" in items player;
	_baseBuildAdmin = ((getPlayerUID player) in BBSuperAdminAccess);
	_baseBuildLAdmin = ((getPlayerUID player) in BBLowerAdminAccess);
	//Get objects that can't be targetted
	_flagBasePole = nearestObject [player, BBTypeOfFlag];
		//All untargetable objects (except Base Flag), searches a 12 meter radius, you can add any new objects you put in the build list that can't be targetted
		_untargetableArray = nearestObjects [player, ["MAP_plot_istan3_short","MAP_plot_istan3","MAP_plot_istan1_rovny_short","MAP_plot_istan1_rovny_bezs","MAP_Ohrada_popelnice_roh","MAP_Ohrada_popelnice","MAP_zidka02","MAP_zidka_branka","MAP_zed_civil","MAP_Wall_IndVar2_5","MAP_Wall_IndVar1_5_2","MAP_Wall_IndCnc_4","MAP_Wall_CYel_5","MAP_Wall_CGry_5","MAP_Wall_CBrk_5","MAP_t_sorbus2s","MAP_t_salix2s","MAP_t_quercus3s","MAP_t_quercus2f","MAP_t_pyrus2s","MAP_t_populus3s","MAP_t_pinusS2f","MAP_t_pinusN2s","MAP_t_picea3f","MAP_t_picea2s","MAP_t_picea1s","MAP_t_malus1s","MAP_t_larix3s","MAP_t_fraxinus2s","MAP_t_fagus2s","MAP_t_fagus2f","MAP_t_carpinus2s","MAP_t_betula2w","MAP_t_betula2s","MAP_t_betula2f","MAP_t_betula1f","MAP_t_alnus2s","MAP_t_acer2s","WarfareBAirport","MAP_Wall_IndCnc2_3","MAP_runway_poj_spoj","MAP_runway_poj_L_2","MAP_runway_poj_draha","MAP_R2_RockWall","MAP_R2_RockTower","MAP_Ohrada_popelnice","MAP_Ind_SiloVelke_most","MAP_Ind_SiloVelke_01","MAP_Ind_SiloVelke_02","MAP_asf3_0_2000","Land_Shed_Ind02","land_nav_pier_m_end","land_nav_pier_m_1","land_nav_pier_c2_end","land_nav_pier_c2","land_nav_pier_c_t20","land_nav_pier_c_t15","land_nav_pier_C_R30","land_nav_pier_C_R10","land_nav_pier_C_R","land_nav_pier_C_L10","land_nav_pier_c_big","land_nav_pier_c_270","land_nav_pier_c_90","land_nav_pier_c","Land_Nav_Boathouse_PierT","Land_Ind_SawMillPen","Land_hut_old02","Land_dum_istan3_hromada2","Land_Barn_W_02","Land_hruzdum","Land_CamoNetB_EAST","Land_CamoNetVar_EAST","Land_CamoNet_EAST","Land_CamoNetB_NATO","Land_CamoNetVar_NATO","Land_CamoNet_NATO","Land_Ind_IlluminantTower","Land_sara_hasic_zbroj","Land_A_Castle_Bergfrit","Land_A_Castle_Gate","Land_A_Castle_Bastion","Land_A_Castle_Wall1_20","Land_A_Castle_Wall1_20_Turn","Land_A_Castle_Wall2_30","HeliH","HeliHCivil","Land_Ind_Shed_01_main","RampConcrete","Land_Ind_Shed_01_end","Land_Ind_SawMillPen"],20];//The number at the end is the range to look for items, if you have issues with some items try increasing it by one or two at a time.
		_nearUntargetable = count _untargetableArray > 0; //Check if anything is in range
		_closestUntargetable = if (_nearUntargetable) then {_untargetableArray select 0};//Selects the closest returned item
		_nettingNames = ["Land_CamoNetB_EAST","Land_CamoNetVar_EAST","Land_CamoNet_EAST","Land_CamoNetB_NATO","Land_CamoNetVar_NATO","Land_CamoNet_NATO"]; //Used for menu options
		_castleNames = ["Land_A_Castle_Bergfrit","Land_A_Castle_Gate","Land_A_Castle_Bastion","Land_A_Castle_Wall1_20","Land_A_Castle_Wall1_20_Turn","Land_A_Castle_Wall2_30"];
		_heliPadNames = ["HeliH","HeliHCivil"];
		_roofNames = ["Land_Ind_Shed_01_main","Land_Ind_Shed_01_end","Land_Ind_SawMillPen"];
		_buildingNames = [];//Can add generic building names here
		_displayName = "Base Build Object";//Default menu option name if none of the following match
		if (typeOf(_closestUntargetable) in _nettingNames) then {_displayName = "Netting";};
		if (typeOf(_closestUntargetable) in _castleNames) then {_displayName = "Castle";};
		if (typeOf(_closestUntargetable) in _heliPadNames) then {_displayName = "HeliPad";};
		if (typeOf(_closestUntargetable) in _roofNames) then {_displayName = "Roof";};
		if (typeOf(_closestUntargetable) in _buildingNames) then {_displayName = "Building";};
		if (typeOf(_closestUntargetable) == "Land_Ind_IlluminantTower") then {_displayName = "Tower";};


	// Check mags in player inventory to show build recipe menu	
	_mags = magazines player;
	if ("ItemBandage" in _mags || "ItemTankTrap" in _mags || "ItemSandbag" in _mags || "ItemWire" in _mags || "PartWoodPile" in _mags || "PartGeneric" in _mags || "equip_scrapelectronics" in _mags || "ItemCamoNet" in _mags || "equip_crate" in _mags || "equip_brick" in _mags || "equip_duct_tape" in _mags || "HandGrenade_West" in _mags || "PartGlass" in _mags || "equip_wood_pallet" in _mags || "equip_nails" in _mags || "ItemJerrycan" in _mags || "ItemGenerator" in _mags || "equip_metal_sheet" in _mags || "equip_rope" in _mags || "ItemTent" in _mags) then {
		hasBuildItem = true;
	} else { hasBuildItem = false;};
	//Build Recipe Menu Action
	if((speed player <= 1) && hasBuildItem && _canDo) then {
		if (s_player_recipeMenu < 0) then {
			s_player_recipeMenu = player addaction [("<t color=""#0074E8"">" + ("Build Recipes") +"</t>"),"buildRecipeBook\build_recipe_dialog.sqf","",5,false,true,"",""];
		};
//		if (s_player_buildHelp < 0) then {
//			s_player_buildHelp = player addaction [("<t color=""#FF9500"">" + ("Base Building Help") +"</t>"),"dayz_code\actions\build_help.sqf","",5,false,true,"",""];
//		};
		if (s_player_showFlags < 0) then {
			s_player_showFlags = player addAction [("<t color=""#FF9500"">" + ("Show My Flags") +"</t>"),"dayz_code\actions\show_flag_markers.sqf","",5,false,true,"",""];
		};
	} else {
		player removeAction s_player_buildHelp;
		s_player_buildHelp = -1;
		player removeAction s_player_recipeMenu;
		s_player_recipeMenu = -1;
		player removeAction s_player_showFlags;
		s_player_showFlags = -1;
	};
	
	//Add in custom eventhandlers or whatever on skin change
	if (_currentSkin != globalSkin) then {
		globalSkin = _currentSkin;
		player removeMPEventHandler ["MPHit", 0]; 
		player removeEventHandler ["AnimChanged", 0];
		ehWall = player addEventHandler ["AnimChanged", { player call antiWall; }];
		empHit = player addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];
	};

	//General Untargetable Objects
	if((isNull cursorTarget) && _canDo && !remProc && !procBuild && _nearUntargetable) then {
	_ownerUnT = _closestUntargetable getVariable ["characterID", "0"]; //Checks owner IDs of untargetable objects, simply to avoid RPT spam with map objects
	_unTauthUID = _closestUntargetable getVariable ["AuthorizedUID", []]; //Gets master AuthUID from untargetable objects
	_unTauthGateCodes = if ((_ownerUnT != "0") && (count _unTauthUID > 0)) then {((getPlayerUID player) in (_unTauthUID select 1));}; //Checks for player access to untargetable objects
	_adminText = if (!_unTauthGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
		if (_unTauthGateCodes || _baseBuildAdmin) then {
			if (s_player_camoBaseOwnerAccess < 0) then {
				s_player_camoBaseOwnerAccess = player addAction [format["%2%1: Give all base owners (from flagpole) access",_displayName,_adminText], "dayz_code\external\keypad\fnc_keyPad\functions\give_gateAccess.sqf",_closestUntargetable, 1, false, true, "", ""];
			};
			if (s_player_addCamoAuth < 0) then {
				s_player_addCamoAuth = player addAction [format["%2%1: Add Player UIDs",_displayName,_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeAdd.sqf",_closestUntargetable, 1, false, true, "", ""];
			};
			if (s_player_removeCamoAuth < 0) then {
				s_player_removeCamoAuth = player addAction [format[("<t color=""#F01313"">" + ("%2%1: Remove Player UIDs") +"</t>"),_displayName,_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeRemove.sqf",_closestUntargetable, 1, false, true, "", ""];
			};
		};
		if (_ownerUnT != "0" && (_hasToolbox || _baseBuildAdmin || _baseBuildLAdmin)) then {
			if (s_player_deleteCamoNet < 0) then {
				s_player_deleteCamoNet = player addaction [format[("<t color=""#F01313"">" + ("Remove %1") +"</t>"),_displayName,_adminText],"dayz_code\actions\player_remove.sqf",_closestUntargetable,1,false,true,"",""];
			};
		};
	} else {
		player removeAction s_player_camoBaseOwnerAccess;
		s_player_camoBaseOwnerAccess = -1;
		player removeAction s_player_addCamoAuth;
		s_player_addCamoAuth = -1;
		player removeAction s_player_removeCamoAuth;
		s_player_removeCamoAuth = -1;
		player removeAction s_player_deleteCamoNet;
		s_player_deleteCamoNet = -1;
	};	

	// FlagPole Access (more reliable than cursortarget)
	if ((isNull cursorTarget) && _canDo && !remProc && !procBuild && (_flagBasePole distance player < 10)) then {
	_ownerFlag = _flagBasePole getVariable ["characterID", "0"]; //Checks owner IDs of flags, simply to avoid RPT spam with map objects
	_flagAuthUID = _flagBasePole getVariable ["AuthorizedUID", []]; //Gets master AuthUID from 
	_flagAuthGateCodes = if ((_ownerFlag != "0") && (count _flagAuthUID > 0)) then {((getPlayerUID player) in (_flagAuthUID select 1));}; //Checks if player has access to flag
	_adminText = if (!_flagAuthGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
		if (_flagAuthGateCodes || _baseBuildAdmin) then {
			if (s_player_addFlagAuth < 0) then {
				s_player_addFlagAuth = player addAction [format["%1FlagPole: Add Player UIDs for Base Building Access",_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeAdd.sqf", _flagBasePole, 1, false, true, "", ""];
			};
			if (s_player_removeFlagAuth < 0) then {
				s_player_removeFlagAuth = player addaction [format[("<t color=""#F01313"">" + ("%1FlagPole: Remove Player UIDs") +"</t>"),_adminText],"dayz_code\external\keypad\fnc_keyPad\enterCodeRemove.sqf", _flagBasePole, 1, false, true, "", ""];
			};
			if (s_player_removeFlag < 0) then {
				s_player_removeFlag = player addaction [format[("<t color=""#F01313"">" + ("%1Permanently Remove Flag (restrictions apply)") +"</t>"),_adminText],"dayz_code\actions\player_remove.sqf", _flagBasePole,1,false,true,"",""];
			};
			if (bbAIGuards == 1) then {
				if (s_player_guardToggle < 0) then {
					s_player_guardToggle = player addaction [format[("<t color=""#FFFFFF"">" + ("%1Toggle Guards to Kill all non-base owners (default on)") +"</t>"),_adminText],"dayz_code\actions\toggle_base_guards.sqf",_flagBasePole,1,false,true,"",""];
				};
			};
		};
	} else {
		player removeAction s_player_removeFlag;
		s_player_removeFlag = -1;
		player removeAction s_player_addFlagAuth;
		s_player_addFlagAuth = -1;
		player removeAction s_player_removeFlagAuth;
		s_player_removeFlagAuth = -1;
		player removeAction s_player_guardToggle;
		s_player_guardToggle = -1;
	};
//####----####----####---- Base Building 1.3 END ----####----####----####

//----------------Air Drops START-----------------------
_isAirdrop = cursorTarget isKindOf "Notebook";
if ((speed player <= 1) && _isAirdrop && _canDo && (player distance cursorTarget < 4)) then {
	if (s_player_Airdrop < 0) then {
		s_player_Airdrop = player addAction [("<t color=""#0096ff"">" + ("Fix Laptop (Airdrop)") +"</t>"),"Scripts\airdrop\Airdrop.sqf",cursorTarget, 0, false, true, "",""];
	};
} else {
	player removeAction s_player_Airdrop;
	s_player_Airdrop = -1;
};
//----------------Air Drops END-----------------------

//----------------ZOMBIE SHIELD START-----------------
if (("equip_floppywire" in magazines player) && ("equip_scrapelectronics" in magazines player) && ("PartEngine" in magazines player) && ("ItemJerrycan" in magazines player) && ("ItemToolbox" in items player)) then {
    hasShield = true;
} else {
    hasShield = false;
};
if (hasShield) then {
    if (zombieShield < 0) then {
    zombieShield = player addAction [("<t color=""#00c362"">" + ("Anti-Zombie Freq Emitter") +"</t>"),"scripts\zombieshield.sqf","",5,false,true,"",""];
    };
} else {
    player removeAction zombieShield;
    zombieShield = -1;
};
//----------------ZOMBIE SHIELD END-----------------

//------------------------------Krixes Self Bloodbag ------------------------------
	_mags = magazines player;
	
	// Krixes Self Bloodbag
	if ("ItemBloodbag" in _mags) then {
		hasBagItem = true;
	} else { hasBagItem = false;};
	if((speed player <= 1) && hasBagItem && _canDo) then {
		if (s_player_selfBloodbag < 0) then {
			s_player_selfBloodbag = player addaction[("<t color=""#c70000"">" + ("Self Bloodbag") +"</t>"),"\z\addons\ow_assets\actions\player_selfbloodbag.sqf","",5,false,true,"", ""];
		};
	} else {
		player removeAction s_player_selfBloodbag;
		s_player_selfBloodbag = -1;
	};

// ====================== IT's SERVER MENU SCRIPT ======================

// The color for the menu is customizable. Default: f2cb0b. If you want to change it, use HTML color codes. Google it.
// IMPORTANT: If you have an antihack running like infiSTAR.de's their AH then add these names to the allowed actions list:
// s_player_servermenu,s_player_servermenu1,s_player_servermenu2,s_player_servermenu3,s_player_servermenu4,s_player_servermenuCancel,	

   // IT07's Server Menu script
    if((speed player <= 1) && _canDo) then {
        if (s_player_servermenu < 0) then {
			s_player_servermenu = player addAction [("<t color=""#f2cb0b"">" + ("Server Info Menu") +"</t>"),"scripts\ServerMenu\server_menu.sqf","",-1,false,false,"", ""];
		};
    } else {
        player removeAction s_player_servermenu;
		s_player_servermenu = -1;
		player removeAction s_player_servermenu1;
		player removeAction s_player_servermenu2;
		player removeAction s_player_servermenu3;
		player removeAction s_player_servermenu4;
		player removeAction s_player_servermenu5;
		player removeAction s_player_servermenu6;
		player removeAction s_player_servermenu7;
		player removeAction s_player_servermenu8;
		player removeAction s_player_servermenu9;	
		player removeAction s_player_servermenu10;		
		player removeAction s_player_servermenuCancel;
    };

// ====================== SERVER MENU SCRIPT END ======================	
	
//--------------------------------Grab Flare--------------------------------------
if (_canPickLight and !dayz_hasLight) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

if (dayz_onBack != "" && !dayz_onBackActive && !_inVehicle && !_onLadder && !r_player_unconscious) then {
	if (s_player_equip_carry < 0) then {
		_text = getText (configFile >> "CfgWeapons" >> dayz_onBack >> "displayName");
		s_player_equip_carry = player addAction [format[localize "STR_ACTIONS_WEAPON", _text], "\z\addons\dayz_code\actions\player_switchWeapon.sqf", "action", 0.5, false, true];
	};
} else {
	player removeAction s_player_equip_carry;
	s_player_equip_carry = -1;
};

//--------------------------------------fishing-------------------------------
if ((_currentWeapon in Dayz_fishingItems) && !dayz_fishingInprogress && !_inVehicle && !dayz_isSwimming) then {
	if (s_player_fishing < 0) then {
		s_player_fishing = player addAction [localize "STR_ACTION_CAST", "\z\addons\dayz_code\actions\player_goFishing.sqf",player, 0.5, false, true];
	};
} else {
	player removeAction s_player_fishing;
	s_player_fishing = -1;
};
if ((_primaryWeapon in Dayz_fishingItems) && !dayz_fishingInprogress && (_inVehicle and (driver _vehicle != player))) then {
		if (s_player_fishing_veh < 0) then {
			s_player_fishing_veh = _vehicle addAction [localize "STR_ACTION_CAST", "\z\addons\dayz_code\actions\player_goFishing.sqf",_vehicle, 0.5, false, true];
		};
} else {
	_vehicle removeAction s_player_fishing_veh;
	s_player_fishing_veh = -1;
};

//--------------------------- SUICIDE START-----------------------------
		private ["_handGun"];
		_handGun = currentWeapon player;
		if ((_handGun in ["glock17_EP1","M9","M9SD","Makarov","MakarovSD","revolver_EP1","UZI_EP1","Sa61_EP1","Colt1911"]) && (player ammo _handGun > 0)) then {
			hasSecondary = true;
		} else {
			hasSecondary = false;
		};
		if((speed player <= 1) && hasSecondary && _canDo) then {
			if (s_player_suicide < 0) then {
				s_player_suicide = player addaction[("<t color=""#ff0000"">" + ("Commit Suicide") +"</t>"),"DamiMods\scripts\suicide.sqf",_handGun,0,false,true,"", ""];
			};
		} else {
			player removeAction s_player_suicide;
			s_player_suicide = -1;
		};

//------------------------------ SUICIDE END --------------------------------------

if (!isNull _cursorTarget and !_inVehicle and (player distance _cursorTarget < 7)) then { //Has some kind of target
	if (_hasFuelE20 or _hasFuelE5) then {
		_isFuel = (_cursorTarget isKindOf "Land_Ind_TankSmall") or (_cursorTarget isKindOf "Land_fuel_tank_big") or (_cursorTarget isKindOf "Land_fuel_tank_stairs") or (_cursorTarget isKindOf "Land_wagon_tanker");
	};	
		
//####----####----####---- Base Building 1.3 Start ----####----####----####
	_lever = cursorTarget;
	_codePanels = ["Infostand_2_EP1", "Fence_corrugated_plate"];
	_baseBuildAdmin = ((getPlayerUID player) in BBSuperAdminAccess);
	_baseBuildLAdmin = ((getPlayerUID player) in BBLowerAdminAccess);
	_authorizedUID = cursorTarget getVariable ["AuthorizedUID", []];
	_authorizedGateCodes = if ((_ownerID != "0") && (count _authorizedUID > 0)) then {((getPlayerUID player) in (_authorizedUID select 1));}; //Check it's not a map object/unbuilt object to avoid RPT spam
	_adminText = if (!_authorizedGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
	
	//Let players check the UID of other players when near their flags
	if (_isMan && (_flagBasePole distance player < 10)) then {
	_ownerFlag = _flagBasePole getVariable ["characterID", "0"]; //Checks owner IDs of flags, simply to avoid RPT spam with map objects
	_flagAuthUID = _flagBasePole getVariable ["AuthorizedUID", []]; //Gets master AuthUID from 
	_flagAuthGateCodes = if (_ownerFlag != "0") then {((getPlayerUID player) in (_flagAuthUID select 1));}; //Checks if player has access to flag
	_adminText = if (!_flagAuthGateCodes && _baseBuildAdmin) then {"ADMIN:";}else{"";};//Let admins know they aren't registered
		if (_flagAuthGateCodes || _baseBuildAdmin) then {
			if (s_player_getTargetUID < 0) then {
				s_player_getTargetUID = player addAction [format["%1Get UID of Targeted Player",_adminText], "dayz_code\actions\get_player_UID.sqf", cursorTarget, 4, false, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_getTargetUID;
		s_player_getTargetUID = -1;
	};
	
	// Operate Gates AND Add Authorization to Gate
	if (((typeOf(cursortarget) in _codePanels) && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) || ((typeOf(cursortarget) in allbuildables_class) && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild)) then {
		_gates = nearestObjects [_lever, ["Concrete_Wall_EP1","MAP_Wall_IndCnc2_3","MAP_Ohrada_popelnice"], 15];
		if (s_player_gateActions < 0) then {
			if (typeOf(cursortarget) == "Fence_corrugated_plate") then {
					s_player_gateActions = player addAction [format[("<t color=""#FFF700"">" + ("%1Operate Single Metal Gate") +"</t>"),_adminText], "dayz_code\external\keypad\fnc_keyPad\operate_gates.sqf", _lever, 6, true, true, "", ""];
			} else {
				if (typeOf(cursortarget) == "Infostand_2_EP1") then {
					if (count _gates > 0) then {
						s_player_gateActions = player addAction [format[("<t color=""#FFF700"">" + ("%1Operate Nearest Concrete Gates Within 15 meters") +"</t>"),_adminText], "dayz_code\external\keypad\fnc_keyPad\operate_gates.sqf", _lever, 6, true, true, "", ""];
					} else {s_player_gateActions = player addAction [format[("<t color=""#FFF700"">" + ("%1No gates around to operate") +"</t>"),_adminText], "", _lever, 6, false, true, "", ""];};
				};
			};
		};
		if (s_player_giveBaseOwnerAccess < 0) then {
			s_player_giveBaseOwnerAccess = player addAction [format["%1Give all base owners (from flagpole) access to object/gate",_adminText], "dayz_code\external\keypad\fnc_keyPad\functions\give_gateAccess.sqf", _lever, 1, false, true, "", ""];
		};
		if (s_player_addGateAuthorization < 0) then {
			s_player_addGateAuthorization = player addAction [format["%1Add Player UIDs to Grant Gate/Object Access",_adminText], "dayz_code\external\keypad\fnc_keyPad\enterCodeAdd.sqf", _lever, 1, false, true, "", ""];
		};
		if (s_player_removeGateAuthorization < 0) then {
				s_player_removeGateAuthorization = player addaction [format[("<t color=""#F01313"">" + ("%1Remove Player UIDs from Gate/Object Access") +"</t>"),_adminText],"dayz_code\external\keypad\fnc_keyPad\enterCodeRemove.sqf", _lever, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_giveBaseOwnerAccess;
		s_player_giveBaseOwnerAccess = -1;
		player removeAction s_player_gateActions;
		s_player_gateActions = -1;
		player removeAction s_player_addGateAuthorization;
		s_player_addGateAuthorization = -1;
		player removeAction s_player_removeGateAuthorization;
		s_player_removeGateAuthorization = -1;
	};
	// Operate ROOFS
	if ((typeOf(cursortarget) in _codePanels) && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) then {
		_gates = nearestObjects [_lever, ["Land_Ind_Shed_01_main","Land_Ind_Shed_01_end","Land_Ind_SawMillPen"], BBFlagRadius];
		if (s_player_roofToggle < 0) then {
			if (typeOf(cursortarget) == "Infostand_2_EP1") then {
				if (count _gates > 0) then {
					s_player_roofToggle = player addAction [format[("<t color=""#FFF700"">" + ("%1Operate Roof Covers") +"</t>"),_adminText], "dayz_code\external\keypad\fnc_keyPad\operate_roofs.sqf", _lever, 6, false, true, "", ""];
				} else {s_player_roofToggle = player addAction [format[("<t color=""#FFF700"">" + ("%1No roof covers around to operate") +"</t>"),_adminText], "", _lever, 6, false, true, "", ""];};
			};
		};
	} else {
		player removeAction s_player_roofToggle;
		s_player_roofToggle = -1;
	};

	// Remove Object
//	if((typeOf(cursortarget) in allremovables)&& (_ownerID != "0") && (_hasToolbox || _baseBuildAdmin || _baseBuildLAdmin) && _canDo && !remProc && !procBuild && !removeObject) then {
	if((typeOf(cursortarget) in allremovables) && (_ownerID != "0") && (((getPlayerUID player) in (_authorizedUID select 1)) || _baseBuildAdmin) && _hasToolbox && _canDo && !remProc && !procBuild && !removeObject) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "dayz_code\actions\player_remove.sqf",cursorTarget, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	// Disarm Booby Trap Action
	if((cursortarget iskindof "Grave" && cursortarget distance player < 2.5) && (_ownerID != "0") && (_hasToolbox || _baseBuildAdmin || _baseBuildLAdmin) && _canDo && !remProc && !procBuild) then {
		if (s_player_disarmBomb < 0) then {
			s_player_disarmBomb = player addaction [format[("<t color=""#F01313"">" + ("%1Disarm Bomb") +"</t>"),_adminText],"dayz_code\actions\player_disarmBomb.sqf","",1,true,true,"", ""];
		};
	} else {
		player removeAction s_player_disarmBomb;
		s_player_disarmBomb = -1;
	};
	
	//Light Menu
	if((typeOf(cursortarget) == "Infostand_2_EP1") && (_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) then {
		_nearestFlags = nearestObjects [_lever, [BBTypeOfFlag], BBFlagRadius];
		_baseFlag = _nearestFlags select 0;
		_barrels = nearestObjects [_baseFlag, ["Land_Fire_Barrel"], BBFlagRadius];//Makes sure there are barrels in range of the flag
		_towers = nearestObjects [_baseFlag, ["Land_Ind_IlluminantTower"], BBFlagRadius];//Makes sure there are towers in range of the flag
		if (count _barrels > 0 || count _towers >0) then {
			if (s_player_bbLightMenu < 0) then {
				s_player_bbLightMenu = player addAction [format[("<t color=""#4FF795"">" + ("%1Light Options") +"</t>"),_adminText], "dayz_code\actions\lights\lightMenu.sqf", _lever, 5, false, false, "", ""];
			};
		} else {
			if (s_player_bbLightMenu < 0) then {
				s_player_bbLightMenu = player addAction [format[("<t color=""#4FF795"">" + ("%1No Barrel/Tower Lights in Range of Flag") +"</t>"),_adminText], "", _lever, 5, false, true, "", ""];
			};
		};
	} else {
		player removeAction s_player_bbLightMenu;
		s_player_bbLightMenu = -1;
	};

	//Zombie Shield
	if ((typeOf(cursorTarget) == BBTypeOfZShield) &&(_authorizedGateCodes || _baseBuildAdmin) && !remProc && !procBuild) then {
		if (s_player_giveBaseOwnerAccess > 0) then { //Temp fix to prevent players having more than the max allowed number of shield gens
		player removeAction s_player_giveBaseOwnerAccess;
		s_player_giveBaseOwnerAccess = -1;
		};
		if (BBEnableZShield == 1) then {
			if (s_player_bbZombieShield_on < 0) then {
				s_player_bbZombieShield_on = player addAction [format[("<t color=""#FFF700"">" + ("%1Zombie Shield On") +"</t>"),_adminText], "dayz_code\actions\shield\bbZombieShield.sqf", [_lever, true], 6, true, true, "", ""];
			};
			if (s_player_bbZombieShield_off < 0) then {
				s_player_bbZombieShield_off = player addAction [format[("<t color=""#FFF700"">" + ("%1Zombie Shield Off") +"</t>"),_adminText], "dayz_code\actions\shield\bbZombieShield.sqf", [_lever, false], 6, false, true, "", ""];
			};
		} else {
			if (s_player_bbZombieShield_on < 0) then {
				s_player_bbZombieShield_on = player addAction [format[("<t color=""#FFF700"">" + ("%1Zombie Shields are disabled on this server") +"</t>"),_adminText], "", [], 6, false, true, "", ""];
			};
			player removeAction s_player_bbZombieShield_off;
			s_player_bbZombieShield_off = -1;
		};
	} else {
		player removeAction s_player_bbZombieShield_on;
		s_player_bbZombieShield_on = -1;
		player removeAction s_player_bbZombieShield_off;
		s_player_bbZombieShield_off = -1;
	};
//####----####----####---- Base Building 1.3 End ----####----####----####

//---------------------------------gather------------------------------------------
	if(_isPlant and _canDo) then {
		if (s_player_gather < 0) then {
			_text = getText (configFile >> "CfgVehicles" >> typeOf _cursorTarget >> "displayName");
			s_player_gather = player addAction [format[localize "str_actions_gather",_text], "\z\addons\dayz_code\actions\player_gather.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_gather;
		s_player_gather = -1;
	};

//--------------------------------Allow player to force save-----------------------------------
	if((_isVehicle or _isTent or _isStash or _isMediumStash) and _canDo and !_isMan and (damage _cursorTarget < 1)) then {
		if (s_player_forceSave < 0) then {
			s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",_cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_forceSave;
		s_player_forceSave = -1;
	};
//-----------------------------flip vehicle small vehicles by your self and all other vehicles with help nearby---------------------------
		if (_isVehicle and !_canmove and _isAlive and (player distance cursorTarget >= 2) and (count (crew cursorTarget))== 0 and ((vectorUp cursorTarget) select 2) < 0.5) then {
		_playersNear = {isPlayer _x} count (player nearEntities ["CAManBase", 6]);
		if(_isVehicletype or (_playersNear >= 3)) then {
			if (s_player_flipveh  < 0) then {
				s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",cursorTarget, 1, true, true, "", ""];		
			};	
		};
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	};

//------------------------------Allow player to fill Fuel can-----------------------------
	if((_hasFuelE20 or _hasFuelE5) and _isFuel and !_isZombie and !_isAnimal and !_isMan and _canDo and !a_player_jerryfilling) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};

//---------------------------------Auto Refuel-------------------------------------
	_gasolineras = nearestObjects[player,["land_tank_propane","Land_A_FuelStation_Feed","Land_repair_center","C130J_wreck_EP1","Land_A_FuelStation_Shed","Land_A_FuelStation_Build","Land_Ind_TankSmall2","Land_Ind_TankSmall2_EP1","Land_Ind_TankSmall","Land_fuel_tank_big","Land_fuel_tank_small","Land_fuel_tank_stairs","Land_Fuel_tank_stairs_ep1","Land_wagon_tanker"],10];
	_esGasolinera=(count _gasolineras) > 0;
    if((dayz_myCursorTarget != cursorTarget) and _isVehicle and  _esGasolinera and _canDo and !_isMan) then {
	_vehicle = cursorTarget;
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	dayz_myCursorTarget = _vehicle;
	_string = "<t color='#ffff00'>Auto Refuel</t>"; 
	_handle = dayz_myCursorTarget addAction [_string, "\z\addons\ow_assets\actions\refuel_auto.sqf",[_vehicle], 0, false, true, "",""];
	s_player_repairActions set [count s_player_repairActions,_handle];                
};

//------------------------------Allow player to fill vehicle 20L---------------------------
	if(_hasFuel20 and _canDo and !_isZombie and !_isAnimal and !_isMan and _isVehicle and (fuel _cursorTarget < 1) and (damage _cursorTarget < 1)) then {
		if (s_player_fillfuel20 < 0) then {
			s_player_fillfuel20 = player addAction [format[localize "str_actions_medical_10",_text,"20"], "\z\addons\dayz_code\actions\refuel.sqf",["ItemJerrycan"], 0, true, true, "", "'ItemJerrycan' in magazines player"];
		};
	} else {
		player removeAction s_player_fillfuel20;
		s_player_fillfuel20 = -1;
	};

//----------------------------------Allow player to fill vehicle 5L-----------------------------
	if(_hasFuel5 and _canDo and !_isZombie and !_isAnimal and !_isMan and _isVehicle and (fuel _cursorTarget < 1)) then {
		if (s_player_fillfuel5 < 0) then {
			s_player_fillfuel5 = player addAction [format[localize "str_actions_medical_10",_text,"5"], "\z\addons\dayz_code\actions\refuel.sqf",["ItemFuelcan"], 0, true, true, "", "'ItemFuelcan' in magazines player"];
		};
	} else {
		player removeAction s_player_fillfuel5;
		s_player_fillfuel5 = -1;
	};

//--------------------------------------Allow player to spihon vehicles------------------------------
	if ((_hasFuelE20 or _hasFuelE5) and !_isZombie and !_isAnimal and !_isMan and _isVehicle and _canDo and !a_player_jerryfilling and (fuel _cursorTarget > 0) and (damage _cursorTarget < 1)) then {
		if (s_player_siphonfuel < 0) then {
			s_player_siphonfuel = player addAction [format[localize "str_siphon_start"], "\z\addons\dayz_code\actions\siphonFuel.sqf",_cursorTarget, 0, true, true, "", ""];
		};
	} else {
		player removeAction s_player_siphonfuel;
		s_player_siphonfuel = -1;
	};

//------------------------------------------Harvested--------------------------------------------
	if (!alive _cursorTarget and _isAnimal and _hasKnife and !_isHarvested and _canDo) then {
		if (s_player_butcher < 0) then {
			s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",_cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};
//-------------------------------------Fireplace Actions check---------------------------------------
	if (inflamed _cursorTarget and _canDo) then {
		/*
		{
			if (_x in magazines player) then {
				_hastinitem = true;
			};
		} forEach boil_tin_cans;
		
		_rawmeat = meatraw;
		_hasRawMeat = false;
		{
			if (_x in magazines player) then {
				_hasRawMeat = true;
			};
		} forEach _rawmeat;
	*/
		_hasRawMeat = {_x in meatraw} count magazines player > 0;
		_hastinitem = {_x in boil_tin_cans} count magazines player > 0;
		
//------------------------------------------Cook Meat--------------------------------------------
		if (_hasRawMeat and !a_player_cooking) then {
			if (s_player_cook < 0) then {
				s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		}; 
//--------------------------------------------Boil Water-----------------------------------------------
		if (_hastinitem and _hasbottleitem and !a_player_boil) then {
			if (s_player_boil < 0) then {
				s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",_cursorTarget, 3, true, true, "", ""];
			};
		};
	} else {
		if (a_player_cooking) then {
			player removeAction s_player_cook;
			s_player_cook = -1;
		};
		if (a_player_boil) then {
			player removeAction s_player_boil;
			s_player_boil = -1;
		};
	};

	if(_cursorTarget == dayz_hasFire and _canDo) then {
		if ((s_player_fireout < 0) and !(inflamed _cursorTarget) and (player distance _cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};
	
// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.1------------------------------------------------------------------------
	// Smelt Engine Parts
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_engineparts < 0) then {
			s_player_smelt_engineparts = player addAction[("<t color=""	#FF9999"">" + ("Smelt Engine Parts") +"</t>"),"DamiMods\smelt\smelt_engineparts.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_engineparts;
		s_player_smelt_engineparts = -1;
	};
	// Smelt Fuel Tank
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_fueltank < 0) then {
			s_player_smelt_fueltank = player addAction[("<t color=""	#FF9999"">" + ("Smelt Fuel Tank") +"</t>"),"DamiMods\smelt\smelt_fueltank.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_fueltank;
		s_player_smelt_fueltank = -1;
	};
	// Smelt Sand Bag
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_sandbag < 0) then {
			s_player_smelt_sandbag = player addAction[("<t color=""	#FF9999"">" + ("Smelt Sandbags") +"</t>"),"DamiMods\smelt\smelt_sandbag.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_sandbag;
		s_player_smelt_sandbag = -1;
	};
	// Smelt Scrap Metal
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_scrapmetal < 0) then {
			s_player_smelt_scrapmetal = player addAction[("<t color=""	#FF9999"">" + ("Smelt Scrap Metal") +"</t>"),"DamiMods\smelt\smelt_scrapmetal.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_scrapmetal;
		s_player_smelt_scrapmetal = -1;
	};
	// Smelt Tank Trap
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_tanktrap < 0) then {
			s_player_smelt_tanktrap = player addAction[("<t color=""	#FF9999"">" + ("Smelt Tank Trap") +"</t>"),"DamiMods\smelt\smelt_tanktrap.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_tanktrap;
		s_player_smelt_tanktrap = -1;
	};
	// Smelt Wind Screen Glass
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_windscreenglass < 0) then {
			s_player_smelt_windscreenglass = player addAction[("<t color=""	#FF9999"">" + ("Smelt Wind Screen Glass") +"</t>"),"DamiMods\smelt\smelt_windscreenglass.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_windscreenglass;
		s_player_smelt_windscreenglass = -1;
	};
	// Smelt Wire Kit
	if (inflamed cursorTarget and _hasToolbox and _canDo) then {
		if (s_player_smelt_wirekit < 0) then {
			s_player_smelt_wirekit = player addAction[("<t color=""	#FF9999"">" + ("Smelt Wire Kit") +"</t>"),"DamiMods\smelt\smelt_wirekit.sqf",cursorTarget, 3 ,true, true,"", ""];
		};
	} else {
		player removeAction s_player_smelt_wirekit;
		s_player_smelt_wirekit = -1;
	};
// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.1 End------------------------------------------------------------------------

//------------------------------DANCE---------------------------------------
    if (inflamed cursorTarget and _canDo) then {
            if (s_player_dance < 0) then {
            s_player_dance = player addAction ["Dance","\z\addons\ow_assets\actions\dance.sqf",cursorTarget, 1, true, true, "",""];
        };
    } else {
        player removeAction s_player_dance;
        s_player_dance = -1;
    };
	
//-------------------------Allow player to set tent on fire--------------------
    if(_isTent and _hasMatches and _canDo and !_isMan) then {
        if (s_player_igniteTent < 0) then {
            s_player_igniteTent = player addAction [format["Ignite Tent"], "\z\addons\dayz_code\actions\tent_ignite.sqf",cursorTarget, 1, true, true, "", ""];
        };
    } else {
        player removeAction s_player_igniteTent;
        s_player_igniteTent = -1;
    };

//------------------------------Packing my tent--------------------------------
	if(cursorTarget isKindOf "TentStorage" and _canDo) then {
		if ((s_player_packtent < 0) and (player distance _cursorTarget < 3)) then {
			s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
		};

//------------------------------------Sleep-----------------------------------------
	if(cursorTarget isKindOf "TentStorage") then {
		if ((s_player_sleep < 0) and (player distance _cursorTarget < 3)) then {
			s_player_sleep = player addAction [localize "str_actions_self_sleep", "DamiMods\scripts\player_sleep.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};
	
//---------------------Remove Parts from Vehicles - By SilverShot--------------------------------
	if( !_isMan and _canDo and _hasToolbox and (silver_myCursorTarget != cursorTarget) and cursorTarget isKindOf "AllVehicles" and (getDammage cursorTarget < 0.95) ) then {
	_vehicle = cursorTarget;
	_invalidVehicle = (_vehicle isKindOf "Motorcycle") or (_vehicle isKindOf "Tractor"); //or (_vehicle isKindOf "ATV_US_EP1") or (_vehicle isKindOf "ATV_CZ_EP1");
	if( !_invalidVehicle ) then {
	{silver_myCursorTarget removeAction _x} forEach s_player_removeActions;
	s_player_removeActions = [];
	silver_myCursorTarget = _vehicle;
	 
	_hitpoints = _vehicle call vehicle_getHitpoints;
	 
	{
	_damage = [_vehicle,_x] call object_getHit;
	 
	if( _damage < 0.15 ) then {
	private["_part"];
	 
	//change "HitPart" to " - Part" rather than complicated string replace
	_cmpt = toArray (_x);
	_cmpt set [0,20];
	_cmpt set [1,toArray ("-") select 0];
	_cmpt set [2,20];
	_cmpt = toString _cmpt;
	 
	_skip = true;
	if( _skip and _x == "HitFuel" ) then { _skip = false; _part = "PartFueltank"; _cmpt = _cmpt + "tank"};
	if( _skip and _x == "HitEngine" ) then { _skip = false; _part = "PartEngine"; };
	if( _skip and _x == "HitLFWheel" ) then { _skip = false; _part = "PartWheel"; };
	if( _skip and _x == "HitRFWheel" ) then { _skip = false; _part = "PartWheel"; };
	if( _skip and _x == "HitLBWheel" ) then { _skip = false; _part = "PartWheel"; };
	if( _skip and _x == "HitRBWheel" ) then { _skip = false; _part = "PartWheel"; };
	if( _skip and _x == "HitGlass1" ) then { _skip = false; _part = "PartGlass"; };
	if( _skip and _x == "HitGlass2" ) then { _skip = false; _part = "PartGlass"; };
	if( _skip and _x == "HitGlass3" ) then { _skip = false; _part = "PartGlass"; };
	if( _skip and _x == "HitGlass4" ) then { _skip = false; _part = "PartGlass"; };
	if( _skip and _x == "HitGlass5" ) then { _skip = false; _part = "PartGlass"; };
	if( _skip and _x == "HitGlass6" ) then { _skip = false; _part = "PartGlass"; };
	if( _skip and _x == "HitHRotor" ) then { _skip = false; _part = "PartVRotor"; };
	 
	if (!_skip ) then {
	_string = format["<t color='#0096ff'>Remove%1</t>",_cmpt,_color]; //Remove - Part
	_handle = silver_myCursorTarget addAction [_string, "\z\addons\ow_assets\actions\ss_remove.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
	s_player_removeActions set [count s_player_removeActions,_handle];
	};
	};
	 
	} forEach _hitpoints;
	};
	};

//--------------------------------Repairing Vehicles--------------------------------------------
//	if ((dayz_myCursorTarget != _cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (damage _cursorTarget < 1) and (player distance _cursorTarget < 8)) then {
	if ((dayz_myCursorTarget != _cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (player distance _cursorTarget < 8)) then {
		if (s_player_repair_crtl < 0) then {
			dayz_myCursorTarget = _cursorTarget;
			_menu = dayz_myCursorTarget addAction [localize "str_actions_rapairveh", "\z\addons\dayz_code\actions\repair_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
//			_menu1 = dayz_myCursorTarget addAction [localize "str_actions_salvageveh", "\z\addons\dayz_code\actions\salvage_vehicle.sqf",_cursorTarget, 0, true, false, "",""];
			s_player_repairActions set [count s_player_repairActions,_menu];
			s_player_repairActions set [count s_player_repairActions,_menu1];
			s_player_repair_crtl = 1;
		} else {
			{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
			s_player_repair_crtl = -1;
		};
	};

	if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\study_body.sqf",_cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
	
//------------------------------------Remove CLOTHES---------------------------------------------
    if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
    if (s_clothes < 0) then {
            s_clothes = player addAction [("<t color=""#FF0000"">" + ("Take Clothes") + "</t>"), "\z\addons\ow_assets\actions\removeclothes.sqf",cursorTarget, 1, false, true, "",""];
        };
    } else {
        player removeAction s_clothes;
        s_clothes = -1;
    };
} else {

//------------------------Extras------------------------------

//---------------------Remove Parts---------------------------
	{silver_myCursorTarget removeAction _x} forEach s_player_removeActions;s_player_removeActions = [];
	silver_myCursorTarget = objNull;

//----------------------Engineering----------------------------
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	player removeAction s_player_repair_crtl;
	s_player_repair_crtl = -1;
	dayz_myCursorTarget = objNull;
	
//####----####----####---- Base Building 1.3 Start ----####----####----####
	player removeAction s_player_getTargetUID;
	s_player_getTargetUID = -1;
	player removeAction s_player_giveBaseOwnerAccess;
	s_player_giveBaseOwnerAccess = -1;
	player removeAction s_player_gateActions;
	s_player_gateActions = -1;
	player removeAction s_player_roofToggle;
	s_player_roofToggle = -1;
	player removeAction s_player_addGateAuthorization;
	s_player_addGateAuthorization = -1;
	player removeAction s_player_removeGateAuthorization;
	s_player_removeGateAuthorization = -1;
	player removeAction s_player_disarmBomb;
	s_player_disarmBomb = -1;
	player removeAction s_player_bbZombieShield_on;
	s_player_bbZombieShield_on = -1;
	player removeAction s_player_bbZombieShield_off;
	s_player_bbZombieShield_off = -1;
	player removeAction s_player_inflameBarrels;
	s_player_inflameBarrels = -1;
	player removeAction s_player_deflameBarrels;
	s_player_deflameBarrels = -1;
	player removeAction s_player_towerLightsOn;
	s_player_towerLightsOn = -1;
	player removeAction s_player_towerLightsOff;
	s_player_towerLightsOff = -1;
	player removeAction s_player_bbLightMenu;
	s_player_bbLightMenu = -1;
//####----####----####---- Base Building 1.3 End ----####----####----####

//--------------Others----------------------------
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_igniteTent;
	s_player_igniteTent = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	
	// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.1------------------------------------------------------------------------
	player removeAction s_player_smelt_engineparts;
	s_player_smelt_engineparts = -1;

	player removeAction s_player_smelt_fueltank;
	s_player_smelt_fueltank = -1;

	player removeAction s_player_smelt_sandbag;
	s_player_smelt_sandbag = -1;

	player removeAction s_player_smelt_scrapmetal;
	s_player_smelt_scrapmetal = -1;

	player removeAction s_player_smelt_tanktrap;
	s_player_smelt_tanktrap = -1;

	player removeAction s_player_smelt_windscreenglass;
	s_player_smelt_windscreenglass = -1;

	player removeAction s_player_smelt_wirekit;
	s_player_smelt_wirekit = -1;
// ------------------------------------------------------------------------Piggd Smelt Scrap Metal ver 2.1 End------------------------------------------------------------------------

	player removeAction s_player_boil;
	s_player_boil = -1;	
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	
//---------------Dance------------------
	player removeAction s_player_dance;
	s_player_dance = -1;

//---------------Remove CLOTHES-----------
	player removeAction s_clothes;
    s_clothes = -1;
	
//----------------fuel------------------
	player removeAction s_player_fillfuel20;
	s_player_fillfuel20 = -1;
	player removeAction s_player_fillfuel5;
	s_player_fillfuel5 = -1;

//-----------------------dog-----------------
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
	
//-------------Allow player to siphon vehicle fuel------------------
	player removeAction s_player_siphonfuel;
	s_player_siphonfuel = -1;
	
//-------------------Allow player to gather----------------------
	player removeAction s_player_gather;
	s_player_gather = -1;
	player removeAction s_player_repackbike;
	s_player_repackbike = -1;
};

// ----------------------------- / Drink water \ ----------------------
private["_playerPos","_canDrink","_isPond","_isWell","_pondPos","_objectsWell","_objectsPond","_display"];
 
_playerPos = getPosATL player;
_canDrink = count nearestObjects [_playerPos, ["Land_pumpa","Land_water_tank","Land_Barrel_water","Land_Misc_ConcBox_EP1"], 4] > 0;
_isPond = false;
_isWell = false;
_pondPos = [];
_objectsWell = [];
 
if (!_canDrink) then {
    _objectsWell = nearestObjects [_playerPos, [], 4];
    {
        //Check for Well
        _isWell = ["_well",str(_x),false] call fnc_inString;
        if (_isWell) then {_canDrink = true};
    } forEach _objectsWell;
};
 
if (!_canDrink) then {
    _objectsPond = nearestObjects [_playerPos, [], 50];
    {
        //Check for pond
        _isPond = ["pond",str(_x),false] call fnc_inString;
        if (_isPond) then {
            _pondPos = (_x worldToModel _playerPos) select 2;
            if (_pondPos < 0) then {
                _canDrink = true;
            };
        };
    } forEach _objectsPond;
};
 
if (_canDrink) then {
        if (s_player_drinkWater < 0) then {
            s_player_drinkWater = player addaction[("<t color=""#0000c7"">" + (localize "STR_action_drink") +"</t>"),"DamiMods\scripts\drink_water.sqf"];
        };
    } else {
        player removeAction s_player_drinkWater;
        s_player_drinkWater = -1;
    };
// ----------------------------- \ Drink water / ----------------------
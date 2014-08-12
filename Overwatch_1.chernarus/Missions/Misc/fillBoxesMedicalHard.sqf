//AI Missions Medical Supply Box
private["_miscItem11","_miscItems1","_crateMedical"];
_crateMedical = _this select 0;

clearWeaponCargoGlobal _crateMedical;
clearMagazineCargoGlobal _crateMedical;

_crateMedical addBackpackCargoGlobal ['DZ_Backpack_EP1', 2];
_crateMedical addMagazineCargoGlobal ["ItemDomeTent", 2];

_miscItems1 = ["SmokeShellYellow","SmokeShellBlue","SmokeShellPurple","SmokeShellGreen","SmokeShellRed","ItemAntibiotic","FoodCanBakedBeans","ItemMorphine","ItemEpinephrine","ItemSodaPepsi",
				"HandChemGreen","HandChemBlue","HandChemRed","HandRoadFlare","ItemBloodbag","ItemPainkiller","ItemBandage","ItemSepsisBandage","ItemWaterbottle","FoodMRE","FoodCanPasta"];
				
	// Random 12 items, 5 of each
	for "_x" from 0 to 11 do {
		_miscItem11 = _miscItems1 call BIS_fnc_selectRandom;
		_crateMedical addmagazineCargoGlobal [_miscItem11, 5];
	};
//AI Missions Supply Box
private["_miscItem11","_miscItem22","_miscItems1","_miscItems2","_crateSupply"];
_crateSupply = _this select 0;

clearWeaponCargoGlobal _crateSupply;
clearMagazineCargoGlobal _crateSupply;
 
_crateSupply addMagazineCargoGlobal ["ItemGenerator", 2];
_crateSupply addMagazineCargoGlobal ["ItemDomeTent", 2];

_miscItems1 = ["ItemToolbox","ItemMatchbox","ItemHatchet","ItemCompass","ItemMachete","ItemRadio","Laserdesignator","ItemEtool"];

_miscItems2 = ["equip_wood_pallet","ItemWire","PartWheel","equip_metal_sheet","PartGeneric","ItemTankTrap","PartFueltank","ItemJerrycan","PartEngine","ItemSandbag","equip_scrapelectronics","equip_crate","ItemCamoNet",
				"PartGlass","equip_floppywire","Laserbatteries","equip_string","equip_duct_tape","equip_rope","equip_nails","equip_brick","ItemWaterbottle","FoodMRE","FoodCanPasta","ItemSodaPepsi","HandChemGreen",
				"HandChemBlue","HandChemRed","HandRoadFlare"];
				
	// Random 5 items, 3 of each
	for "_x" from 0 to 4 do {
		_miscItem11 = _miscItems1 call BIS_fnc_selectRandom;
		_crateSupply addmagazineCargoGlobal [_miscItem11, 3];
	};	
	// Random 10 items, 8 of each
		for "_x" from 0 to 9 do {
		_miscItem22 = _miscItems2 call BIS_fnc_selectRandom;
		_crateSupply addWeaponCargoGlobal [_miscItem22, 8];
	};
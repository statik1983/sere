if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	
	TOWING_objectSelected = _this select 0;
	_txt = format ["Select the vehicle you wish to load ""%1"" into.", getText (configFile >> "CfgVehicles" >> (typeOf TOWING_objectSelected) >> "displayName")];
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
	
	TOWING_local_lock = false;
};
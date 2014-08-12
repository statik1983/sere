waitUntil{!(isNil "BIS_Effects_Init")};
sleep 2;
BIS_Effects_EH_Fired = {false};
BIS_Effects_Rifle = {false};
BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";
BIS_Effects_Burn = compile preprocessFileLineNumbers "\ca\Data\ParticleEffects\SCRIPTS\destruction\burn.sqf";
BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
//BIS_Effects_Secondaries = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\secondaries.sqf";
BIS_Effects_globalEvent = {
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
	_this call BIS_Effects_startEvent;
};
BIS_Effects_startEvent = {
	_array = _this select 1;
	switch (_array select 0) do {
		case "AirDestruction": {
				[_array select 1] spawn BIS_Effects_AirDestruction;
		};
		case "AirDestructionStage2": {
				[_array select 1, _array select 2, _array select 3] spawn BIS_Effects_AirDestructionStage2;
		};
		case "Burn": {
				[_array select 1, _array select 2, _array select 3, false, false] spawn BIS_Effects_Burn;
		};
	};
};
"BIS_effects_gepv" addPublicVariableEventHandler BIS_Effects_startEvent;
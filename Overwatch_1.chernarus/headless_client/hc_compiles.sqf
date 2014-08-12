if (hasInterface || isServer || isDedicated) exitWith{};
	//Local vehicle damage
	vehicle_localHandleDamage 		= compile preprocessFileLineNumbers "headless_client\vehicle_localHandleDamage.sqf";			
	vehicle_localHandleKilled 		= compile preprocessFileLineNumbers "headless_client\vehicle_localHandleKilled.sqf";	

	ai_fired 							= compile preprocessFileLineNumbers "headless_client\ai_fired.sqf";				//Calculates weapon noise of AI unit
	ai_alertzombies 					= compile preprocessFileLineNumbers "headless_client\ai_alertzombies.sqf"; 		//AI weapon noise attracts zombie attention
	fnc_damageAI 						= compile preprocessFileLineNumbers "headless_client\fn_damageHandlerAI.sqf";
	npc_zombieCheck 					= compile preprocessFileLineNumbers "headless_client\npc_zombieCheck.sqf";
	npc_zombieAttack 				= compile preprocessFileLineNumbers "headless_client\npc_zombieAttack.sqf";
	fnc_unit_resupply				= compile preprocessFileLineNumbers "headless_client\unit_resupply.sqf";
	house_patrol 						= compile preprocessFileLineNumbers "headless_client\housePatrol.sqf";
	dayz_zombieSpeak 				= compile preprocessFileLineNumbers "headless_client\object_speak.sqf";
private["_npcTarget","_unit","_targets","_move","_damage","_wound","_index","_cnt","_sound","_local","_dir","_hpList","_hp","_strH","_dam","_total","_vehicle","_tPos","_zPos","_cantSee","_inAngle"];
_unit = _this select 0;
_type = _this select 1;
_npcTarget = _this select 2;
_vehicle = (vehicle _npcTarget);
//diag_log ("npc_zombieAttack started!");
_targets = _unit getVariable ["targets",[]];
//if (!(_vehicle in _targets)) exitWith {};

//Do the attack
if ((!(alive _npcTarget) || (_npcTarget getVariable ["unconscious",false])) && _vehicle == _npcTarget && _type == "zombie") then {
	_rnd = round(random 4) + 1;
	_move = "ZombieFeed" + str(_rnd);
} else {
	if (_type == "zombie") then {
		_rnd = round(random 9) + 1;
		_move = "ZombieStandingAttack" + str(_rnd);
	} else {
		_move = "Dog_Attack";
	};
};
if ((((_unit distance _npcTarget) <= 3) && !(isNull _npcTarget)) || ((_vehicle != _npcTarget) && (_unit distance _npcTarget) <= 8) && !(isNull _npcTarget)) then {
		_dir = [_unit,_npcTarget] call BIS_Fnc_dirTo;
		_unit setDir _dir;
		//_unit playMove _move;
		[objNull, _unit, rPlayMove,_move] call RE;
	//_unit playMove _move;
	//diag_log ("playMove started!");
	//Wait
	sleep 0.3;

	if (_vehicle != _npcTarget && (_unit distance _npcTarget) <= 8) then {
	//diag_log ("_vehicle != _npcTarget");
		_hpList = 	_vehicle call vehicle_getHitpoints;
		_hp = 		_hpList call BIS_fnc_selectRandom;
		//_wound = 	getText(configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> _hp >> "name");
		_damage = 	random 0.03;
		_chance =	round(random 12);
		
			if ((_chance % 4) == 0) then {
				_openVehicles = ["ATV_Base_EP1", "Motorcycle", "Bicycle"];
				{
					if (_vehicle isKindOf _x) exitWith {
						_npcTarget action ["eject", _vehicle];
					};
				} forEach _openVehicles;
			};
			_vehicle setdamage ((getDammage _vehicle) + _damage);
	} else {
		if (((_unit distance _npcTarget) <= 3) && !(isNull _npcTarget)) then {
			//diag_log ("_inAngle started!");
				//LOS check
					_damage = 	random 0.03;
					_npcTarget setdamage ((getDammage _npcTarget) + _damage);
					//diag_log ("setdamage started!");
					[_unit,"hit",2,false] call dayz_zombieSpeak;
		
			//};
		};
	};
};
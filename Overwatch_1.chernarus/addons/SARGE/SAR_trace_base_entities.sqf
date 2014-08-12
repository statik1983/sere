// =========================================================================================================
//  SAR_AI - DayZ AI library
//  Version: 1.5.0 
//  Author: Sarge (sarge@krumeich.ch) 
//
//		Wiki: to come
//		Forum: http://opendayz.net/#sarge-ai.131
//		
// ---------------------------------------------------------------------------------------------------------
//  Required:
//  UPSMon  (specific SARGE version)
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
//   SAR_trace_entities.sqf // Modified Daimyo
//   last modified: 28.5.2013
// ---------------------------------------------------------------------------------------------------------

private ["_baseOwner","_dynamicZombieAggro","_zombieAggro","_attackAll","_friendlyPlayers","_zombie_detectRange","_ai","_entity_array","_humanity","_humanitylimit","_sleeptime","_detectrange"];
if (hasInterface || isServer || isDedicated) exitWith{};


_ai = _this select 0;
_friendlyPlayers = [];
_friendlyPlayers = _ai getVariable ["SAR_FLAG_FRIENDLY", []];
_attackAll 	=  _ai getVariable ["ATTACK_ALL", true];
_detectrange = SAR_DETECT_HOSTILE;
_zombie_detectRange = 50;
_humanitylimit=SAR_HUMANITY_HOSTILE_LIMIT;
_humanity = 0;
_baseOwner = 0;
_sleeptime = 3; //SAR_DETECT_INTERVAL;
 _zombieAggro = 40;   
 
arrayCompare =
{
    private ["_array1", "_array2", "_i", "_return"];

    _array1 = _this select 0;
    _array2 = _this select 1;

    _return = true;
    if ( (count _array1) != (count _array2) ) then
    {
        _return = false;
    }
    else
    {
        _i = 0;
        while {_i < (count _array1) && _return} do
        {
            if ( (typeName (_array1 select _i)) != (typeName (_array2 select _i)) ) then
            {
                _return = false;
            }
            else
            {
                if (typeName (_array1 select _i) == "ARRAY") then
                {
                    if (!([_array1 select _i, _array2 select _i] call arrayCompare)) then
                    {
                        _return = false;
                    };
                }
                else
                {
                    if ((_array1 select _i) != (_array2 select _i)) then
                    {
                        _return = false;
                    };
                };
            };
            _i = _i + 1;
        };
    }; 
    _return
};
 
while {alive _ai || !isNull _ai} do {
     if (hasInterface || isServer || isDedicated) exitWith{};
	 
    _entity_array = (getPosATL _ai) nearEntities ["zZombie_Base",_zombie_detectRange];
	
		{
			_dynamicZombieAggro = (floor(random _zombieAggro) + _zombieAggro);
			if (_x isKindof "zZombie_Base" && _ai distance _x <= _dynamicZombieAggro) then {
				if(rating _x > -30000) then {
					_x addrating -30000;
					if(SAR_EXTREME_DEBUG) then {
						diag_log "SAR EXTREME DEBUG: Zombie rated down";
					};
				};
				
				_unitPos = unitPos _ai; 
				_dynamicZombieAggro = (floor(random _zombieAggro) + _zombieAggro);
				if (_ai distance _x <= _dynamicZombieAggro && random 1 > 0.8 && speed _ai > 10 || _unitPos == "Up" ||  _unitPos == "Middle") then {
					[_ai,_dynamicZombieAggro,true,(getPosATL _ai)] spawn ai_alertzombies;
				} else {
					if (_ai distance _x <= 25 && (speed _ai > 10 && _unitPos == "Up") && random 1 > 0.2) then {
						[_ai,25,true,(getPosATL _ai)] spawn ai_alertzombies;
					};
					if (_ai distance _x <= 15 && (speed _ai > 10 || _unitPos == "Up" ||  _unitPos == "Middle")) then {
						[_ai,15,true,(getPosATL _ai)] spawn ai_alertzombies;
					};
					if (_ai distance _x <= 10) then {
						[_ai,10,true,(getPosATL _ai)] spawn ai_alertzombies;
					};
				};
			};
		} forEach _entity_array;
		
		_friendlyPlayers = _ai getVariable ["SAR_FLAG_FRIENDLY", []]; // Check dynamically if friendlies added
		_attackAll 	= _ai getVariable ["ATTACK_ALL", true];  // Check dynamically attack all changes
		_entity_array = (getPosATL _ai) nearEntities [["CAManBase","AllVehicles"],_detectrange + 200];
	if(_attackAll) then { 
		{
					if (isPlayer _x) then {
						_baseOwner = _x getVariable ["BaseOwner", 0];
						if (_baseOwner == 0) then {
							if (((getPlayerUID _x) in _friendlyPlayers)) then {
								_x addrating 50000;
								_x setVariable ["BaseOwner", 1, true];
							} else {
								_x addrating -50000;
							};	
						} else {
							if (_baseOwner == 1 && rating _x < 50000) then {
								_x addrating 50000;
							};
						};
					} else {
						_tFriendlyPlayers = _x getVariable ["SAR_FLAG_FRIENDLY", []];
						_result = [_tFriendlyPlayers, _friendlyPlayers] call arrayCompare;
						if (_result) then {
							_x addrating 50000;
						} else { _x addrating -50000};
					};
		} forEach _entity_array;
	};
    sleep _sleeptime;
};
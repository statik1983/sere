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
//   SAR_trace_entities.sqf
//   last modified: 28.5.2013
// ---------------------------------------------------------------------------------------------------------

private ["_dynamicZombieAggro","_zombieAggro","_friendlyPlayers","_zombie_detectRange","_ai","_entity_array","_humanity","_humanitylimit","_sleeptime","_detectrange"];
if (hasInterface || isServer || isDedicated) exitWith{};


_ai = _this select 0;
//_friendlyPlayers = [];
//_friendlyPlayers = _ai getVariable "SAR_FLAG_FRIENDLY";
_detectrange = SAR_DETECT_HOSTILE;
_zombie_detectRange = SAR_DETECT_HOSTILE_ZOMBIE;
_humanitylimit=SAR_HUMANITY_HOSTILE_LIMIT;
_humanity = 0;
_sleeptime = SAR_DETECT_INTERVAL;
_zombieAggro = 35;
while {alive _ai || !isNull _ai} do { 
	if (hasInterface || isServer || isDedicated) exitWith{};
	
	_entity_array = (getPosATL _ai) nearEntities ["zZombie_Base",_zombie_detectRange];	
	{
			if (_x isKindof "zZombie_Base") then {	
				if(rating _x > -30000) then {
					_x addrating -30000;
					if(SAR_EXTREME_DEBUG) then {
						diag_log "SAR EXTREME DEBUG: Zombie rated down";
					};
				};
				
				_unitPos = unitPos _ai; 
				_dynamicZombieAggro = (floor(random _zombieAggro) + _zombieAggro);
				if (_ai distance _x <= _dynamicZombieAggro && random 1 > 0.6 && speed _ai > 10 || _unitPos == "Up" ||  _unitPos == "Middle") then {
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
				_ai reveal [_x,4];
			};
	} forEach _entity_array;

    _entity_array = (getPosATL _ai) nearEntities ["CAManBase",_detectrange];
    
	{
        if(isPlayer _x && {vehicle _x == _x}) then { // only do this for players not in vehicles
            _humanity= _x getVariable ["humanity",0];
            If (_humanity < _humanitylimit && {rating _x > -10000}) then {
                if(SAR_EXTREME_DEBUG) then {
                    diag_log format["SAR EXTREME DEBUG: reducing rating (trace_entities) for player: %1", _x];
                };
                _x addrating -10000;
            };
        };
    
    } forEach _entity_array;
    sleep _sleeptime;
};
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
//  UPSMon  (special SARGE version)
//  SHK_pos 
//  
// ---------------------------------------------------------------------------------------------------------
//   SAR_trace_from_vehicle.sqf
//   last modified: 28.5.2013
// ---------------------------------------------------------------------------------------------------------

// Traces only from vehicles and traces only players which are not in a vehicle, so NO ZED tracing, should not be used for infantry. 

private ["_dynamicZombieAggro","_zombieAggro","_friendlyPlayers","_ground_detectrange","_zombie_detectRange","_ai","_entity_array","_humanity","_humanitylimit","_sleeptime","_detectrange","_tracewhat","_player_rating","_clientmachine"];
if (hasInterface || isServer || isDedicated) exitWith{};


_ai = _this select 0;
_tracewhat = "CAManBase";
_zombie_detectRange = SAR_DETECT_HOSTILE_ZOMBIE;
_detectrange = SAR_DETECT_HOSTILE_FROM_VEHICLE;
_ground_detectrange = SAR_DETECT_HOSTILE;
_humanitylimit = SAR_HUMANITY_HOSTILE_LIMIT;
_humanity = 0;
_sleeptime = SAR_DETECT_FROM_VEHICLE_INTERVAL;
  _zombieAggro = 35;  
while {alive _ai || !isNull _ai} do {
	if (hasInterface || isServer || isDedicated) exitWith{};
	
    _entity_array = (getPosATL _ai) nearEntities ["zZombie_Base",_zombie_detectRange];
    {
        if(vehicle _ai != _ai && _x distance _ai <= 50) then { // AI in vehicles, attack if <= 50 meters

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
            };
        };
	} forEach _entity_array;
	//_entity_array = (getPosATL _ai) nearEntities ["zZombie_Base",_zombie_detectRange];
    {
        if(vehicle _ai == _ai && _x distance _ai <= 50) then { //AI not in vehicle detect zombies 100

            if (_x isKindof "zZombie_Base") then {
        
                if(rating _x > -30000) then {
                    _x addrating -30000;
                    if(SAR_EXTREME_DEBUG) then {
                        diag_log "SAR EXTREME DEBUG: Zombie rated down";
                    };
                };
            };
        };
	} forEach _entity_array;
	
	_entity_array = (getPosATL _ai) nearEntities ["CAManBase",_ground_detectrange];
	{

        if(isPlayer _x && vehicle _ai == _ai) then { // If not in vehicle, normal detect player range
            
            _humanity= _x getVariable ["humanity",0];

            If (_humanity < _humanitylimit && {rating _x > -10000}) then {
                if(SAR_EXTREME_DEBUG) then {
                    diag_log format["SAR EXTREME DEBUG: reducing rating (trace_entities) for player: %1", _x];
                };
				_x addrating -10000;
            };
        };
    
    } forEach _entity_array;
	
    _entity_array = (getPosATL _ai) nearEntities [_tracewhat, _detectrange];
    
    {
        if(isPlayer _x && vehicle _ai != _ai) then { // If in vehicle, vehicle detect range

            _humanity= _x getVariable ["humanity",0];
            _player_rating = rating _x;
            
            If (_humanity < _humanitylimit && {_player_rating > -10000}) then {

                if(SAR_EXTREME_DEBUG) then {
                    diag_log format["SAR EXTREME DEBUG: reducing rating (trace_from_vehicle) for player: %1", _x];
                };
                
                //define global variable
                adjustrating = [_x,(0 - (10000+_player_rating))];
            
                // get the players machine ID
                _clientmachine = owner _x;
            
                // transmit the global variable to this client machine
                publicVariable "adjustrating";
                
                // reveal player to vehicle group
                _ai reveal [_x,4];
                
            };
        };
        
    } forEach _entity_array;

    sleep _sleeptime;
};
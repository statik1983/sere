onMapSingleClick "";
openMap [false, false];
#include "Settings.sqf";
_randombox = _THEboxes call BIS_fnc_selectRandom;
_randcont = _DROPbox call BIS_fnc_selectRandom;
_TheModel = _planeheli call BIS_fnc_selectRandom;
_hasRC = _RCitem in items player;
_plane_start = _start_pos call BIS_fnc_selectRandom;
_pos = [_this select 0, _this select 1, _this select 2];
_hcGPUID = getPlayerUID player;
_dist = (_pos distance _plane_start);
_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
_sMSG2 = format["An airdrop for a Supply Box has been called by survivor: %1 \nType of transport: MV-22 Osprey, and distance until drop: %5KM\nDrop GPS coordinates at: %4",dayz_playerName,_TheModel,_txt1,mapGridPosition _pos,(round(_dist/1000))];
if (_BCast) then {
	[nil,nil,rspawn,[_sMSG2],{cutText [_this select 0,"PLAIN DOWN",10]; sleep 10;}] call RE;	
} else {cutText [_sMSG2,"PLAIN DOWN",10]; sleep 10;};

diag_log format ["Supply box has been called in by survivor: %2 Drop GPS coordinates at: %1 Type of transport: %3",mapGridPosition _pos,dayz_playerName,_TheModel]; 

_Drop_plane = createVehicle [_TheModel, _plane_start, [], 0, "FLY"];
_Drop_plane setVariable["Sarge",1,true];
_Drop_plane engineOn true;
_Drop_plane flyInHeight 150;
_Drop_plane forceSpeed 175;
_Drop_plane setspeedmode "LIMITED";

clearMagazineCargoGlobal _Drop_plane;
clearWeaponCargoGlobal _Drop_plane;

_aigroup = creategroup civilian;

_pilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _Drop_plane,[],0,"FORM"];
_pilot moveindriver _Drop_plane;
_pilot assignAsDriver _Drop_plane;

HALV_says_DROPNOW_HALV=false;
HALV_DROPcontrol_HALV2=false;

_wp = _aigroup addWaypoint [[(_pos select 0), (_pos select 1),150], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointStatements ["true", "HALV_says_DROPNOW_HALV=true"];
_wp_pos = waypointPosition [_aigroup,1];

_pilot addWeapon 'NVGoggles';
_pilot addWeapon 'ItemCompass';
_pilot addWeapon 'ItemMap';
_pilot addWeapon 'ItemGPS';

sleep 10;
if (!_hasRC) then {
	_rctxt = (gettext (configFile >> 'cfgWeapons' >> _RCitem >> 'displayName'));
	cutText [format["(If you have a %1 you get advanced drop control and debug info)",_rctxt],"PLAIN DOWN",5];
};

_DROP_Action=0;
_Dohintonce=true;
_SetSpeedOnce=true;
while {(_Drop_plane distance _wp_pos) > 500} do {
	scopeName "loop1";
	if (HALV_says_DROPNOW_HALV || not alive _Drop_plane || not alive _pilot) then {breakOut "loop1";player removeAction The_DropAction2};
	_hasRC = _RCitem in items player;
	if (_hasRC) then {
		if (_DROP_Action==0) then {
			The_DropAction2 = player addAction ["<t color='#FF0000'>Drop supply box...</t>",_thePath+"box_supply3.sqf","",5,true,true,"",""];
			_DROP_Action=1;
			hint "";
//			cutText ["Advanced drop control and debug functions enabled!","PLAIN DOWN",2];
		};
		
		_pic1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'picture'));
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_txt2 = (gettext (configFile >> 'CfgVehicles' >> _randcont >> 'displayName'));
		_txt3 = (gettext (configFile >> 'CfgVehicles' >> _randombox >> 'displayName'));
		_dist = (_Drop_plane distance _wp_pos);
		_GPS = (mapGridPosition getpos _Drop_plane);
		
		hintsilent parseText format ["
		<t size='1'font='Bitstream'align='Center'>Supply box enroute @</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#5882FA'>%1</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#c70000'>Transporter:</t><br/>
		<img size='5' image='%2'/><br/>
		<t size='1.25'font='Bitstream'align='Center'>%3</t><br/>
		<t size='1'font='Bitstream'align='Center'color='#FFCC00'>[%4]</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#c70000'>Boxtype:</t><br/>
		<t size='1.25'font='Bitstream'align='Center'>%5</t><br/>
		<t size='1'font='Bitstream'align='Center'color='#FFCC00'>[%6]</t><br/>
		<t size='1.25'font='Bitstream'align='left'>Distance:</t><t size='1.25'font='Bitstream'align='right'>Speed:</t><br/>
		<t size='1.5'font='Bitstream'align='left'>%7Km</t><t size='1.5'font='Bitstream'align='right'>%8Km/h</t><br/>
		",_GPS,_pic1,_txt1,_TheModel,_txt3,_randombox,(_dist/1000),(round(speed _Drop_plane))
		];
		
	} else {
		if (_DROP_Action==1) then {
			player removeAction The_DropAction2;
			_DROP_Action=0;
			sleep 2;
			hintsilent "";
			cutText ["Advanced drop control disabled!","PLAIN DOWN"];
		};
	};
	
	if (alive _Drop_plane && (_Drop_plane distance _wp_pos) <= 2555 && _Dohintonce ) then {
		_Dohintonce=false;
		hintsilent "";
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		cutText [format["The MV-22 Osprey is now 2KM from the drop site...\nGet ready!",_TheModel,_txt1],"PLAIN DOWN"];
	};
	
	if (alive _Drop_plane && (_Drop_plane distance _wp_pos) <= 1100 && _SetSpeedOnce ) then {
		_SetSpeedOnce=false;
		_Drop_plane forceSpeed 175;
		_Drop_plane flyInHeight 135;
		_Drop_plane setspeedmode "LIMITED";
	};
	sleep 1;
};

waituntil {(((_Drop_plane distance _wp_pos) <= 200)||(not alive _Drop_plane)||(not alive _pilot)||(HALV_says_DROPNOW_HALV))};
while {_ADVDroptimeOut > 0} do {
	scopeName "loop1";
	_hasRC = _RCitem in items player;
	if (HALV_DROPcontrol_HALV2 || not alive _Drop_plane || not alive _pilot) then {breakOut "loop1"};
	if (_hasRC) then {
		_pic1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'picture'));
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_dist = (_Drop_plane distance _wp_pos);
		_GPS = (mapGridPosition getpos _Drop_plane);
		
		hintsilent parseText format ["
		<t size='1'font='Bitstream'align='Center'>Random Drop @</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#5882FA'>%1</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#c70000'>Transporter:</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#FFCC00'>%2</t><br/>
		<t size='1'font='Bitstream'align='Center'>[%3]</t><br/>
		<img size='5' image='%4'/><br/>
		<t size='1.25'font='Bitstream'align='left'>Distance:</t><t size='1.25'font='Bitstream'align='right'>Speed:</t><br/>
		<t size='1.5'font='Bitstream'align='left'>%5m</t><t size='1.5'font='Bitstream'align='right'>%6Km/h</t><br/>
		",_GPS,_txt1,_TheModel,_pic1,(round _dist),(round(speed _Drop_plane))
		];
		
		cutText [format["**Awaiting drop orders**\n(%1 sec to auto drop)",(round _ADVDroptimeOut)], "PLAIN DOWN", 0.1];
		
	} else {breakOut "loop1"};
	sleep 0.1;
	_ADVDroptimeOut=_ADVDroptimeOut-0.1;
};

if (_DROP_Action==1) then {
	player removeAction The_DropAction2;
	_DROP_Action=0;
};

if (HALV_DROPcontrol_HALV2 && (_Drop_plane distance _wp_pos) > 2500) then{
	_dist = (_Drop_plane distance _wp_pos);
	cutText [format["You dropped the box around GPS coordinates: %1\nDistance from waypoint %2Km",(mapGridPosition getpos _Drop_plane),(_dist/1000)],"PLAIN DOWN, 5"];
} else {cutText ["Dropping supply box", "PLAIN DOWN"];};

HALV_says_DROPNOW_HALV=false;
HALV_DROPcontrol_HALV2=false;

sleep 0.25;

switch (true) do {
	case not (alive _Drop_plane): {
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_sMSG3 = format["The MV-22 Osprey was shot down or crashed around\nGPS coordinates: %2",_TheModel,(mapGridPosition getPos _Drop_plane),_txt1]; 
		if (_BCast) then {[nil, nil, rspawn, [_sMSG3], { cutText [_this select 0,"PLAIN DOWN",10];}] call RE;} else {cutText [_sMSG3,"PLAIN DOWN",10];};
		diag_log format["WARNING! The MV-22 Osprey crashed at GPS coordinates: %1, dropping supply box!",(mapGridPosition getPos _Drop_plane),_TheModel]; 
	};
	
	case alive _Drop_plane: {
		sleep 0.75;
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_sMSG3 = format["The MV-22 Osprey has dropped the Supply Box at GPS coordinates: %2!\nThe box will be deleted in 10 minutes!",_TheModel,(mapGridPosition getPos _Drop_plane),_txt1]; 
		if (_BCast) then {[nil, nil, rspawn, [_sMSG3], { cutText [_this select 0,"PLAIN DOWN",10];}] call RE;} else {cutText [_sMSG3,"PLAIN DOWN",10]; };
		_plane_end = _start_pos call BIS_fnc_selectRandom;
		diag_log format["Supply box has been called in at GPS coordinates: %1",mapGridPosition getPos _Drop_plane];
		deleteWaypoint [_aigroup, 1];
		_wp2 = _aigroup addWaypoint [_plane_end, 0];
		_wp2 setWaypointType "MOVE";
		_wp2 setWaypointBehaviour "CARELESS";
		_Drop_plane forceSpeed 350;
		_Drop_plane setspeedmode "FULL";
	};
};

sleep 0.5;

_dropDir = getDir _Drop_plane;
_pos2 = [(getPosATL _Drop_plane select 0)-15*sin(_dropDir), (getPosATL _Drop_plane select 1)-15*cos(_dropDir), (getPosATL _Drop_plane select 2)-10]; //-15m behind plane and -10 hight
_chute = createVehicle ["ParachuteMediumEast", _pos2, [], 0, "FLY"];
_chute setVariable["Sarge",1,true];
_box = createVehicle [_randcont,_pos2,[], 0, "CAN_COLLIDE"];
_box setVariable["Sarge",1,true];
_box attachTo [_chute, [0, 0, 1]];
_smoke1 = createVehicle ["SmokeShell",_pos2,[], 0, "CAN_COLLIDE"];
_smoke1 setVariable["Sarge",1,true];
_smoke1 attachTo [_box,[0, 0, 0]];
_smoke2 = createVehicle ["SmokeShellRed",_pos2,[], 0, "CAN_COLLIDE"];
_smoke2 setVariable["Sarge",1,true];
_smoke2 attachTo [_box,[1, 1, 0]];
_flare1 = createVehicle ["F_40mm_white",[_pos2 select 0, _pos2 select 1, (_pos2 select 2) +100],[], 0, "CAN_COLLIDE"];
_flare1 setVariable["Sarge",1,true];

_pilot removeweapon 'NVGoggles';
_pilot removeweapon 'ItemCompass';
_pilot removeweapon 'ItemMap';
_pilot removeweapon 'ItemGPS';

_i = 0;
while {_i < 45} do {
	scopeName "loop1";
	if (((getPos _box) select 2) < 1) then {breakOut "loop1"};
	sleep 0.1;
	_i=_i+0.1;
};  

switch (true) do {
	case not (alive _box): {
		detach _box;
		_box setpos [(getpos _box select 0), (getpos _box select 1), 0];
	};
	case alive _box: {
		detach _box;
		_box setpos [(getpos _box select 0), (getpos _box select 1), 0];
		_bam = createVehicle [_randombox,[(getpos _box select 0),(getpos _box select 1), 0],[],0,"CAN_COLLIDE"];
		_bam setVariable["Sarge",1,true];
		deletevehicle _box;
		deletevehicle _chute;
		clearMagazineCargoGlobal _bam;
		clearWeaponCargoGlobal _bam;
		{_bam addWeaponCargoGlobal [_x, 1];} forEach _HALVw2List;
		{_bam addmagazineCargoGlobal [_x, 5];} forEach _HALVm20List;
		{_bam addmagazineCargoGlobal [_x, 3];} forEach _HALVm10List;
		{_bam addmagazineCargoGlobal [_x, 2];} forEach _HALVm5List;
		{_bam addmagazineCargoGlobal [_x, 1];} forEach _HALVm2List;
		{_bam addmagazineCargoGlobal [_x, 1];} forEach _HALVm1List;
		_pos3 = [getpos _bam select 0, getpos _bam select 1,0];
		_smoke3 = createVehicle ["SmokeShell",_pos3,[],0,"CAN_COLLIDE"];
		_smoke3 setVariable["Sarge",1,true];
		_smoke4 = createVehicle ["SmokeShellred",_pos3,[],0,"CAN_COLLIDE"];
		_smoke4 setVariable["Sarge",1,true];
		_flare2 = createVehicle ["F_40mm_white",[_pos3 select 0, _pos3 select 1, (_pos3 select 2) +150],[], 0, "CAN_COLLIDE"];
		_flare2 setVariable["Sarge",1,true];
		_txt3 = (gettext (configFile >> 'CfgVehicles' >> _randombox >> 'displayName'));
		diag_log format["Supply box landed at GPS coordinates: %1 smoke signal deployed", _pos3];
		if (_Del_Box) then {
			_Del_BoxTimeout = _Del_BoxTime + 60;
			_GPS = (mapGridPosition _pos3);
			hint parseText format ["
			<t size='1'font='Bitstream'align='Center'>Supply box landed at GPS coordinates:</t><br/>
			<t size='1.25'font='Bitstream'align='Center'color='#00CC00'>%1</t><br/>
			<t size='0.75'font='Bitstream'align='Center'>Box will be deleted in: %2Min</t><br/>
			",_GPS,(round(_Del_BoxTimeout/60))
			];
			sleep 60;
			deletevehicle _Drop_plane;
			deletevehicle _pilot;
			sleep _Del_BoxTime;
			clearWeaponCargoGlobal _bam;
			clearMagazineCargoGlobal _bam;
			clearBackpackCargoGlobal _bam;
			deletevehicle _bam;
			hint "The box is now gone...";
			diag_log format["Supply box deleted at GPS coordinates: %1", _pos3];
		} else {
			_GPS = (mapGridPosition _pos3);
			cutText [format["Supply box landed at GPS coordinates: %1",_GPS],"PLAIN DOWN",5];
			sleep 60;
			deletevehicle _Drop_plane;
			deletevehicle _pilot;
		};
	};
};
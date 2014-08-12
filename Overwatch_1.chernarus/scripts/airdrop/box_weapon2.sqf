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
_txt3 = (gettext (configFile >> 'CfgVehicles' >> _randombox >> 'displayName'));
_sMSG2 = format["An airdrop for a Random Weapons Box has been called by survivor: %1 \nType of transport: MV-22 Osprey, and distance until drop: %5KM\nDrop GPS coordinates at: %4",dayz_playerName,_TheModel,_txt1,mapGridPosition _pos,(round(_dist/1000))];
if (_BCast) then {
	[nil,nil,rspawn,[_sMSG2],{cutText [_this select 0,"PLAIN DOWN",10]; sleep 10;}] call RE;	
} else {cutText [_sMSG2,"PLAIN DOWN",10]; sleep 10;};

diag_log format ["Random weapons box has been called in by survivor: %2 Drop GPS coordinates at: %1 Type of transport: %3",mapGridPosition _pos,dayz_playerName,_TheModel]; 
_Drop_plane = createVehicle [_TheModel, _plane_start, [], 0, "FLY"];
_Drop_plane engineOn true;
_Drop_plane flyInHeight 150;
_Drop_plane forceSpeed 175;

clearMagazineCargoGlobal _Drop_plane;
clearWeaponCargoGlobal _Drop_plane;

_aigroup = creategroup civilian;

_pilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _Drop_plane,[],0,"FORM"];
_pilot moveindriver _Drop_plane;
_pilot assignAsDriver _Drop_plane;
_pilot setVariable["Sarge",1,true];

HALV_says_DROPNOW_random=false;
HALV_DROPcontrol_HALV=false;

_wp = _aigroup addWaypoint [[(_pos select 0), (_pos select 1),150], 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
_wp setWaypointStatements ["true", "HALV_says_DROPNOW_random=true"];
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
	if (HALV_says_DROPNOW_random || not alive _Drop_plane || not alive _pilot) then {breakOut "loop1";player removeAction The_DropAction};
	_hasRC = _RCitem in items player;
	if (_hasRC) then {
		if (_DROP_Action==0) then {
			The_DropAction = player addAction ["<t color='#FF0000'>Drop random weapons box...</t>",_thePath+"box_weapon3.sqf","",5,true,true,"",""];			
			_DROP_Action=1;
			hint "";
//			cutText ["Advanced drop control and debug functions enabled!", "PLAIN DOWN",2];
		};
		
		_pic1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'picture'));
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_txt2 = (gettext (configFile >> 'CfgVehicles' >> _randcont >> 'displayName'));
		_txt3 = (gettext (configFile >> 'CfgVehicles' >> _randombox >> 'displayName'));
		_dist = (_Drop_plane distance _wp_pos);
		_GPS = (mapGridPosition getpos _Drop_plane);
		
		hintsilent parseText format ["
		<t size='1'font='Bitstream'align='Center'>Random weapons drop enroute @</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#5882FA'>***(%1)***</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#c70000'>Transporter:</t><br/>
		<img size='5' image='%4'/><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#FFCC00'>%2</t><br/>
		<t size='1'font='Bitstream'align='Center'>[%3]</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#c70000'>Container:</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#FFCC00'>%5</t><br/>
		<t size='1'font='Bitstream'align='Center'>[%6]</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#c70000'>Final box:</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#FFCC00'>%7</t><br/>
		<t size='1'font='Bitstream'align='Center'>[%8]</t><br/>
		<t size='1.25'font='Bitstream'align='left'>Distance:</t><t size='1.25'font='Bitstream'align='right'>Speed:</t><br/>
		<t size='1.5'font='Bitstream'align='left'>%9Km</t><t size='1.5'font='Bitstream'align='right'>%10Km/h</t><br/>
		",_GPS,_txt1,_TheModel,_pic1,_txt2,_randcont,_txt3,_randombox,(_dist/1000),(round(speed _Drop_plane))
		];
		
	}else{
		if (_DROP_Action==1) then {
			player removeAction The_DropAction;
			_DROP_Action=0;
			sleep 2;
			hintsilent "";
			cutText ["Advanced drop control disabled!", "PLAIN DOWN"];
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

waituntil {(_Drop_plane distance _wp_pos) <= 200 || not alive _Drop_plane || not alive _pilot || HALV_says_DROPNOW_random};
while {_ADVDroptimeOut > 0} do {
	scopeName "loop1";
	_hasRC = _RCitem in items player;
	if (HALV_DROPcontrol_HALV || not alive _Drop_plane || not alive _pilot) then {breakOut "loop1"};
	if (_hasRC) then {
		_pic1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'picture'));
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_dist = (_Drop_plane distance _wp_pos);
		_GPS = (mapGridPosition getpos _Drop_plane);
		
		hintsilent parseText format ["
		<t size='1'font='Bitstream'align='Center'>Random Drop @</t><br/>
		<t size='1.25'font='Bitstream'align='Center'color='#5882FA'>***(%1)***</t><br/>
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
	player removeAction The_DropAction;
	_DROP_Action=0;
};

if (HALV_DROPcontrol_HALV && (_Drop_plane distance _wp_pos) > 2500) then{
	_dist = (_Drop_plane distance _wp_pos);
	cutText [format["You dropped the box around GPS coordinates: %1\nDistance from waypoint %2Km",(mapGridPosition getpos _Drop_plane),(_dist/1000)],"PLAIN DOWN",5];
} else {cutText ["Dropping random weapons box", "PLAIN DOWN"];};
HALV_says_DROPNOW_random=false;
HALV_DROPcontrol_HALV=false;

sleep 0.25;

switch (true) do {
	case not (alive _Drop_plane): {
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_sMSG3 = format["The MV-22 Osprey was shot down or crashed around\nGPS coordinates: %1",(mapGridPosition getPos _Drop_plane),_txt1]; 
		if (_BCast) then {[nil, nil, rspawn, [_sMSG3], { cutText [_this select 0,"PLAIN DOWN",10];}] call RE;} else {cutText [_sMSG3,"PLAIN DOWN",10];};
		diag_log format["WARNING! The MV-22 Osprey crashed at GPS coordinates: %1, dropping random weapons box",mapGridPosition getPos _Drop_plane,_TheModel]; 
	};
	case alive _Drop_plane: {
		sleep 0.75;
		_txt1 = (gettext (configFile >> 'CfgVehicles' >> _TheModel >> 'displayName'));
		_sMSG3 = format["The MV-22 Osprey has dropped the random weapons box at GPS coordinates: %2",_TheModel,(mapGridPosition getPos _Drop_plane),_txt1]; 
		if (_BCast) then {[nil, nil, rspawn, [_sMSG3], { cutText [_this select 0,"PLAIN DOWN",10];}] call RE;} else {cutText [_sMSG3,"PLAIN DOWN",10]; };
		_plane_end = _start_pos call BIS_fnc_selectRandom;
		diag_log format["Random weapons box has been called in at GPS coordinates: %1",mapGridPosition getPos _Drop_plane];
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
	scopeName "loop2";
	if (((getPos _box) select 2) < 1) then {breakOut "loop2"};
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
		
////////////// Weapons start //////////////////

		clearWeaponCargoGlobal _bam;
		clearMagazineCargoGlobal _bam;
		clearBackpackCargoGlobal _bam;

		_allWeapons = ["RH_deagle","RH_Deagleg","RH_Deagles","RH_Deaglem","RH_Deaglemz","RH_Deaglemzb","RH_anac","RH_anacg","RH_bull","RH_python","RH_browninghp","RH_p226",
						"RH_p226s","RH_p38","RH_ppk","RH_mk22","RH_mk22sd","RH_mk22v","RH_mk22vsd","RH_usp","RH_uspsd","RH_uspm","RH_m1911","RH_m1911sd","RH_m1911old","RH_tt33",
						"RH_mk2","RH_m93r","RH_m9","RH_m9sd","RH_m9c","RH_m9csd","RH_g18","RH_g17","RH_g17sd","RH_g19","RH_g19t","RH_vz61","RH_tec9","vil_B_HP","vil_Glock",
						"vil_Glock_o","vil_USP","vil_USPSD","vil_USP45","vil_USP45SD","vil_MP5_EOTech","vil_MP5SD_EOTech","vil_uzi_c","vil_uzi","vil_uzi_SD","vil_uzimini",
						"vil_uzimini_SD","RH_hk416","RH_hk416s","RH_hk416saim","RH_hk416seotech","RH_hk416sacog","RH_hk416sd","RH_hk416sdaim","RH_hk416sdeotech","RH_hk416aim",
						"RH_hk416eotech","RH_hk416acog","RH_hk416gl","RH_hk416glaim","RH_hk416gleotech","RH_hk416glacog","RH_hk416sgl","RH_hk416sglaim","RH_hk416sgleotech",
						"RH_hk416sglacog","RH_hk416sdgl","RH_hk416sdglaim","RH_hk416sdgleotech","RH_hk417","RH_hk417aim","RH_hk417eotech","RH_hk417acog","RH_hk417sp","RH_hk417s",
						"RH_hk417saim","RH_hk417seotech","RH_hk417sacog","RH_hk417sd","RH_hk417sdaim","RH_hk417sdeotech","RH_hk417sdacog","RH_hk417sdsp","RH_hk417sgl","RH_hk417sglaim",
						"RH_hk417sgleotech","RH_hk417sglacog","RH_ctar21","RH_ctar21glacog","RH_ctar21m","RH_ctar21mgl","RH_star21","RH_mas","RH_masaim","RH_maseotech","RH_masacog",
						"RH_massd","RH_massdaim","RH_massdeotech","RH_massdacog","RH_masb","RH_masbaim","RH_masbeotech","RH_masbacog","RH_masbsd","RH_masbsdaim","RH_masbsdeotech",
						"RH_masbsdacog","RH_m14","RH_m14acog","RH_m14aim","RH_m14eot","RH_m21","RH_sc2","RH_sc2acog","RH_sc2aim","RH_sc2eot","RH_sc2shd","RH_sc2sp","RH_m1s","RH_m1sacog",
						"RH_m1saim","RH_m1seot","RH_m1sshd","RH_m1ssp","RH_m1st","RH_m1stacog","RH_m1staim","RH_m1steot","RH_m1stshd","RH_m1stsp","vil_SR25","vil_M110","vil_HK417s",
						"vil_SR25SD","vil_M110sd","vil_M21G","vil_M14G","SCAR_L_CQC","SCAR_L_CQC_Holo","SCAR_L_STD_Mk4CQT","SCAR_L_STD_EGLM_RCO","SCAR_L_CQC_EGLM_Holo","SCAR_L_STD_HOLO",
						"SCAR_L_CQC_CCO_SD","SCAR_H_CQC_CCO","SCAR_H_CQC_CCO_SD","SCAR_H_STD_EGLM_Spect","SCAR_H_LNG_Sniper","SCAR_H_LNG_Sniper_SD","FHQ_ACR_WDL_IRN","FHQ_ACR_WDL_IRN_F",
						"FHQ_ACR_WDL_IRN_GL","FHQ_ACR_WDL_IRN_GL_F","FHQ_ACR_WDL_CCO","FHQ_ACR_WDL_CCO_F","FHQ_ACR_WDL_CCO_GL","FHQ_ACR_WDL_CCO_GL_F","FHQ_ACR_WDL_RCO","FHQ_ACR_WDL_RCO_F",
						"FHQ_ACR_WDL_RCO_GL","FHQ_ACR_WDL_RCO_GL_F","FHQ_ACR_WDL_HWS","FHQ_ACR_WDL_HWS_F","FHQ_ACR_WDL_HWS_GL","FHQ_ACR_WDL_HWS_GL_F","FHQ_ACR_WDL_G33","FHQ_ACR_WDL_G33_F",
						"FHQ_ACR_WDL_G33_GL","FHQ_ACR_WDL_G33_GL_F","FHQ_ACR_WDL_HAMR","FHQ_ACR_WDL_HAMR_F","FHQ_ACR_WDL_HAMR_GL","FHQ_ACR_WDL_HAMR_GL_F","FHQ_ACR_BLK_IRN","FHQ_ACR_BLK_IRN_F",
						"FHQ_ACR_BLK_IRN_GL","FHQ_ACR_BLK_IRN_GL_F","FHQ_ACR_BLK_CCO","FHQ_ACR_BLK_CCO_F","FHQ_ACR_BLK_CCO_GL","FHQ_ACR_BLK_CCO_GL_F","FHQ_ACR_BLK_RCO","FHQ_ACR_BLK_RCO_F",
						"FHQ_ACR_BLK_RCO_GL","FHQ_ACR_BLK_RCO_GL_F","FHQ_ACR_BLK_HWS","FHQ_ACR_BLK_HWS_F","FHQ_ACR_BLK_HWS_GL","FHQ_ACR_BLK_HWS_GL_F","FHQ_ACR_BLK_G33","FHQ_ACR_BLK_G33_F",
						"FHQ_ACR_BLK_G33_GL","FHQ_ACR_BLK_G33_GL_F","FHQ_ACR_BLK_HAMR","FHQ_ACR_BLK_HAMR_F","FHQ_ACR_BLK_HAMR_GL","FHQ_ACR_BLK_HAMR_GL_F","FHQ_ACR_TAN_IRN","FHQ_ACR_TAN_IRN_F",
						"FHQ_ACR_TAN_IRN_GL","FHQ_ACR_TAN_IRN_GL_F","FHQ_ACR_TAN_CCO","FHQ_ACR_TAN_CCO_F","FHQ_ACR_TAN_CCO_GL","FHQ_ACR_TAN_CCO_GL_F","FHQ_ACR_TAN_RCO","FHQ_ACR_TAN_RCO_F",
						"FHQ_ACR_TAN_RCO_GL","FHQ_ACR_TAN_RCO_GL_F","FHQ_ACR_TAN_HWS","FHQ_ACR_TAN_HWS_F","FHQ_ACR_TAN_HWS_GL","FHQ_ACR_TAN_HWS_GL_F","FHQ_ACR_TAN_G33","FHQ_ACR_TAN_G33_F",
						"FHQ_ACR_TAN_G33_GL","FHQ_ACR_TAN_G33_GL_F","FHQ_ACR_TAN_HAMR","FHQ_ACR_TAN_HAMR_F","FHQ_ACR_TAN_HAMR_GL","FHQ_ACR_TAN_HAMR_GL_F","FHQ_ACR_SNW_IRN","FHQ_ACR_SNW_IRN_F",
						"FHQ_ACR_SNW_IRN_GL","FHQ_ACR_SNW_IRN_GL_F","FHQ_ACR_SNW_CCO","FHQ_ACR_SNW_CCO_F","FHQ_ACR_SNW_CCO_GL","FHQ_ACR_SNW_CCO_GL_F","FHQ_ACR_SNW_RCO","FHQ_ACR_SNW_RCO_F",
						"FHQ_ACR_SNW_RCO_GL","FHQ_ACR_SNW_RCO_GL_F","FHQ_ACR_SNW_HWS","FHQ_ACR_SNW_HWS_F","FHQ_ACR_SNW_HWS_GL","FHQ_ACR_SNW_HWS_GL_F","FHQ_ACR_SNW_G33","FHQ_ACR_SNW_G33_F",
						"FHQ_ACR_SNW_G33_GL","FHQ_ACR_SNW_G33_GL_F","FHQ_ACR_SNW_HAMR","FHQ_ACR_SNW_HAMR_F","FHQ_ACR_SNW_HAMR_GL","FHQ_ACR_SNW_HAMR_GL_F","FHQ_ACR_WDL_IRN_SD","FHQ_ACR_WDL_IRN_SD_F",
						"FHQ_ACR_WDL_IRN_GL_SD","FHQ_ACR_WDL_IRN_GL_SD_F","FHQ_ACR_WDL_CCO_SD","FHQ_ACR_WDL_CCO_SD_F","FHQ_ACR_WDL_CCO_GL_SD","FHQ_ACR_WDL_CCO_GL_SD_F","FHQ_ACR_WDL_RCO_SD",
						"FHQ_ACR_WDL_RCO_SD_F","FHQ_ACR_WDL_RCO_GL_SD","FHQ_ACR_WDL_RCO_GL_SD_F","FHQ_ACR_WDL_HWS_SD","FHQ_ACR_WDL_HWS_SD_F","FHQ_ACR_WDL_HWS_GL_SD","FHQ_ACR_WDL_HWS_GL_SD_F",
						"FHQ_ACR_WDL_G33_SD","FHQ_ACR_WDL_G33_SD_F","FHQ_ACR_WDL_G33_GL_SD","FHQ_ACR_WDL_G33_GL_SD_F","FHQ_ACR_WDL_HAMR_SD","FHQ_ACR_WDL_HAMR_SD_F","FHQ_ACR_WDL_HAMR_GL_SD",
						"FHQ_ACR_WDL_HAMR_GL_SD_F","FHQ_ACR_BLK_IRN_SD","FHQ_ACR_BLK_IRN_SD_F","FHQ_ACR_BLK_IRN_GL_SD","FHQ_ACR_BLK_IRN_GL_SD_F","FHQ_ACR_BLK_CCO_SD","FHQ_ACR_BLK_CCO_SD_F",
						"FHQ_ACR_BLK_CCO_GL_SD","FHQ_ACR_BLK_CCO_GL_SD_F","FHQ_ACR_BLK_RCO_SD","FHQ_ACR_BLK_RCO_SD_F","FHQ_ACR_BLK_RCO_GL_SD","FHQ_ACR_BLK_RCO_GL_SD_F","FHQ_ACR_BLK_HWS_SD",
						"FHQ_ACR_BLK_HWS_SD_F","FHQ_ACR_BLK_HWS_GL_SD","FHQ_ACR_BLK_HWS_GL_SD_F","FHQ_ACR_BLK_G33_SD","FHQ_ACR_BLK_G33_SD_F","FHQ_ACR_BLK_G33_GL_SD","FHQ_ACR_BLK_G33_GL_SD_F",
						"FHQ_ACR_BLK_HAMR_SD","FHQ_ACR_BLK_HAMR_SD_F","FHQ_ACR_BLK_HAMR_GL_SD","FHQ_ACR_BLK_HAMR_GL_SD_F","FHQ_ACR_TAN_IRN_SD","FHQ_ACR_TAN_IRN_SD_F","FHQ_ACR_TAN_IRN_GL_SD",
						"FHQ_ACR_TAN_IRN_GL_SD_F","FHQ_ACR_TAN_CCO_SD","FHQ_ACR_TAN_CCO_SD_F","FHQ_ACR_TAN_CCO_GL_SD","FHQ_ACR_TAN_CCO_GL_SD_F","FHQ_ACR_TAN_RCO_SD","FHQ_ACR_TAN_RCO_SD_F",
						"FHQ_ACR_TAN_RCO_GL_SD","FHQ_ACR_TAN_RCO_GL_SD_F","FHQ_ACR_TAN_HWS_SD","FHQ_ACR_TAN_HWS_SD_F","FHQ_ACR_TAN_HWS_GL_SD","FHQ_ACR_TAN_HWS_GL_SD_F","FHQ_ACR_TAN_G33_SD",
						"FHQ_ACR_TAN_G33_SD_F","FHQ_ACR_TAN_G33_GL_SD","FHQ_ACR_TAN_G33_GL_SD_F","FHQ_ACR_TAN_HAMR_SD","FHQ_ACR_TAN_HAMR_SD_F","FHQ_ACR_TAN_HAMR_GL_SD","FHQ_ACR_TAN_HAMR_GL_SD_F",
						"FHQ_ACR_SNW_IRN_SD","FHQ_ACR_SNW_IRN_SD_F","FHQ_ACR_SNW_IRN_GL_SD","FHQ_ACR_SNW_IRN_GL_SD_F","FHQ_ACR_SNW_CCO_SD","FHQ_ACR_SNW_CCO_SD_F","FHQ_ACR_SNW_CCO_GL_SD",
						"FHQ_ACR_SNW_CCO_GL_SD_F","FHQ_ACR_SNW_RCO_SD","FHQ_ACR_SNW_RCO_SD_F","FHQ_ACR_SNW_RCO_GL_SD","FHQ_ACR_SNW_RCO_GL_SD_F","FHQ_ACR_SNW_HWS_SD","FHQ_ACR_SNW_HWS_SD_F",
						"FHQ_ACR_SNW_HWS_GL_SD","FHQ_ACR_SNW_HWS_GL_SD_F","FHQ_ACR_SNW_G33_SD","FHQ_ACR_SNW_G33_SD_F","FHQ_ACR_SNW_G33_GL_SD","FHQ_ACR_SNW_G33_GL_SD_F","FHQ_ACR_SNW_HAMR_SD",
						"FHQ_ACR_SNW_HAMR_SD_F","FHQ_ACR_SNW_HAMR_GL_SD","FHQ_ACR_SNW_HAMR_GL_SD_F","FHQ_MSR_DESERT","FHQ_MSR_SD_DESERT","FHQ_MSR_NV_DESERT","FHQ_MSR_NV_SD_DESERT","FHQ_RSASS_TAN",
						"FHQ_RSASS_SD_TAN","FHQ_XM2010_DESERT","FHQ_XM2010_SD_DESERT","FHQ_XM2010_NV_DESERT","FHQ_XM2010_NV_SD_DESERT","vil_SVD_63","vil_SVD_N","vil_SVD_S","vil_SVD_M","vil_SVD_P21",
						"vil_SVDK","vil_SV_98","vil_SV_98_69","vil_SV_98_SD","gms_k98","gms_k98_rg","gms_k98_knife","gms_k98zf39","vil_G3a3","vil_G3a2","vil_G3a4","vil_G3a4b","vil_G3an","vil_G3anb",
						"vil_G3ZF","vil_G3zfb","vil_G3SG1","vil_G3sg1b","vil_G3TGS","vil_G3TGSb","vil_AG3","vil_AG3EOT","vil_PKP","vil_PKP_EOT","vil_PKP_N","vil_PK","vil_zastava_m84","vil_PKM",
						"vil_RPK","vil_RPK75","vil_RPK75_Romania","vil_RPK75_M72","vil_RPD","vil_RPK74","vil_RPK74M_P29","vil_RPK74M","skavil_M60","skavil_M60e3","vil_Mg3","vil_M249_Para","vil_Minimi",
						"vil_FnMag","vil_M240_B","vil_MG4","vil_MG4E","vil_VAL","vil_VAL_C","vil_Vikhr","vil_9a91","vil_9a91_c","vil_9a91_csd","vil_vsk94","vil_Groza_HG","vil_Groza_SC","vil_Groza_GL",
						"vil_Groza_SD","vil_AKS_47","vil_AK_47_49","vil_AK_47","vil_AKMSB","vil_AKM","vil_AKM_GL","vil_AKMS","vil_AKMS_GP25","vil_AK_47_m1","vil_AK_nato_m1","vil_M70","vil_M70B",
						"vil_M64","vil_ASH82","vil_AMD","vil_AMD63","vil_PMI","vil_PMIS","vil_MPi","vil_AK_nato_m80","vil_AKs_74_u","vil_AKs_74_u45","Vil_AKS_74_UN_kobra","Vil_AKS_74_UB","vil_AK_74",
						"vil_AK_74_gp","vil_AK_74_N","vil_AKS_74","vil_AKS_74_gp","vil_AKS_74p","vil_AKS_74p_45","vil_AK_74P","vil_AKS_74p_gp","vil_AK_74m","vil_AK_74M_PSO","vil_AK_74m_k",
						"vil_AK_74m_EOT","vil_AK_74m_EOT_Alfa","vil_AK_74m_EOT_FSB","vil_AK_74m_EOT_FSB_45","vil_AK_74m_EOT_FSB_60","vil_AK_74m_c","vil_AK_74m_p29","vil_AK_74m_gp_29","vil_AK_74m_gp",
						"vil_PMI74S","vil_AK_101","vil_AK_103","vil_AK_105","Vil_AK_105_c","vil_AK_107","Vil_AK_107_c","vil_Abakan","vil_Abakan_gp","vil_Abakan_P29","vil_ak12","vil_ak12_ap",
						"vil_ak12_gp","vil_AEK1","vil_AEK2","vil_AEK_GL","vil_AeK_3","vil_AeK_23","vil_AeK_3_K","vil_G36KVA4","vil_G36KA4","vil_G36E","vil_G36a2","vil_AG36","vil_AG36A2","vil_AG36KV",
						"vil_AG36KA4","vil_G36VA4","vil_G36VA4Eot","vil_G36KVZ","vil_G36KSK","vil_G36KSKdes","vil_G36KSKdesES","vil_G36CC","vil_G36KSKES","vil_G36KES","vil_G36KV3","vil_G36KV3Des",
						"vil_SKS","vil_Galil","vil_Galil_arm"];
		
		// Random 3 weapons, 1 of each with 4 magazines each
		for "_x" from 0 to 2 do {
		_weapon = _allWeapons call BIS_fnc_selectRandom;
		if (_weapon !="") then
		{
			_magazine = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
			_bam addWeaponCargoGlobal [_weapon, 1];			
			_bam addMagazineCargoGlobal [_magazine, 4];
		};
	};
		
////////////// Weapons end //////////////////

		_pos3 = [getpos _bam select 0, getpos _bam select 1,0];
		_smoke3 = createVehicle ["SmokeShell",_pos3,[],0,"CAN_COLLIDE"];
		_smoke3 setVariable["Sarge",1,true];
		_smoke4 = createVehicle ["SmokeShellred",_pos3,[],0,"CAN_COLLIDE"];
		_smoke4 setVariable["Sarge",1,true];
		_flare2 = createVehicle ["F_40mm_white",[_pos3 select 0, _pos3 select 1, (_pos3 select 2) +150],[], 0, "CAN_COLLIDE"];
		_flare2 setVariable["Sarge",1,true];
		_txt3 = (gettext (configFile >> 'CfgVehicles' >> _randombox >> 'displayName'));
diag_log format["Random weapons box landed at GPS coordinates: %1, smoke signal deployed!", _pos3];
		if (_Del_Box) then {
			_Del_BoxTimeout = _Del_BoxTime + 60;
			_GPS = (mapGridPosition _pos3);
			
			hint parseText format ["
			<t size='1'font='Bitstream'align='Center'>Random weapons box landed at GPS coordinates:</t><br/>
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
			hint "The box is now gone ...";
diag_log format["Random weapons box deleted at GPS coordinates: %1", _pos3];
		} else {
			_GPS = (mapGridPosition _pos3);
			cutText [format["Random weapons box landed at GPS coordinates: %1",_GPS],"PLAIN DOWN",5];
			sleep 60;
			deletevehicle _Drop_plane;
			deletevehicle _pilot;
		};
	};
};
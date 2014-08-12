/*	dayz_spaceInterrupt = {
    private ["_dikCode", "_handled"];
    _dikCode = _this select 1;
    _handled = false;

    if (_dikCode == 0x42) then {
        if (debugMonitor) then {
           debugMonitor= false;
            hintSilent "";
        } else {[] spawn fnc_debug;};
    };
    _handled
};
*/	
	if (isNil "Dayz_survived") then {dayz_survived=0;};
	fnc_debug = {
    debugMonitor = true;
    while {debugMonitor} do
    {
	_kills =        player getVariable["zombieKills",0];
    _killsH =        player getVariable["humanKills",0];
    _killsB =        player getVariable["banditKills",0];
    _humanity =        player getVariable["humanity",0];
    _myfps = 			   round(diag_fps);
	_survivaltime =			dayz_survived;
	_myUptime = round(180-(serverTime/60));
	_serverUptime = round(180-(serverTime/60));
	_serverUptimeUnits = "Minutes";
//####----####----BB 1.3 Flag Count----####----####
	_flagCount = 0;
	_allFlags = nearestObjects [player, [BBTypeOfFlag], 25000];
	{
		if (typeOf(_x) == BBTypeOfFlag) then {
			_authorizedUID = _x getVariable ["AuthorizedUID", []];
			_authorizedPUID = if (count _authorizedUID > 0) then {_authorizedUID select 1;};
			if ((getPlayerUID player) in _authorizedPUID) then {
				_flagCount = _flagCount + 1;
			};
		};
	} foreach _allFlags;
//####----####----BB 1.3 Flag Count----####----####	
	if (_myUptime >= 60) then {
		_serverUptimeTemp = round(((180-(serverTime/60))/60)*10);
		_serverUptime = _serverUptimeTemp/10;
		_serverUptimeUnits = "Hours";
	} else {
		_serverUptime = round(180-(serverTime/60));
		_serverUptimeUnits = "Minutes";	
	};
    hintSilent parseText format ["
	<t size='1.00' font='Bitstream' align='center' color='#FFFFFF'>SERE DayZ Overwatch</t><br/>
	<t size='1.00' font='Bitstream' align='center' color='#D60000'>sere-dayz.enjin.com</t><br/>
	<t size='1.00' font='Bitstream' align='center' color='#5882FA'>Survived %7 Days</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Players Online: </t><t size='0.95'font='Bitstream' align='right'>%10</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00' >Base Flags (Owned/Max):</t><t size='0.95'font='Bitstream' align='right'>%11/%12</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Blood: </t><t size='0.95' font='Bitstream' align='right'>%1</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Humanity: </t><t size='0.95' font='Bitstream' align='right'>%2</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='0.95' font='Bitstream' align='right'>%3</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='0.95' font='Bitstream' align='right'>%4</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>Zombies Killed: </t><t size='0.95' font='Bitstream' align='right'>%5</t><br/>
	<t size='0.95' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='0.95' font='Bitstream' align='right'>%6</t><br/>
	<t size='1.00' font='Bitstream' align='left' color='#5882FA'>F8/Debug</t><t size='1.00' font='Bitstream' align='right' color='#5882FA'>%8 %9/Restart</t>
    ",r_player_blood,round(_humanity),_killsH,_killsB,_kills,_myfps,_survivaltime,_serverUptime,_serverUptimeUnits,(count playableUnits),_flagCount,BBMaxPlayerFlags];
	sleep 1;
    };
};
 
[] spawn fnc_debug;
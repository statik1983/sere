// ===============================================================
//		DayZ Server Credits by IT07 (CUSTOM for server menu)
// ===============================================================

//CONFIG
_onScreenTime = 4; 		//how long one role should stay on screen. Use value from 0 to 10 where 0 is almost instant transition to next role 
//HTML Color Codes Examples:	
//	#FFFFFF (white)
//	#000000 (black)	No idea why you would want black but whatever
//	#C80000 (red)
//	#009FCF (light-blue)
//	#31C300 (Razer Green)			
//	#FF8501 (orange)

_role1 = "Server Name";
_role1names = ["SERE DayZ Overwatch"];
_role2 = "Server Admin";
_role2names = ["|SERE|Admin"];
_role3 = "Server Moderators";
_role3names = ["|SERE| IanKiller99, |SERE| Kitsune"];
_role4 = "Server Security<br />by";
_role4names = ["Arma-Antihack.net"];
_role5 = "Server Host";
_role5names = ["Dedicated 8 core/32GB RAM Co-Located Server in the Netherlands"];
_role6 = "Server Website";
_role6names = ["SERE-DAYZ.ENJIN.COM"];
_role7 = "Server Cost";
_role7names = ["$100 a month"];
_role8 = "Contact";
_role8names = ["Message Admin on website"];
_role9 = "Special Thanks<br />and Credits";
_role9names = ["Dean 'Rocket' Hall", "Opendayz.net", "DayZ Commander", "Dami"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.40' color='#f2cb0b' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],	//DEFAULT: 0.5,0.35
		[safezoneY + safezoneH - 0.8,0.7], 	//DEFAULT: 0.8,0.7
		_onScreenTime,
		0.5
	] spawn AH_fnc_dynamictext;
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names],
	[_role9, _role9names]
];
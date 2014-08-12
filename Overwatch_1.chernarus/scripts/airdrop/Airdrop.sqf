private ["_timeLeft","_dropcountdown","_i","_dropCooldown","_droptimer","_Is_Admin","_EXECscrt","_Has_Kit1","_Has_Kit2","_Has_Tools1","_Has_Tools2","_thePath","_InCombMode","_kitItem","_timeout","_inCombat","_txt1","_txt2"];
#include "Settings.sqf";
_EXECscrt = 'player execVM "'+_thePath+'%1"';
// time to wait for laptop to be ready for air drop, 120 seconds = 2 minutes
_dropcountdown = 120;
_droptimer = time - sleepTimer;

// required item to have to fix laptop, _kitItem is equip_scrapelectronics, _kitItem2 is equip_floppywire
_Has_Kit1 = _kitItem1 in magazines player;
_Has_Kit2 = _kitItem2 in magazines player;
_Has_Tools1 = "ItemToolbox" in items player;
_Has_Tools2 = "ItemGPS" in items player;

_timeout = player getVariable["combattimeout", 0];
_inCombat = if (_timeout >= diag_tickTime) then { true } else { false };
if(_droptimer < _dropCooldown) exitWith {
	cutText [format["Airdrop planes are busy for another %1sec ...",(_droptimer - _dropCooldown)], "PLAIN DOWN"];
};
if ((_InCombMode==1) && (dayz_combat == 1)) exitWith {//Old Combat check
	titleText [format["You can't call airdrops while in combat ..."], "PLAIN DOWN"];
};
if ((_InCombMode==2) && _inCombat) exitWith {//new Combat check
	titleText [format["You can't call airdrops while in combat ..."], "PLAIN DOWN"];
};
if(_Has_Kit1 and _Has_Kit2 and _Has_Tools1 and _Has_Tools2) then {
	player removeMagazine _kitItem1;
	player removeMagazine _kitItem2;
	player playActionNow "Medic"; //play animation
	[player,"repair",0,false,10] call dayz_zombieSpeak;
	sleep 1;
	_timeLeft = _dropcountdown;
	for "_i" from 0 to _dropcountdown do {
		sleep 1;
		_timeLeft = _timeLeft - 1;
		if (_timeLeft > 0) then {
			cutText [format["**** Waiting for Laptop to boot up %1 seconds left ****",_timeLeft], "PLAIN DOWN"]; // Display countdown while waiting
		} else {
			cutText [format["*** Airdrop program Loaded and Ready! ***"], "PLAIN DOWN"];
		};
		if (_timeLeft == 45) then {
			cutText [format["** Checking RAM **"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.5;
			playsound "beep";
			sleep 4;
			cutText [format["*** Checking HDD ***"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.5;
			playsound "beep";
			sleep 4;
			cutText [format["**** Checking OS ****"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.5;
			playsound "beep";
		};
		if (_timeLeft == 30) then {
			cutText [format["*** ERROR *** WINDOWS/OS FAILURE *** ERROR ***"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.25;
			playsound "beep";
			sleep 2;
			playsound "beep";
			sleep 0.25;
			playsound "beep";
			sleep 2;
			playsound "beep";
			sleep 0.25;
			playsound "beep";
			sleep 2;
			cutText [format["*** Rebooting system NOW ***"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.25;
			playsound "beep";
			sleep 2;
			playsound "beep";
			sleep 0.25;
			playsound "beep";
		};
		if (_timeLeft == 15) then {
			cutText [format["** Checking RAM **"], "PLAIN DOWN"]; // Display text
			playsound "beep";
			sleep 0.5;
			playsound "beep";
			sleep 3;
			cutText [format["*** Checking HDD ***"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.5;
			playsound "beep";
			sleep 2;
			cutText [format["**** Checking OS ****"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.5;
			playsound "beep";
		};
		if (_timeLeft == 5) then {
			cutText [format["***** Loading WINDOWS/OS *****"], "PLAIN DOWN"];
			playsound "beep";
			sleep 0.5;
			playsound "beep";
			sleep 3;
			playsound "beep";
			sleep 0.5;
			playsound "beep";
		};
	};
	if (_timeLeft == 0 || _timeLeft < 0) then { // If drop countdown is done then.....
		playsound "beep";
		sleep 0.4;
		playsound "beep";
		sleep 1.2;
		playsound "beep";
		sleep 0.4;
		playsound "beep";
		cutText [format["****** Choose Airdrop Type: ******"], "PLAIN"];
		if ((getPlayerUID player) in _Is_Admin) then { 
			Airdrop =
			[
				["",true],
				["Air Drop Menu", [-1], "", -5, [["expression", ""]], "1", "0"],
				["       Choose Airdrop:", [-1], "", -5, [["expression", ""]], "1", "0"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Airdrop - Supply Box ***", [3],  "", -5, [["expression", format[_EXECscrt,"box_supply1.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Airdrop - Random Weapons Box ***", [4],  "", -5, [["expression", format[_EXECscrt,"box_weapon1.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Airdrop - Donator Building Supplies ***", [4],  "", -5, [["expression", format[_EXECscrt,"box_building1.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],				
//				["*** Airdrop - Random Vehicle ***", [5],  "", -5, [["expression", format[_EXECscrt,"box_vehicle1.sqf"]]], "1", "1"],
//				["", [-1], "", -5, [["expression", ""]], "1", "0"],
//				["*** Call Artillery Strike ***", [6],  "", -5, [["expression", format[_EXECscrt,"artillery_strike1.sqf"]]], "1", "1"],
//				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Abort Program ***", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			showCommandingMenu "#USER:Airdrop";
			sleepTimer = time;
		} else {
			Airdrop =
			[
				["",true],
				["Air Drop Menu", [-1], "", -5, [["expression", ""]], "1", "0"],
				["       Choose Airdrop:", [-1], "", -5, [["expression", ""]], "1", "0"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Airdrop - Supply Box ***", [2],  "", -5, [["expression", format[_EXECscrt,"box_supply1.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Airdrop - Random Weapons Box ***", [3],  "", -5, [["expression", format[_EXECscrt,"box_weapon1.sqf"]]], "1", "1"],
//				["", [-1], "", -5, [["expression", ""]], "1", "0"],
//				["*** Airdrop - Random Vehicle ***", [4],  "", -5, [["expression", format[_EXECscrt,"box_vehicle1.sqf"]]], "1", "1"],
//				["", [-1], "", -5, [["expression", ""]], "1", "0"],
//				["*** Artillery Strike ***", [5],  "", -5, [["expression", format[_EXECscrt,"artillery_strike1.sqf"]]], "1", "1"],
				["", [-1], "", -5, [["expression", ""]], "1", "0"],
				["*** Abort Program ***", [13], "", -3, [["expression", ""]], "1", "1"]
			];
			showCommandingMenu "#USER:Airdrop";
			sleepTimer = time;
		};
	};
} else {
	_txt1 = (gettext (configFile >> 'cfgmagazines' >> _kitItem1 >> 'displayName'));
	_txt2 = (gettext (configFile >> 'cfgmagazines' >> _kitItem2 >> 'displayName'));
	cutText [format["You need a Toolbox, GPS, %1, and %2 to fix the laptop for airdrops!",_txt1,_txt2], "PLAIN DOWN",5];
};

if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	TOWING_objMoveAttempt = objNull;
	sleep 2;
	TOWING_local_lock = false;
};
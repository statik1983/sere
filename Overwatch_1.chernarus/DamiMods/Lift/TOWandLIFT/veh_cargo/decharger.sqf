if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	#include "dlg_constantes.h"
	private ["_transporteur", "_objects_charges", "_type_object_a_decharger", "_object_a_decharger", "_i"];
	_transporteur = uiNamespace getVariable "Tow_settings_dlg_CV_transporteur";
	_objects_charges = _transporteur getVariable "Tow_settings_objects_charges";
	_type_object_a_decharger = lbData [Tow_settings_IDC_dlg_CV_liste_contents, lbCurSel Tow_settings_IDC_dlg_CV_liste_contents];
	closeDialog 0;
	_object_a_decharger = objNull;
	for [{_i = 0}, {_i < count _objects_charges}, {_i = _i + 1}] do {
		if (typeOf (_objects_charges select _i) == _type_object_a_decharger) exitWith {_object_a_decharger = _objects_charges select _i;};
	};
	
	if !(isNull _object_a_decharger) then {
		_objects_charges = _objects_charges - [_object_a_decharger];
		_transporteur setVariable ["Tow_settings_objects_charges", _objects_charges, true];
		detach _object_a_decharger;
		if ({_object_a_decharger isKindOf _x} count TOWING_playerLiftableObjects > 0) then
		{
			[_object_a_decharger] execVM "DamiMods\Lift\TOWandLIFT\veh_lifting\move.sqf";
		} else {
			private ["_dimension_max"];
			_dimension_max = (((boundingBox _object_a_decharger select 1 select 1) max (-(boundingBox _object_a_decharger select 0 select 1))) max ((boundingBox _object_a_decharger select 1 select 0) max (-(boundingBox _object_a_decharger select 0 select 0))));
			_txt = "Unloading in progress.";
			cutText [_txt,"PLAIN DOWN"];
			systemChat ("Tow&Lift: "+str _txt+"");
			
			sleep 2;
			
			_object_a_decharger setPos [(getPos _transporteur select 0) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*sin (getDir _transporteur - 90+random 180)),(getPos _transporteur select 1) - ((_dimension_max+5+(random 10)-(boundingBox _transporteur select 0 select 1))*cos (getDir _transporteur - 90+random 180)),0];
			_object_a_decharger setVelocity [0, 0, 0];
			_txt = "Object has been unloaded from the vehicle.";
			cutText [_txt,"PLAIN DOWN"];
			systemChat ("Tow&Lift: "+str _txt+"");
		};
	} else {
		_txt = "Object has already been unloaded.";
		cutText [_txt,"PLAIN DOWN"];
		systemChat ("Tow&Lift: "+str _txt+"");
	};
	
	TOWING_local_lock = false;
};
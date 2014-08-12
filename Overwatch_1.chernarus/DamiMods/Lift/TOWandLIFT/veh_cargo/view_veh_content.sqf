disableSerialization;

if (TOWING_local_lock) then {
	_txt = "Tow/lift action currently in progress.";
	cutText [_txt,"PLAIN DOWN"];
	systemChat ("Tow&Lift: "+str _txt+"");
} else {
	TOWING_local_lock = true;
	private ["_tab_objects", "_tab_quantite", "_i", "_j", "_dlg_contents_vehicle","_transporteur", "_chargement_actuel", "_chargement_maxi", "_contents", "_tab_contents_regroupe"];
	_transporteur = _this select 0;
	uiNamespace setVariable ["Tow_settings_dlg_CV_transporteur", _transporteur];
	createDialog "Tow_settings_dlg_contents_vehicle";
	_contents = _transporteur getVariable "Tow_settings_objects_charges";
	_tab_objects = [];
	_tab_quantite = [];
	_chargement_actuel = 0;
	
	for [{_i = 0}, {_i < count _contents}, {_i = _i + 1}] do
	{
		private ["_object"];
		_object = _contents select _i;
		if !((typeOf _object) in _tab_objects) then
		{
			_tab_objects = _tab_objects + [typeOf _object];
			_tab_quantite = _tab_quantite + [1];
		} else {
			private ["_idx_object"];
			_idx_object = _tab_objects find (typeOf _object);
			_tab_quantite set [_idx_object, ((_tab_quantite select _idx_object) + 1)];
		};
		for [{_j = 0}, {_j < count TOWING_cargoObjects}, {_j = _j + 1}] do
		{
			if (_object isKindOf (TOWING_cargoObjects select _j select 0)) exitWith
			{
				_chargement_actuel = _chargement_actuel + (TOWING_cargoObjects select _j select 1);
			};
		};
	};
	_chargement_maxi = 0;
	for [{_i = 0}, {_i < count TOWING_VehiclesWithCargo}, {_i = _i + 1}] do
	{
		if (_transporteur isKindOf (TOWING_VehiclesWithCargo select _i select 0)) exitWith
		{
			_chargement_maxi = (TOWING_VehiclesWithCargo select _i select 1);
		};
	};
	
	#include "dlg_constantes.h"
	private ["_ctrl_liste"];
	_dlg_contents_vehicle = findDisplay Tow_settings_IDD_dlg_contents_vehicle;
	(_dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_titre) ctrlSetText "Vehicle cargo";
	(_dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_credits) ctrlSetText "Towing - Redone by Dami";
	(_dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_btn_decharger) ctrlSetText "Unload";
	(_dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_btn_fermer) ctrlSetText "Cancel";
	(_dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_capacite_vehicle) ctrlSetText (format ["Loading : %1/%2", _chargement_actuel, _chargement_maxi]);
	_ctrl_liste = _dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_liste_contents;
	if (count _tab_objects == 0) then {(_dlg_contents_vehicle displayCtrl Tow_settings_IDC_dlg_CV_btn_decharger) ctrlEnable false;} else {
		for [{_i = 0}, {_i < count _tab_objects}, {_i = _i + 1}] do {
			private ["_index", "_icone"];
			_icone = getText (configFile >> "CfgVehicles" >> (_tab_objects select _i) >> "icon");
			if (toString ([toArray _icone select 0]) == "\") then
			{
				_index = _ctrl_liste lbAdd (getText (configFile >> "CfgVehicles" >> (_tab_objects select _i) >> "displayName") + format [" (%1x)", _tab_quantite select _i]);
				_ctrl_liste lbSetPicture [_index, _icone];
			} else {
				if (!(isNil "R3F_ARTY_active") && (_tab_objects select _i) == "SatPhone") then
				{
					_index = _ctrl_liste lbAdd ("     " + "Artillery CQ" + format [" (%1x)", _tab_quantite select _i]);
				} else {
					_index = _ctrl_liste lbAdd ("     " + getText (configFile >> "CfgVehicles" >> (_tab_objects select _i) >> "displayName") + format [" (%1x)", _tab_quantite select _i]);
				};
			};
			_ctrl_liste lbSetData [_index, _tab_objects select _i];
		};
	};
	waitUntil (uiNamespace getVariable "Tow_settings_dlg_contents_vehicle");
	TOWING_local_lock = false;
};
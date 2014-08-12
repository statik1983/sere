_recipe = allBuildables select currentBuildRecipe;

_requeriments = [];
_classname = "";

_requeriments  = _recipe select 0;
_classname = _recipe select 1;

//Select the requeriments of materials
_recipeQtyT= _requeriments select 0;
_recipeQtyS= _requeriments select 1;
_recipeQtyW= _requeriments select 2;
_recipeQtyL= _requeriments select 3;
_recipeQtyM= _requeriments select 4;
_recipeQtyG= _requeriments select 5;
_recipeQtyE= _requeriments select 6;
_recipeQtyC= _requeriments select 7;
_recipeQtyP= _requeriments select 8;
_recipeQtyU= _requeriments select 9;
_recipeQtyA= _requeriments select 10;
_recipeQtyZ= _requeriments select 11;
_recipeQtyI= _requeriments select 12;
_recipeQtyJ= _requeriments select 13;
_recipeQtyN= _requeriments select 14;
_recipeQtyQ= _requeriments select 15;
_recipeQtyR= _requeriments select 16;
_recipeQtyB= _requeriments select 17;
_recipeQtyX= _requeriments select 18;

// Count mags in player inventory and add to an array
_mags = magazines player;
_qtyT=0;
_qtyS=0;
_qtyW=0;
_qtyL=0;
_qtyM=0;
_qtyG=0;
_qtyE=0;
_qtyC=0;
_qtyP=0;
_qtyU=0;
_qtyA=0;
_qtyZ=0;
_qtyI=0;
_qtyJ=0;
_qtyN=0;
_qtyQ=0;
_qtyR=0;
_qtyB=0;
_qtyX=0;


_buildables = [];
_mags = magazines player;

	if ("ItemTankTrap" in _mags) then {
		_qtyT = {_x == "ItemTankTrap"} count magazines player;
		_buildables set [count _buildables, _qtyT];
		_itemT = "ItemTankTrap";		
	} else { _qtyT = 0; _buildables set [count _buildables, _qtyT]; };
		
	if ("ItemSandbag" in _mags) then {
		_qtyS = {_x == "ItemSandbag"} count magazines player;
		_buildables set [count _buildables, _qtyS];
		_itemS = "ItemSandbag";		
	} else { _qtyS = 0; _buildables set [count _buildables, _qtyS]; };
		
	if ("ItemWire" in _mags) then {
		_qtyW = {_x == "ItemWire"} count magazines player;
		_buildables set [count _buildables, _qtyW];
		_itemW = "ItemWire";		
	} else { _qtyW = 0; _buildables set [count _buildables, _qtyW]; };

	if ("PartWoodPile" in _mags) then {
		_qtyL = {_x == "PartWoodPile"} count magazines player;
		_buildables set [count _buildables, _qtyL];
		_itemL = "PartWoodPile";		
	} else { _qtyL = 0; _buildables set [count _buildables, _qtyL]; };

	if ("PartGeneric" in _mags) then {
		_qtyM = {_x == "PartGeneric"} count magazines player;
		_buildables set [count _buildables, _qtyM];
		_itemM = "PartGeneric";		
	} else { _qtyM = 0; _buildables set [count _buildables, _qtyM]; };
		
	if ("HandGrenade_West" in _mags) then {
		_qtyG = {_x == "HandGrenade_West"} count magazines player;
		_buildables set [count _buildables, _qtyG];
		_itemG = "HandGrenade_West";
	} else { _qtyG = 0; _buildables set [count _buildables, _qtyG]; };

//-------------------------------------	
	
	if ("equip_scrapelectronics" in _mags) then {
        _qtyE = {_x == "equip_scrapelectronics"} count magazines player;
        _buildables set [count _buildables, _qtyE];
        _itemE = "equip_scrapelectronics";
    } else { _qtyE = 0; _buildables set [count _buildables, _qtyE]; };
	
	if ("equip_crate" in _mags) then {
        _qtyC = {_x == "equip_crate"} count magazines player;
        _buildables set [count _buildables, _qtyC];
        _itemC = "equip_crate";
    } else { _qtyC = 0; _buildables set [count _buildables, _qtyC]; };
		
	if ("equip_wood_pallet" in _mags) then {
        _qtyP = {_x == "equip_wood_pallet"} count magazines player;
        _buildables set [count _buildables, _qtyP];
        _itemP = "equip_wood_pallet";
    } else { _qtyP = 0; _buildables set [count _buildables, _qtyP]; };
	
	if ("equip_duct_tape" in _mags) then {
        _qtyU = {_x == "equip_duct_tape"} count magazines player;
        _buildables set [count _buildables, _qtyU];
        _itemU = "equip_duct_tape";
    } else { _qtyU = 0; _buildables set [count _buildables, _qtyU]; };

	if ("ItemCamoNet" in _mags) then {
        _qtyA = {_x == "ItemCamoNet"} count magazines player;
        _buildables set [count _buildables, _qtyA];
        _itemA = "ItemCamoNet";
    } else { _qtyA = 0; _buildables set [count _buildables, _qtyA]; };
	
	if ("PartGlass" in _mags) then {
        _qtyZ = {_x == "PartGlass"} count magazines player;
        _buildables set [count _buildables, _qtyZ];
        _itemZ = "PartGlass";
    } else { _qtyZ = 0; _buildables set [count _buildables, _qtyZ]; };

//-------------------------------------
	
	if ("equip_nails" in _mags) then {
        _qtyI = {_x == "equip_nails"} count magazines player;
        _buildables set [count _buildables, _qtyI];
        _itemI = "equip_nails";
    } else { _qtyI = 0; _buildables set [count _buildables, _qtyI]; };
	
	if ("ItemJerrycan" in _mags) then {
        _qtyJ = {_x == "ItemJerrycan"} count magazines player;
        _buildables set [count _buildables, _qtyJ];
        _itemJ = "ItemJerrycan";
    } else { _qtyJ = 0; _buildables set [count _buildables, _qtyJ]; };
	
	if ("ItemGenerator" in _mags) then {
        _qtyN = {_x == "ItemGenerator"} count magazines player;
        _buildables set [count _buildables, _qtyN];
        _itemN = "ItemGenerator";
    } else { _qtyN = 0; _buildables set [count _buildables, _qtyN]; };
	
	if ("equip_metal_sheet" in _mags) then {
        _qtyQ = {_x == "equip_metal_sheet"} count magazines player;
        _buildables set [count _buildables, _qtyQ];
        _itemQ = "equip_metal_sheet";
    } else { _qtyQ = 0; _buildables set [count _buildables, _qtyQ]; };
		
	if ("equip_rope" in _mags) then {
        _qtyR = {_x == "equip_rope"} count magazines player;
        _buildables set [count _buildables, _qtyR];
        _itemR = "equip_rope";
    } else { _qtyR = 0; _buildables set [count _buildables, _qtyR]; };
	
	if ("equip_brick" in _mags) then {
        _qtyB = {_x == "equip_brick"} count magazines player;
        _buildables set [count _buildables, _qtyB];
        _itemB = "equip_brick";
    } else { _qtyB = 0; _buildables set [count _buildables, _qtyB]; };
//-------------
	if ("ItemTent" in _mags) then {
        _qtyX = {_x == "ItemTent"} count magazines player;
        _buildables set [count _buildables, _qtyX];
        _itemX = "ItemTent";
    } else { _qtyX = 0; _buildables set [count _buildables, _qtyX]; };

_result = false;
_result = [_requeriments,_buildables] call BIS_fnc_areEqual;

//RESTRICTIONS ------------------------------
_restrictions=[];
_restrictions = _recipe select 2;

_toolbox=false;
_toolbox= _restrictions select 3;

_etool=false;
_etool= _restrictions select 4;

_medWait=false;
_longWait=false;
_medWait=_restrictions select 5;
_longWait=_restrictions select 6;

_removable=false;
_removable=_restrictions select 10;

_chance ="";
if (_removable) then {
    _chance="Rem: 30% Fail"
};
_timer="10 S";
if(_medWait) then {
    _timer="20 S";
    if (_removable) then {
        _chance="Rem: 70% Fail"
    };
};
if(_longWait) then {
    _timer="30 S";
    if (_removable) then {
        _chance="Rem: 95% Fail"
    };
} ;

_inBuilding=false;
_inBuilding=_restrictions select 7;

_road=false;
_road=_restrictions select 8;

_inTown=false;
_inTown=_restrictions select 9;
//--------------------------------------------

with uiNamespace do {

if (!_result) then { 
    (Build_Recipe_Dialog displayCtrl 1600) ctrlEnable false;
//UnShow the Build Button
} else {
    //Show it
    (Build_Recipe_Dialog displayCtrl 1600) ctrlEnable true;
};

    //Set ClassName
    (Build_Recipe_Dialog displayCtrl 1006) ctrlSetText format["%1",_classname];
    //Set Materials
	(Build_Recipe_Dialog displayCtrl 1000) ctrlSetText format["%2 / %1",_recipeQtyT,_qtyT];
    (Build_Recipe_Dialog displayCtrl 1002) ctrlSetText format["%2 / %1",_recipeQtyS,_qtyS];
    (Build_Recipe_Dialog displayCtrl 1001) ctrlSetText format["%2 / %1",_recipeQtyW,_qtyW];
    (Build_Recipe_Dialog displayCtrl 1003) ctrlSetText format["%2 / %1",_recipeQtyL,_qtyL];
    (Build_Recipe_Dialog displayCtrl 1022) ctrlSetText format["%2 / %1",_recipeQtyM,_qtyM];
    (Build_Recipe_Dialog displayCtrl 1005) ctrlSetText format["%2 / %1",_recipeQtyG,_qtyG];
	(Build_Recipe_Dialog displayCtrl 1004) ctrlSetText format["%2 / %1",_recipeQtyE,_qtyE];
    (Build_Recipe_Dialog displayCtrl 1019) ctrlSetText format["%2 / %1",_recipeQtyC,_qtyC];
	(Build_Recipe_Dialog displayCtrl 1020) ctrlSetText format["%2 / %1",_recipeQtyP,_qtyP];
	(Build_Recipe_Dialog displayCtrl 1029) ctrlSetText format["%2 / %1",_recipeQtyR,_qtyR];
	(Build_Recipe_Dialog displayCtrl 1023) ctrlSetText format["%2 / %1",_recipeQtyA,_qtyA];
	(Build_Recipe_Dialog displayCtrl 1030) ctrlSetText format["%2 / %1",_recipeQtyB,_qtyB];
	(Build_Recipe_Dialog displayCtrl 1027) ctrlSetText format["%2 / %1",_recipeQtyN,_qtyN];
	(Build_Recipe_Dialog displayCtrl 1026) ctrlSetText format["%2 / %1",_recipeQtyJ,_qtyJ];
	(Build_Recipe_Dialog displayCtrl 1025) ctrlSetText format["%2 / %1",_recipeQtyI,_qtyI];
	(Build_Recipe_Dialog displayCtrl 1028) ctrlSetText format["%2 / %1",_recipeQtyQ,_qtyQ];
	(Build_Recipe_Dialog displayCtrl 1021) ctrlSetText format["%2 / %1",_recipeQtyU,_qtyU];
	(Build_Recipe_Dialog displayCtrl 1024) ctrlSetText format["%2 / %1",_recipeQtyZ,_qtyZ];
	(Build_Recipe_Dialog displayCtrl 1111) ctrlSetText format["%2 / %1",_recipeQtyX,_qtyX];
	
    //Set Image
    (Build_Recipe_Dialog displayCtrl 1200) ctrlSetText format["buildRecipeBook\images\buildable\%1.jpg",_classname];
    
    //Set Restrictions
	(Build_Recipe_Dialog displayCtrl 1017) ctrlSetText format["%1",_toolbox];
	(Build_Recipe_Dialog displayCtrl 1016) ctrlSetText format["%1",_etool];
	(Build_Recipe_Dialog displayCtrl 1015) ctrlSetText format["%1",_timer];
	(Build_Recipe_Dialog displayCtrl 1014) ctrlSetText format["%1",_inBuilding];
	(Build_Recipe_Dialog displayCtrl 1011) ctrlSetText format["%1",_road];
	(Build_Recipe_Dialog displayCtrl 1012) ctrlSetText format["%1",_inTown];
	(Build_Recipe_Dialog displayCtrl 1013) ctrlSetText format["%1",_removable];
	(Build_Recipe_Dialog displayCtrl 1018) ctrlSetText format["%1",_chance];
};

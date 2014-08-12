//OLD FASHION AUTOMATED BUILD RECIPE LIST

_recipeBook = [];
{
	_requeriments  = _x select 0;
    
    _requeriments_string="";
    _i =0;
    {
        _letters=["T","S","W","L","M","G","E","C","P","U","A","Z","I","J","N","Q","R","B","X"];
        _qty="";
        _letter="";
        _qty_letter="";
        if (_x != 0) then {
            _qty = format["%1",_x];
            _letter= _letters select _i;
            _qty_letter=","+_qty+_letter;
        };
        _requeriments_string = format["%1%2",_requeriments_string,_qty_letter];
        //hint format["%1",_x];
        //sleep 1;
        _i = _i + 1;
    } foreach(_requeriments);
    
	_classname = _x select 1;
    
    _row = _classname +":"+ _requeriments_string;
    _recipeBook=_recipeBook + [_row];
	//_recipeBook = _recipeBook + _classname;
    
} foreach(allbuildables);

buildRecipeBook = _recipeBook;



"[ItemTankTrap, ItemSandbag, ItemWire, PartWoodPile, PartGeneric, HandGrenade_West, equip_scrapelectronics, equip_crate, equip_wood_pallet, equip_duct_tape, ItemCamoNet, PartGlass, equip_nails, ItemJerrycan, ItemGenerator, equip_metal_sheet, equip_rope, equip_brick, ItemTent]" hintC buildRecipeBook;
//[] call BIS_fnc_GUIeditor;
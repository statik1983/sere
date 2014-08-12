//Daimyo21's BaseBuilding 1.2
//Modified by Statik @ SERE DAYZ OVERWATCH UK

class Build_Recipe_Dialog
{
    idd = -1;
    onLoad="uiNamespace setVariable ['Build_Recipe_Dialog', _this select 0]";
    movingenable = true;
    onUnLoad="uiNamespace setVariable ['Build_Recipe_Dialog', nil]";
    
    class Controls
    {

class DialogBox: BOX
{
	idc = -1;
    text = "";
	x = 0.211851 * safezoneW + safezoneX;
	y = 0.194721 * safezoneH + safezoneY;
	w = 0.575881 * safezoneW;
	h = 0.631944 * safezoneH;
};  
class RecipeFrame: RscFrame
{
	idc = 1800;

	text = "Base Building Recipe Book";
	x = 0.211851 * safezoneW + safezoneX;
	y = 0.194721 * safezoneH + safezoneY;
	w = 0.575881 * safezoneW;
	h = 0.631944 * safezoneH;
};
class ObjectImage: RscPicture
{
	idc = 1200;

	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.621195 * safezoneW + safezoneX;
	y = 0.347186 * safezoneH + safezoneY;
	w = 0.162083 * safezoneW;
	h = 0.30952 * safezoneH;
};
class ClassNameFrame: RscFrame
{
	idc = 1801;

	text = "Materials needed:";
	x = 0.214286 * safezoneW + safezoneX;
	y = 0.2375 * safezoneH + safezoneY;
	w = 0.571685 * safezoneW;
	h = 0.542594 * safezoneH;
};
class ClassNameText: RscText
{
	idc = 1006;

	text = "CLASS NAME";
	x = 0.216212 * safezoneW + safezoneX;
	y = 0.209861 * safezoneH + safezoneY;
	w = 0.372727 * safezoneW;
	h = 0.0166667 * safezoneH;
};
class NextButton: RscButton
{
	idc = 1604;
	action = "_nil=[]ExecVM 'buildRecipeBook\nextBuildRecipe.sqf'";

	text = "Next Page";
	x = 0.712724 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;
};
class PrevButton: RscButton
{
	idc = 1603;
	action = "_nil=[]ExecVM 'buildRecipeBook\prevBuildRecipe.sqf'";

	text = "Previous Page";
	x = 0.214286 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;
};
class ShowButton: RscButton
{
	idc = 1600;
	action = "closeDialog 0;_nil=[]ExecVM 'dayz_code\compile\player_build2.sqf'";

	text = "Build!";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;
};
class ShowListButton: RscButton
{
	idc = 1601;
	action = "closeDialog 0;_nil=[]ExecVM 'buildRecipeBook\build_recipe_list_dialog.sqf'";

	text = "Show List";
	x = 0.579836 * safezoneW + safezoneX;
	y = 0.7875 * safezoneH + safezoneY;
	w = 0.0727273 * safezoneW;
	h = 0.0333333 * safezoneH;
};
//-------Tank Trap
class TankImageT: RscPicture
{
	idc = 1201;

	text = "dayz_equip\textures\equip_tanktrap_kit_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Tank Trap";
};
class TankTrapTextT: RscText
{
	idc = 1031;

	text = "Tank Trap";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.2925 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class TankQtyT: RscText
{
	idc = 1000;

	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//-------Tank Trap

//-------Wire Kit
class WireImageW: RscPicture
{
	idc = 1202;

	text = "dayz_equip\textures\equip_wire_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Wire Kit";
};
class WireFenceKitTextW: RscText
{
	idc = 1032;

	text = "Wire Kit";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class WireQtyW: RscText
{
	idc = 1001;

	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//-------Wire Kit

//-------Sand Bag
class SandBagImageS: RscPicture
{
	idc = 1203;

	text = "dayz_equip\textures\equip_sandbag_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Sand Bags";
};
class SandBagsTextS: RscText
{
	idc = 1033;

	text = "Sand Bags";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.4675 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class SandQtyS: RscText
{
	idc = 1002;

	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//-------Sand Bag

//-------Lumber
class LumberImageL: RscPicture
{
	idc = 1204;

	text = "dayz_equip\textures\equip_woodpile_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Lumber";
};
class LumberTextL: RscText
{
	idc = 1034;

	text = "Lumber";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class LumberQtyL: RscText
{
	idc = 1003;

	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//-------Lumber

//--------Scrap Electronics
class ElectronicsImageE: RscPicture
{
	idc = 1205;

	text = "z\addons\dayz_communityassets\pictures\scrapelectronics.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Scrap Electronics";
};
class ElectronicsTextE: RscText
{
	idc = 1035;

	text = "Electronics";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.6425 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class ElectronicsQtyE: RscText
{
	idc = 1004;

	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Scrap Electronics

//--------Grenade
class GrenadeImageG: RscPicture
{
	idc = 1206;

	text = "\CA\weapons\data\equip\m_M67_CA.paa";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Grenade";
};
class GrenadeTextG: RscText
{
	idc = 1036;

	text = "Grenade";
	x = 0.232143 * safezoneW + safezoneX;
	y = 0.73 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class GrenadeQtyG: RscText
{
	idc = 1005;

	text = "1";
	x = 0.258929 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Grenade

//--------Wooden Crate
class CrateImageC: RscPicture
{
	idc = 1210;

	text = "z\addons\dayz_communityassets\pictures\equip_crate.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Wooden Crate";
};
class CrateTextC: RscText
{
	idc = 1037;

	text = "Wooden Crate";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.2925 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class CrateQtyC: RscText
{
	idc = 1019;

	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Wooden Crate

//--------Wooden Pallet
class PalletImageP: RscPicture
{
	idc = 1211;
	
	text = "z\addons\dayz_communityassets\pictures\equip_wpallet_ca.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Wooden Pallet";
};
class PalletTextP: RscText
{
	idc = 1038;

	text = "Wooden Pallet";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class PalletQtyP: RscText
{
	idc = 1020;

	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Wooden Pallet

//--------Rope
class RopeImageR: RscPicture
{
	idc = 1212;

	text = "z\addons\dayz_communityassets\pictures\equip_rope_ca.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Rope";
};
class RopeTextR: RscText
{
	idc = 1039;

	text = "Rope";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.4675 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class RopeQtyR: RscText
{
	idc = 1021;

	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Rope

//--------Scrap Metal
class ScrapImage: RscPicture
{
	idc = 1213;

	text = "dayz_equip\textures\equip_genericparts_CA.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Scrap Metal";
};
class ScrapMetalTextM: RscText
{
	idc = 1040;

	text = "Scrap Metal";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class ScrapQtyM: RscText
{
	idc = 1022;

	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Scrap Metal

//--------Camo Net
class CamoNetImageA: RscPicture
{
	idc = 1214;

	text = "dayz_equip\textures\equip_tentbag_CA.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Camo Net";
};
class CamoNetTextA: RscText
{
	idc = 1041;

	text = "Camo Net";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.6425 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class CamoNetQtyA: RscText
{
	idc = 1023;

	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Camo Net

//--------Brick
class BrickImageB: RscPicture
{
	idc = 1215;

	text = "z\addons\dayz_communityassets\pictures\equip_brick.paa";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Bricks";
};
class BrickTextB: RscText
{
	idc = 1042;

	text = "Bricks";
	x = 0.321429 * safezoneW + safezoneX;
	y = 0.73 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class BricksQtyB: RscText
{
	idc = 1024;

	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Brick

//--------Generator
class GeneratorImageN: RscPicture
{
	idc = 1216;

	text = "dayz_equip\textures\equip_generator_ca.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Generator";
};
class GeneratorTextN: RscText
{
	idc = 1043;

	text = "Generator";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.2925 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class GeneratorQtyN: RscText
{
	idc = 1025;

	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Generator

//--------Jerry Can
class JerryCanImageJ: RscPicture
{
	idc = 1217;

	text = "dayz_equip\textures\equip_jerrycan_CA.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Jerry Can";
};
class JerryCanTextJ: RscText
{
	idc = 1044;

	text = "Jerry Can";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.38 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class JerryCanQtyJ: RscText
{
	idc = 1026;

	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.35 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Jerry Can

//--------Nails
class NailsImageI: RscPicture
{
	idc = 1218;

	text = "z\addons\dayz_communityassets\pictures\equip_nails_ca.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Nails";
};
class NailsTextI: RscText
{
	idc = 1045;

	text = "Nails";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.4675 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class NailsQtyI: RscText
{
	idc = 1027;

	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.2625 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Nails

//--------Metal Sheet
class MetalSheetImageQ: RscPicture
{
	idc = 1219;

	text = "dayz_equip\textures\equip_metal_CA.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Metal Sheet";
};
class MetalSheetTextQ: RscText
{
	idc = 1046;

	text = "Metal Sheet";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.555 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class MetalSheetQtyQ: RscText
{
	idc = 1028;

	text = "1";
	x = 0.4375 * safezoneW + safezoneX;
	y = 0.525 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Metal Sheet

//--------Duct Tape
class DuctTapeImageU: RscPicture
{
	idc = 1220;

	text = "z\addons\dayz_communityassets\pictures\equip_duct_tape.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.6125 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Duct Tape";
};
class DuctTapeTextU: RscText
{
	idc = 1047;

	text = "Duct Tape";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.6425 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class DuctTapeQtyU: RscText
{
	idc = 1029;

	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.4375 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Duct Tape

//--------Glass
class GlassImageZ: RscPicture
{
	idc = 1221;

	text = "dayz_equip\textures\equip_carglass_CA.paa";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Glass";
};
class GlassTextZ: RscText
{
	idc = 1048;

	text = "Glass";
	x = 0.410714 * safezoneW + safezoneX;
	y = 0.73 * safezoneH + safezoneY;
	w = 0.0995834 * safezoneW;
	h = 0.0188889 * safezoneH;
};
class GlassQtyZ: RscText
{
	idc = 1030;

	text = "1";
	x = 0.348214 * safezoneW + safezoneX;
	y = 0.7 * safezoneH + safezoneY;
	w = 0.050625 * safezoneW;
	h = 0.0277753 * safezoneH;
};
//--------Glass

class ReqFrame: RscFrame
{
	idc = 1802;

	text = "Requirements";
	x = 0.5 * safezoneW + safezoneX;
	y = 0.300167 * safezoneH + safezoneY;
	w = 0.115998 * safezoneW;
	h = 0.395369 * safezoneH;
};
class ToolboxImage: RscPicture
{
	idc = 1207;

	text = "dayz_equip\textures\equip_toolbox_CA.paa";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.347186 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Tool Box";
};
class Toolbox: RscText
{
	idc = 1017;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.347186 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class EToolImage: RscPicture
{
	idc = 1208;

	text = "dayz_equip\textures\equip_etool_CA.paa";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.394206 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Etool";
};
class etool: RscText
{
	idc = 1016;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.394206 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class TimeImage: RscPicture
{
	idc = 1209;

	text = "buildRecipeBook\images\timer.paa";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.441225 * safezoneH + safezoneY;
	w = 0.019375 * safezoneW;
	h = 0.0315319 * safezoneH;
	tooltip = "Timer";
};
class Time: RscText
{
	idc = 1015;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.441225 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class InBuildingText: RscText
{
	idc = 1007;

	text = "In Building:";
	x = 0.51 * safezoneW + safezoneX;
	y = 0.488245 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;
};
class InBuilding: RscText
{
	idc = 1014;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.488245 * safezoneH + safezoneY;
	w = 0.0313546 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class OnRoadText: RscText
{
	idc = 1008;

	text = "On Road:";
	x = 0.51 * safezoneW + safezoneX;
	y = 0.52351 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;
};
class OnRoad: RscText
{
	idc = 1011;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.52351 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class InTownText: RscText
{
	idc = 1009;

	text = "In Town:";
	x = 0.51 * safezoneW + safezoneX;
	y = 0.558775 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;
};
class InTown: RscText
{
	idc = 1012;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.558775 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class RemoveText: RscText
{
	idc = 1010;

	text = "Removable:";
	x = 0.51 * safezoneW + safezoneX;
	y = 0.605794 * safezoneH + safezoneY;
	w = 0.0542709 * safezoneW;
	h = 0.0249579 * safezoneH;
};
class removable: RscText
{
	idc = 1013;

	text = "False";
	x = 0.582633 * safezoneW + safezoneX;
	y = 0.605794 * safezoneH + safezoneY;
	w = 0.0297918 * safezoneW;
	h = 0.0221405 * safezoneH;
};
class chance: RscText
{
	idc = 1018;

	text = "Chance: 30%";
	x = 0.511018 * safezoneW + safezoneX;
	y = 0.652814 * safezoneH + safezoneY;
	w = 0.0959376 * safezoneW;
	h = 0.0221405 * safezoneH;
};
   };
};
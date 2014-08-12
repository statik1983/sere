if (hasInterface || isServer || isDedicated) exitWith{};
private ["_numb","_element","_num","_firstRun"];

if(isNil {ReAccur}) then { ReAccur = ["M1","M2","M3","M4","M5","M6"];};
if(isNil {MCarray2}) then { MCarray2 = [];};
if (count missionArray2 == 0) then
{
_element = ReAccur call BIS_fnc_selectRandom;
} else {
_numb = count missionArray2;
_num = floor (random _numb);
_element = missionArray2 select _num;
_Earray = [_element];
};
[] execVM format ["missions\medium\%1.sqf",_element];